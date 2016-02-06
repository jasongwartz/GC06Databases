<?php
// users/self

    include '../helper.php';

    $id = intval($_GET['id']);

    $result = db_r_function('Select * from users where userId=' . $id); //Will be 'call get_user(1)'

    if ($result) {
        http_response_code(200);
        echo $result;
        
    } else {
        http_response_code(500);
        echo '{error:"no data returned"}';
    }