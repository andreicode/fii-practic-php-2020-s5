<?php

require __DIR__ . '/../db-connect.php';

$query = "CALL `InsertOrderWithProduct`('super', 2);";
$statement = $conn->prepare($query);
$statement->execute();

echo 'Inserted';