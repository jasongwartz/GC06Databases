<?php
// users/change_password

    include '../../auth.php';
    include '../../sql_statements.php';
    include '../../helper.php';

    
    $password = $_POST['password'];
    $new_password = $_POST['new_password'];
    $new_password_confirm = $_POST['new_password_confirm'];

    
    $result = db_cud_function(users_change_password($password, $new_password, $new_password_confirm)); 


    if ($result) {
        http_response_code(201);
        echo $result;
        
    } else {
        http_response_code(304); //Not modified
        echo '{data:false}';
    }
