<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Penduduk extends Model
{
    use HasFactory;
    
    protected $table = 'penduduk';

    protected $fillable = [
        'nik', 'nama', 'tempat_lahir', 'tgl_lahir', 'jenis_kelamin',
        'agama', 'pendidikan', 'status_perkawinan', 'status_kependudukan',
        'pekerjaan', 'no_telp'
    ];
}
