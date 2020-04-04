<?php

echo 'This is the Main page!';
echo '<pre>';
var_dump($users);
echo '</pre>';
?>

<form method="POST" action="add-user">
    <input type="text" name="userName"/>
    <button type="submit">Save User</button>
</form>