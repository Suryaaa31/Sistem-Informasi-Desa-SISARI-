<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Berita;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class BeritaController extends Controller
{
    public function index()
    {
        $berita = Berita::latest()->get();
        return response()->json($berita);
    }

    public function show($id)
    {
        $berita = Berita::findOrFail($id);
        return response()->json($berita);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'judul' => 'required|string|max:255',
            'kategori' => 'required|string|max:50',
            'konten' => 'required|string',
            'thumbnail' => 'nullable|image|max:2048', // Max 2MB
        ]);

        if ($request->hasFile('thumbnail')) {
            $path = $request->file('thumbnail')->store('berita', 'public');
            $validated['thumbnail'] = Storage::url($path);
        }

        $berita = Berita::create($validated);

        return response()->json([
            'message' => 'Berita berhasil ditambahkan',
            'data' => $berita
        ]);
    }

    public function update(Request $request, string $id)
    {
        $berita = Berita::findOrFail($id);
        
        $validated = $request->validate([
            'judul' => 'required|string|max:255',
            'kategori' => 'required|string|max:50',
            'konten' => 'required|string',
            'thumbnail' => 'nullable|image|max:2048',
        ]);

        if ($request->hasFile('thumbnail')) {
            // Delete old valid thumbnail if exists
            // Storage::delete(...) 
            $path = $request->file('thumbnail')->store('berita', 'public');
            $validated['thumbnail'] = Storage::url($path);
        }

        $berita->update($validated);

        return response()->json([
            'message' => 'Berita berhasil diperbarui',
            'data' => $berita
        ]);
    }

    public function destroy(string $id)
    {
        $berita = Berita::findOrFail($id);
        $berita->delete();
        return response()->json(['message' => 'Berita berhasil dihapus']);
    }
}
