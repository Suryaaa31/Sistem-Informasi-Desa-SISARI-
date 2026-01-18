<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return response()->json([
        'message' => 'SISARI Backend API is Running',
        'status' => 'connected',
        'docs' => url('/api/documentation')
    ]);
});
