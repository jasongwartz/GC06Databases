<?php
// users/self

    include '../auth.php';
    include '../sql_statements.php';
    include '../helper.php';

    $user_id = $_GET['user_id'];

    $result = db_r_function(users_self($user_id)); 

    if ($result) {
        http_response_code(200);
        echo $result;
        
    } else {
        http_response_code(500);
        echo '{error:"no data returned"}';
    }