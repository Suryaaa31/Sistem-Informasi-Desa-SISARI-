<?php

$file = __DIR__ . '/vendor/composer/autoload_psr4.php';
$content = file_get_contents($file);

if (strpos($content, 'Maatwebsite') !== false) {
    echo "Already fixed.\n";
    exit;
}

$newLine = "    'Maatwebsite\\\\Excel\\\\' => array(\$vendorDir . '/maatwebsite/excel/src'),\n";
$target = "'App\\\\' => array";

$newContent = str_replace($target, $newLine . "    " . $target, $content);

file_put_contents($file, $newContent);
echo "Fixed autoload_psr4.php\n";
