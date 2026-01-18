<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\DashboardController;
use App\Http\Controllers\Api\AuthController;

// Public Routes
Route::post('/login', [AuthController::class, 'login']);
Route::post('/register', [AuthController::class, 'register']);
Route::get('/debug-users', function() {
    return \App\Models\User::all()->map(function($u) {
        return [
            'id' => $u->id,
            'nik' => $u->nik,
            'name' => $u->name,
            'email' => $u->email,
            'password_hash_len' => strlen($u->password),
            'password_preview' => substr($u->password, 0, 10) . '...',
            'role' => $u->role
        ];
    });
});
Route::get('/stats/dashboard', [DashboardController::class, 'index']);
Route::get('/public/berita', [\App\Http\Controllers\Api\BeritaController::class, 'index']);
Route::get('/public/berita/{id}', [\App\Http\Controllers\Api\BeritaController::class, 'show']);

Route::get('/debug-berita', function() {
    return \App\Models\Berita::all()->map(function($b) {
        return [
            'judul' => $b->judul,
            'thumbnail_db' => $b->thumbnail,
            'full_url_test' => asset($b->thumbnail)
        ];
    });
});

// Protected Routes
Route::middleware(['auth:sanctum'])->group(function () {
    Route::get('/user', function (Request $request) {
        return $request->user();
    });

    Route::get('/debug-penduduk', function () {
        return \App\Models\Penduduk::all(['nama', 'status_kependudukan']);
    });



    Route::post('/logout', [AuthController::class, 'logout']);
    
    // Convert to General Resource Routes (Controller handles Role check)
    Route::apiResource('surat', \App\Http\Controllers\Api\PengajuanSuratController::class);
    Route::apiResource('laporan', \App\Http\Controllers\Api\LaporanController::class);
    
    // Admin Routes
    Route::group(['prefix' => 'admin'], function () {
        Route::get('penduduk/export/excel', [\App\Http\Controllers\Api\PendudukController::class, 'exportExcel']);
        Route::get('penduduk/export/pdf', [\App\Http\Controllers\Api\PendudukController::class, 'exportPdf']);
        Route::apiResource('penduduk', \App\Http\Controllers\Api\PendudukController::class);
        
        // Laporan Routes
        Route::get('laporan', [\App\Http\Controllers\Api\LaporanController::class, 'index']);
        Route::put('laporan/{id}', [\App\Http\Controllers\Api\LaporanController::class, 'update']);
        Route::get('laporan/export/pdf', [\App\Http\Controllers\Api\LaporanController::class, 'exportPdf']);

        // Surat Routes
        Route::apiResource('surat', \App\Http\Controllers\Api\PengajuanSuratController::class);

        // Berita Routes
        Route::apiResource('berita', \App\Http\Controllers\Api\BeritaController::class);
    });

    // Future routes:
    // Route::post('/surat', [PengajuanSuratController::class, 'store']);
});
