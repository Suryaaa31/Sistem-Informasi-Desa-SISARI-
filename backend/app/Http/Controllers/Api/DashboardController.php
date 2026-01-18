<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Penduduk;
use App\Models\Berita;
use App\Models\Apbd;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index()
    {
        // Calculate Statistics
        // Calculate Statistics
        // Total should probably reflect ALL data entry? Or just Living? 
        // Let's make Total = All Records, and add breakdown if needed.
        $totalPenduduk = Penduduk::count(); 
        $lakiLaki = Penduduk::where('jenis_kelamin', 'Laki-laki')->count();
        $perempuan = Penduduk::where('jenis_kelamin', 'Perempuan')->count();
        // Portable age calculation
        $fiveYearsAgo = now()->subYears(5)->format('Y-m-d');
        $sixtyYearsAgo = now()->subYears(60)->format('Y-m-d');

        $balita = Penduduk::where('status_kependudukan', 'Aktif')
            ->where('tgl_lahir', '>=', $fiveYearsAgo)->count();
            
        $lansia = Penduduk::where('status_kependudukan', 'Aktif')
            ->where('tgl_lahir', '<=', $sixtyYearsAgo)->count();

        // Latest News
        $berita = Berita::latest()->take(3)->get();
        // Latest Emergency Info (distinct from latest news list)
        $emergency = Berita::where('kategori', 'Info Darurat')->latest()->first();

        // APBD Summary
        $apbd = []; // Apbd::where('tahun', date('Y'))->get()->groupBy('kategori');

        // Admin Specific Stats
        // Wrap in try catch or just comment out if suspected
        $suratPending = 0; // \App\Models\PengajuanSurat::where('status', 'pending')->count();
        $laporanBaru = 0; // \App\Models\Laporan::where('status', 'pending')->count();
        
        try {
            if (class_exists(\App\Models\PengajuanSurat::class)) {
                 $suratPending = \App\Models\PengajuanSurat::where('status', 'pending')->count();
            }
            if (class_exists(\App\Models\Laporan::class)) {
                 $laporanBaru = \App\Models\Laporan::where('status', 'pending')->count();
            }
             // $apbd = Apbd::where('tahun', date('Y'))->get()->groupBy('kategori');
        } catch (\Exception $e) {
            // Ignore for now
        }

        return response()->json([
            'stats' => [
                'total' => $totalPenduduk,
                'laki_laki' => $lakiLaki,
                'perempuan' => $perempuan,
                'balita' => $balita,
                'lansia' => $lansia,
                'surat_pending' => $suratPending,
                'laporan_baru' => $laporanBaru,
            ],
            'berita' => $berita,
            'emergency' => $emergency,
            'apbd' => $apbd
        ]);
    }
}
