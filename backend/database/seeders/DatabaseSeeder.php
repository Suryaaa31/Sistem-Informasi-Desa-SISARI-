<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use App\Models\Penduduk;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        // 1. Create Admin
        User::create([
            'nik' => 'admin', 
            'name' => 'Administrator',
            'email' => 'admin@desa.id',
            'password' => Hash::make('password'),
            'role' => 'admin'
        ]);

        // 2. Create Masyarakat User
        User::create([
            'nik' => '1234567890123456',
            'name' => 'Budi Warga',
            'email' => 'budi@desa.id',
            'password' => Hash::make('password'),
            'role' => 'masyarakat'
        ]);

        // 3. Mock Penduduk Data
        Penduduk::create([
            'nik' => '1234567890123456',
            'nama' => 'Budi Warga',
            'tempat_lahir' => 'Kendalsari',
            'tgl_lahir' => '1990-01-01',
            'jenis_kelamin' => 'Laki-laki',
            'agama' => 'Islam',
            'pendidikan' => 'SMA',
            'status_perkawinan' => 'Menikah',
            'status_kependudukan' => 'Aktif',
            'pekerjaan' => 'Wiraswasta',
            'no_telp' => '08123456789'
        ]);
        
        // Add more mock data for stats
        // Penduduk::factory()->count(10)->create(); // Requires factory, skipping for now to keep simple manual create
    }
}
