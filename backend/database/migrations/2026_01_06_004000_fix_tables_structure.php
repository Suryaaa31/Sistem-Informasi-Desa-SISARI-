<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // Fix Pengajuan Surat
        Schema::table('pengajuan_surat', function (Blueprint $table) {
            $table->text('keterangan')->nullable()->after('jenis_surat');
        });

        // Fix Laporan
        Schema::table('laporan', function (Blueprint $table) {
            $table->string('lokasi')->after('judul')->nullable(); // Add lokasi
            $table->string('kategori')->nullable()->change(); // Make kategori nullable if not sent
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('pengajuan_surat', function (Blueprint $table) {
            $table->dropColumn('keterangan');
        });

        Schema::table('laporan', function (Blueprint $table) {
            $table->dropColumn('lokasi');
        });
    }
};
