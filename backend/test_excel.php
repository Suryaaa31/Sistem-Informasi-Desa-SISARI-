<?php

require __DIR__ . '/vendor/autoload.php';

$app = require_once __DIR__ . '/bootstrap/app.php';

$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

try {
    echo "Checking PendudukExport class...\n";
    if (class_exists(\App\Exports\PendudukExport::class)) {
        echo "PendudukExport class exists.\n";
    } else {
        echo "PendudukExport class NOT found.\n";
    }

    echo "Checking Maatwebsite Excel Facade...\n";
    if (class_exists(\Maatwebsite\Excel\Facades\Excel::class)) {
        echo "Excel Facade exists.\n";
    } else {
        echo "Excel Facade NOT found.\n";
    }

    echo "Attempting to create instance...\n";
    $export = new \App\Exports\PendudukExport();
    echo "Instance created successfully.\n";

    echo "Testing Excel processing (dry run)...\n";
    // We can't easily test download() here without HTTP, but we can test store() or raw() if needed.
    // However, just instantiation usually fails if interfaces are missing.

} catch (Throwable $e) {
    echo "ERROR: " . $e->getMessage() . "\n";
    echo $e->getTraceAsString();
}
