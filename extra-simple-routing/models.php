<?php
require __DIR__ . '/db-connect.php';
/**
 * Require db-connect here
 */

function getUsers() {

    /**
     * Call la baza de date ca sa va luati userii
     * 
     * $conn ....
     */
    return ['Andrei', 'Diana', 'Andra', 'Andrei'];
}

function addUserToDatabase($user) {
    //INSER INTO USERS ....
}