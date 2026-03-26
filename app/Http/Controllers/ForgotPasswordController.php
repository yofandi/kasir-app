<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Password;
use Inertia\Inertia;

class ForgotPasswordController extends Controller
{
    public function sendResetLink(Request $request)
    {
        $request->validate([
            'email' => ['required', 'email'],
        ]);

        $status = Password::sendResetLink(
            $request->only('email')
        );

        if ($status === Password::RESET_LINK_SENT) {
            return redirect('/auth/forgotPassword')->with('status', __($status));
        } else {
            return redirect('/auth/forgotPassword')
                ->withInput($request->only('email'))
                ->withErrors(['email' => __($status)]);
        }
    }
}
