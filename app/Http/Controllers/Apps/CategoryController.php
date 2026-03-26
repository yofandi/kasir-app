<?php

namespace App\Http\Controllers\Apps;

use Inertia\Inertia;
use App\Models\Category;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //get categories
        $categories = Category::when(request()->q, function ($categories) {
            $categories = $categories->where('name', 'like', '%' . request()->q . '%');
        })->latest()->paginate(5);

        //return inertia
        return Inertia::render('Apps/Categories/Index', [
            'categories' => $categories,
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return Inertia::render('Apps/Categories/Create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        /**
         * validate
         */
        $request->validate([
            'image'         => 'required|image|mimes:jpeg,jpg,png|max:500',
            'name'          => 'required|unique:categories',
            'description'   => 'required'
        ]);

        try {
            //upload image
            $image = $request->file('image');
            Storage::disk('public')->putFileAs('categories', $image, $image->hashName());

            //create category
            Category::create([
                'image'         => $image->hashName(),
                'name'          => $request->name,
                'description'   => $request->description
            ]);

            //redirect
            return redirect()->route('apps.categories.index');
        } catch (\Exception $e) {
            // Jika upload gagal, hapus file jika sudah terupload sebagian
            if (isset($image) && Storage::disk('public')->exists('categories/' . $image->hashName())) {
                Storage::disk('public')->delete('categories/' . $image->hashName());
            }

            // Redirect back dengan error message
            return redirect()->back()->withErrors(['image' => 'Failed to upload image. Please try again.']);
        }
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
    public function edit(Category $category)
    {
        return Inertia::render('Apps/Categories/Edit', [
            'category' => $category,
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Category $category)
    {
        /**
         * validate
         */
        $request->validate([
            'name'          => 'required|unique:categories,name,' . $category->id,
            'description'   => 'required'
        ]);

        //check image update
        if ($request->file('image')) {

            try {
                //remove old image
                Storage::disk('public')->delete('categories/' . basename($category->image));

                //upload new image
                $image = $request->file('image');
                Storage::disk('public')->putFileAs('categories', $image, $image->hashName());

                //update category with new image
                $category->update([
                    'image' => $image->hashName(),
                    'name' => $request->name,
                    'description'   => $request->description
                ]);
            } catch (\Exception $e) {
                // Jika upload gagal, redirect back dengan error
                return redirect()->back()->withErrors(['image' => 'Failed to update image. Please try again.']);
            }
        }

        //update category without image
        $category->update([
            'name'          => $request->name,
            'description'   => $request->description
        ]);

        //redirect
        return redirect()->route('apps.categories.index');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        try {
            //find by ID
            $category = Category::findOrFail($id);

            //remove image
            Storage::disk('public')->delete('categories/' . basename($category->image));

            //delete
            $category->delete();

            //redirect
            return redirect()->route('apps.categories.index');
        } catch (\Exception $e) {
            // Jika delete gagal, redirect back dengan error
            return redirect()->back()->withErrors(['delete' => 'Failed to delete category. Please try again.']);
        }
    }
}
