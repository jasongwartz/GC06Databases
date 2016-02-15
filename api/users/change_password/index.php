<?php
// users/change_password

include '../auth.php';
    include '../sql_statements.php';
    include '../helper.php';

    
    $result = db_r_function($_POST['username'],$_POST['new_password']);

    if ($result) {
        http_response_code(200);
        echo $result;
        
    } else {
        http_response_code(500);
        echo '{error:"no data returned"}';
    }
