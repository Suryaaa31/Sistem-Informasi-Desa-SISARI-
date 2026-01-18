<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Laporan extends Model
{
    protected $table = 'laporan';
    
    protected $fillable = [
        'user_id', 'judul', 'lokasi', 'deskripsi', 'kategori', 'foto', 'status'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
