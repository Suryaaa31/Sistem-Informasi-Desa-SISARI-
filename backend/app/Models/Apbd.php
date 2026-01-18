<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Apbd extends Model
{
    protected $table = 'apbd';

    protected $fillable = [
        'judul',
        'nilai',
        'kategori',
        'tahun'
    ];
}
