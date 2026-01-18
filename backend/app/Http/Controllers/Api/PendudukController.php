<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Penduduk;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use App\Exports\PendudukExport;
use Maatwebsite\Excel\Facades\Excel;
use Barryvdh\DomPDF\Facade\Pdf;

class PendudukController extends Controller
{
    public function exportExcel()
    {
        return Excel::download(new PendudukExport, 'data_penduduk.xlsx');
    }

    public function exportPdf()
    {
        $data = Penduduk::all();
        $pdf = Pdf::loadView('pdf.penduduk', compact('data'));
        return $pdf->download('data_penduduk.pdf');
    }
    // GET /api/admin/penduduk
    public function index()
    {
        $penduduk = Penduduk::orderBy('nama', 'asc')->get();
        return response()->json($penduduk);
    }

    // POST /api/admin/penduduk
    public function store(Request $request)
    {
        $validated = $request->validate([
            'nik' => 'required|numeric|digits:16|unique:penduduk,nik',
            'nama' => 'required|string|max:255',
            'tempat_lahir' => 'required|string|max:255',
            'tgl_lahir' => 'required|date',
            'jenis_kelamin' => 'required|in:Laki-laki,Perempuan',
            'agama' => 'required|string|max:50',
            'pendidikan' => 'required|string|max:100',
            'status_perkawinan' => 'required|in:Lajang,Menikah,Cerai Hidup,Cerai Mati',
            'status_kependudukan' => 'required|in:Aktif,Pindah,Meninggal',
            'pekerjaan' => 'required|string|max:100',
            'no_telp' => 'nullable|string|max:20',
        ]);

        $penduduk = Penduduk::create($validated);

        return response()->json([
            'message' => 'Data penduduk berhasil ditambahkan',
            'data' => $penduduk
        ], 201);
    }

    // GET /api/admin/penduduk/{id}
    public function show(string $id)
    {
        $penduduk = Penduduk::findOrFail($id);
        return response()->json($penduduk);
    }

    // PUT /api/admin/penduduk/{id}
    public function update(Request $request, string $id)
    {
        $penduduk = Penduduk::findOrFail($id);

        $validated = $request->validate([
            'nik' => ['required', 'numeric', 'digits:16', Rule::unique('penduduk')->ignore($penduduk->id)],
            'nama' => 'required|string|max:255',
            'tempat_lahir' => 'required|string|max:255',
            'tgl_lahir' => 'required|date',
            'jenis_kelamin' => 'required|in:Laki-laki,Perempuan',
            'agama' => 'required|string|max:50',
            'pendidikan' => 'required|string|max:100',
            'status_perkawinan' => 'required|in:Lajang,Menikah,Cerai Hidup,Cerai Mati',
            'status_kependudukan' => 'required|in:Aktif,Pindah,Meninggal',
            'pekerjaan' => 'required|string|max:100',
            'no_telp' => 'nullable|string|max:20',
        ]);

        $penduduk->update($validated);

        return response()->json([
            'message' => 'Data penduduk berhasil diperbarui',
            'data' => $penduduk
        ]);
    }

    // DELETE /api/admin/penduduk/{id}
    public function destroy(string $id)
    {
        $penduduk = Penduduk::findOrFail($id);
        $penduduk->delete();

        return response()->json([
            'message' => 'Data penduduk berhasil dihapus'
        ]);
    }
}
