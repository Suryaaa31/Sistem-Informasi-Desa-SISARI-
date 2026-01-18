<?php
$host = '127.0.0.1';
$port = 3306;
$user = 'root';
$pass = '';
$dbname = 'sisari';

try {
    $pdo = new PDO("mysql:host=$host;port=$port", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->exec("CREATE DATABASE IF NOT EXISTS `$dbname`");
    echo "Database created successfully or already exists.";
} catch (PDOException $e) {
    if (str_contains($e->getMessage(), 'Access denied')) {
        echo "Error: Access denied. Please check your username/password.";
    } else {
        echo "Error: " . $e->getMessage();
    }
}
?>
