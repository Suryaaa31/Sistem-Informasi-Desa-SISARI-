<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\PengajuanSurat;
use Illuminate\Http\Request;

class PengajuanSuratController extends Controller
{
    public function index(Request $request)
    {
        $user = $request->user();
        if ($user->role === 'admin') {
            $surat = PengajuanSurat::with('user')->latest()->get();
        } else {
            $surat = PengajuanSurat::with('user')->where('user_id', $user->id)->latest()->get();
        }
        return response()->json($surat);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'jenis_surat' => 'required|string',
            'keterangan' => 'required|string',
        ]);

        $surat = PengajuanSurat::create([
            'user_id' => $request->user()->id,
            'jenis_surat' => $validated['jenis_surat'],
            'keterangan' => $validated['keterangan'],
            'status' => 'pending',
            'data_json' => [] // Fixed column name
        ]);

        return response()->json([
            'message' => 'Pengajuan surat berhasil dibuat',
            'data' => $surat
        ], 201);
    }

    public function show($id)
    {
        $surat = PengajuanSurat::with('user')->findOrFail($id);
        return response()->json($surat);
    }

    public function update(Request $request, string $id)
    {
        $surat = PengajuanSurat::findOrFail($id);
        
        $validated = $request->validate([
            'status' => 'required|in:pending,diproses,disetujui,ditolak',
            'file_pdf' => 'nullable|string', // Assuming filtering saving file path/url
        ]);

        $surat->update($validated);

        return response()->json([
            'message' => 'Status surat berhasil diperbarui',
            'data' => $surat
        ]);
    }
}
