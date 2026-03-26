<?php

namespace App\Http\Controllers\Apps;

use App\Models\User;
use Inertia\Inertia;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;
use App\Http\Controllers\Controller;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //get users
        $users = User::when(request()->q, function ($users) {
            $users = $users->where('name', 'like', '%' . request()->q . '%');
        })->with('roles')->latest()->paginate(5);

        //return inertia
        return Inertia::render('Apps/Users/Index', [
            'users' => $users
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //get roles
        $roles = Role::all();

        //return inertia
        return Inertia::render('Apps/Users/Create', [
            'roles' => $roles
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        // Debug: tampilkan semua data yang diterima
        // dd($request->all());

        /**
         * Validate request
         */
        $request->validate([
            'name'     => 'required',
            'email'    => 'required|unique:users',
            'password' => 'required|confirmed'
        ]);

        /**
         * Create user
         */
        $user = User::create([
            'name'     => $request->name,
            'email'    => $request->email,
            'password' => bcrypt($request->password)
        ]);

        //assign roles to user
        $user->assignRole($request->roles);

        //redirect
        return redirect()->route('apps.users.index');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //get user
        $user = User::with('roles')->findOrFail($id);

        //get roles
        $roles = Role::all();

        //return inertia
        return Inertia::render('Apps/Users/Edit', [
            'user' => $user,
            'roles' => $roles
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, User $user)
    {
        // dd($user->id);
        /**
         * validate request
         */
        $request->validate([
            'name'     => 'required',
            'email'    => 'required|unique:users,email,' . $user->id,
            'password' => 'nullable|confirmed'
        ]);

        /**
         * check password is empty
         */
        if ($request->password == '') {

            $user->update([
                'name'     => $request->name,
                'email'    => $request->email
            ]);
        } else {

            $user->update([
                'name'     => $request->name,
                'email'    => $request->email,
                'password' => bcrypt($request->password)
            ]);
        }

        //assign roles to user
        $user->syncRoles($request->roles);

        //redirect
        return redirect()->route('apps.users.index');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //find user
        $user = User::findOrFail($id);

        //delete user
        $user->delete();

        //redirect
        return redirect()->route('apps.users.index');
    }
}
