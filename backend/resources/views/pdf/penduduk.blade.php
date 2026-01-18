<!DOCTYPE html>
<html>
<head>
    <title>Data Penduduk</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 10px;
        }
        th, td {
            border: 1px solid black;
            padding: 5px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        h2 {
            text-align: center;
        }
    </style>
</head>
<body>
    <h2>Laporan Data Penduduk</h2>
    <table>
        <thead>
            <tr>
                <th>NIK</th>
                <th>Nama</th>
                <th>TTL</th>
                <th>L/P</th>
                <th>Agama</th>
                <th>Pendidikan</th>
                <th>Pekerjaan</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            @foreach($data as $p)
            <tr>
                <td>{{ $p->nik }}</td>
                <td>{{ $p->nama }}</td>
                <td>{{ $p->tempat_lahir }}, {{ $p->tgl_lahir }}</td>
                <td>{{ $p->jenis_kelamin == 'Laki-laki' ? 'L' : 'P' }}</td>
                <td>{{ $p->agama }}</td>
                <td>{{ $p->pendidikan }}</td>
                <td>{{ $p->pekerjaan }}</td>
                <td>{{ $p->status_kependudukan }}</td>
            </tr>
            @endforeach
        </tbody>
    </table>
</body>
</html>
