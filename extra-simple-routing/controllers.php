<?php 
require __DIR__ . '/models.php';

function mainController() {

    //Get products form DB
    $users = getUsers();
    //cheama view-ul final
    require __DIR__ . '/views/main.php';
}


function addUserController() {

    $userName = $_POST['userName'];
    
    /**
     * INSERT user into db
     */
    addUserToDatabase($userName);
    header('Location: home');
}