<?php

define("DATA_LAYER_CONFIG", [
    "driver"    => $_ENV["DB_CONNECTION"] ?? "mysql",
    "host"      => $_ENV["DB_HOST"] ?? "localhost",
    "port"      => $_ENV["DB_PORT"] ?? "3306",
    "dbname"    => $_ENV["DB_DATABASE"] ?? "db",
    "username"  => $_ENV["DB_USERNAME"] ?? "root",
    "passwd"    => $_ENV["DB_PASSWORD"] ?? "",
    "options"   => [
        PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8",
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_OBJ,
        PDO::ATTR_CASE => PDO::CASE_NATURAL
    ]
]);