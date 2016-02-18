<?php
// users/create

    include '../../auth.php';
    include '../../sql_statements.php';
    include '../../helper.php';

    
    $username = $_POST['username'];
    $firstname = $_POST['first_name'];
    $lastname = $_POST['last_name'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    
    $result = db_cud_function(users_create($username, $firstname, $lastname, $email, $password)); 


    if ($result) {
        http_response_code(201);
        echo $result;
        
    } else {
        http_response_code(304); //Not modified
        echo '{data:false}';
    }
