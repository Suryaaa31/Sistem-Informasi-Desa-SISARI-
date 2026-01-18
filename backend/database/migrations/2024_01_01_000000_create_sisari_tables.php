<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        // 1. Users Table (Modify default or create new)
        // Note: Laravel 11 uses 0001_01_01_000000_create_users_table.php by default.
        // We will modify that or add fields here. Let's create a fresh migration for simplicity
        // assuming standard Laravel user table exists, we add fields.

        Schema::table('users', function (Blueprint $table) {
            if (!Schema::hasColumn('users', 'nik')) {
                $table->string('nik')->unique()->nullable()->after('id');
            }
            if (!Schema::hasColumn('users', 'role')) {
                $table->enum('role', ['admin', 'masyarakat'])->default('masyarakat')->after('password');
            }
        });

        // 2. Penduduk Table
        Schema::create('penduduk', function (Blueprint $table) {
            $table->id();
            $table->string('nik')->unique();
            $table->string('nama');
            $table->string('tempat_lahir');
            $table->date('tgl_lahir');
            $table->enum('jenis_kelamin', ['Laki-laki', 'Perempuan']);
            $table->string('agama');
            $table->string('pendidikan');
            $table->enum('status_perkawinan', ['Lajang', 'Menikah', 'Cerai Hidup', 'Cerai Mati']);
            $table->enum('status_kependudukan', ['Aktif', 'Pindah', 'Meninggal']);
            $table->string('pekerjaan');
            $table->string('no_telp')->nullable();
            $table->timestamps();
        });

        // 3. Pengajuan Surat Table
        Schema::create('pengajuan_surat', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
            $table->string('jenis_surat');
            $table->json('data_json'); // Stores dynamic form data
            $table->enum('status', ['pending', 'diproses', 'disetujui', 'ditolak'])->default('pending');
            $table->string('file_pdf')->nullable(); // Path to generated PDF
            $table->timestamps();
        });

        // 4. Laporan Table
        Schema::create('laporan', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
            $table->string('judul');
            $table->text('deskripsi');
            $table->string('kategori');
            $table->string('foto')->nullable();
            $table->string('status')->default('Diterima'); // Diterima, Ditindaklanjuti, Selesai
            $table->timestamps();
        });

        // 5. Berita Table
        Schema::create('berita', function (Blueprint $table) {
            $table->id();
            $table->string('judul');
            $table->text('konten'); // or longText for rich text
            $table->string('kategori');
            $table->string('thumbnail')->nullable();
            $table->timestamps();
        });

        // 6. APBD Table
        Schema::create('apbd', function (Blueprint $table) {
            $table->id();
            $table->string('judul');
            $table->decimal('nilai', 15, 2);
            $table->string('kategori'); // Pendapatan, Belanja
            $table->year('tahun');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('apbd');
        Schema::dropIfExists('berita');
        Schema::dropIfExists('laporan');
        Schema::dropIfExists('pengajuan_surat');
        Schema::dropIfExists('penduduk');
        
        Schema::table('users', function (Blueprint $table) {
            $table->dropColumn(['nik', 'role']);
        });
    }
};
