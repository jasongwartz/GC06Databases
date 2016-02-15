<?php
// users/create

    include '../../helper.php';
    
    echo 'create';include '../auth.php';
    include '../sql_statements.php';
    include '../helper.php';

    $result = db_r_function(users_create(
        $_POST['username'],$_POST['first_name'],$_POST['last_name'],$_POST['email'],$_POST['password']) 
    );

    if ($result) {
        http_response_code(200);
        echo $result;
        
    } else {
        http_response_code(500);
        echo '{error:"no data returned"}';
    }
