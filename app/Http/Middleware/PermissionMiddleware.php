<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PermissionMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @param  string  $permission
     * @return mixed
     */
    public function handle(Request $request, Closure $next, $permission)
    {
        if (!Auth::check()) {
            // Jika belum login, redirect ke login
            return redirect()->route('login');
        }

        $user = Auth::user();

        if (!method_exists($user, 'hasPermissionTo') || !$user->hasPermissionTo($permission)) {
            // Jika user tidak punya permission, redirect ke halaman yang sesuai
            // Misal ke halaman dashboard atau halaman error 403
            return redirect()->route('apps.dashboard')->with('error', 'Anda tidak memiliki akses ke halaman ini.');
        }

        return $next($request);
    }
}
