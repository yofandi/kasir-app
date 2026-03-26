<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;

class InertiaExampleController extends Controller
{
    public function index()
    {
        return Inertia::render('Dashboard', [
            'message' => 'Welcome to the Inertia.js powered dashboard!',
        ]);
    }

    public function post(Request $request)
    {
        // 1. Validasi Data
        // Validasi input dari form login
        $request->validate([
            'email' => ['required', 'string', 'email'],
            'password' => ['required', 'string'],
        ]);

        $dataYangDiterima = $request->all();

        return response()->json([
            'message' => 'Data telah berhasil diterima (tanpa proses otentikasi).',
            'received_data' => $dataYangDiterima,
            // Anda bisa juga hanya mengembalikan data yang spesifik:
            // 'email' => $request->email,
            // 'password' => $request->password,
        ]);
    }
}
