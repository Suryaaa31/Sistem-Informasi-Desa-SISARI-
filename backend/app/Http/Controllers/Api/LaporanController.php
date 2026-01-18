<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Laporan;
use Illuminate\Http\Request;
use Barryvdh\DomPDF\Facade\Pdf;

class LaporanController extends Controller
{
    public function index(Request $request)
    {
        // Eager load user to get name
        $user = $request->user();
        
        if ($user->role === 'admin') {
            $laporan = Laporan::with('user')->latest()->get();
        } else {
            $laporan = Laporan::with('user')->where('user_id', $user->id)->latest()->get();
        }
        
        return response()->json($laporan);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'judul' => 'required|string|max:255',
            'lokasi' => 'required|string|max:255',
            'deskripsi' => 'required|string',
            'foto' => 'nullable|image|max:2048' 
        ]);

        $fotoPath = null;
        if ($request->hasFile('foto')) {
            $fotoPath = $request->file('foto')->store('laporan', 'public');
            // convert to public URL path logic often handled by Accessor or full url
            // store('laporan', 'public') saves to storage/app/public/laporan
            // We save the path relative to storage root usually, or full url if preferred.
            // Let's safe the relative path 'laporan/filename.jpg' and rely on accessors or frontend to prepend /storage/
        }

        $laporan = Laporan::create([
            'user_id' => $request->user()->id,
            'judul' => $validated['judul'],
            'lokasi' => $validated['lokasi'],
            'deskripsi' => $validated['deskripsi'],
            'status' => 'pending',
            'foto' => $fotoPath
        ]);

        return response()->json([
            'message' => 'Laporan berhasil kirim',
            'data' => $laporan
        ], 201);
    }

    public function update(Request $request, string $id)
    {
        $laporan = Laporan::findOrFail($id);
        
        $validated = $request->validate([
            'status' => 'required|in:pending,diproses,selesai,ditolak',
        ]);

        $laporan->update($validated);

        return response()->json([
            'message' => 'Status laporan berhasil diperbarui',
            'data' => $laporan
        ]);
    }

    public function exportPdf()
    {
        $laporan = Laporan::with('user')->get();
        
        $pdf = Pdf::loadView('pdf.laporan', ['laporan' => $laporan]);
        
        return $pdf->download('laporan-warga-sisari.pdf');
    }
}
