<?php

require __DIR__ . '/../db-connect.php';

$query = "CALL `GetTotalOrderdProductsFromCategory`(1);";
$statement = $conn->prepare($query);
$statement->execute();
$statement->setFetchMode(PDO::FETCH_ASSOC);
$results = $statement->fetchAll();

echo '<pre>';
foreach($results as $row) {
    print_r($row);
}
echo '</pre>';