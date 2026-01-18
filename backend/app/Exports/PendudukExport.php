<?php

namespace App\Exports;

use App\Models\Penduduk;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;

class PendudukExport implements FromCollection, WithHeadings, WithMapping
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return Penduduk::all();
    }

    public function headings(): array
    {
        return [
            'NIK',
            'Nama',
            'Tempat Lahir',
            'Tanggal Lahir',
            'Jenis Kelamin',
            'Agama',
            'Pendidikan',
            'Pekerjaan',
            'Status Perkawinan',
            'Status Kependudukan',
            'Nomor Telepon',
        ];
    }

    public function map($penduduk): array
    {
        return [
            $penduduk->nik,
            $penduduk->nama,
            $penduduk->tempat_lahir,
            $penduduk->tgl_lahir,
            $penduduk->jenis_kelamin,
            $penduduk->agama,
            $penduduk->pendidikan,
            $penduduk->pekerjaan,
            $penduduk->status_perkawinan,
            $penduduk->status_kependudukan,
            $penduduk->no_telp,
        ];
    }
}
