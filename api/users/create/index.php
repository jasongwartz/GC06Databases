<?php
// users/create POST 

    include '../../sql_statements.php';
    include '../../helper.php';
    include '../../post_header.php';

    $post_data = validate_data("POST", array("username","first_name","last_name","email","password"));
    
    $username = $post_data['username']['value'];
    $firstname = $post_data['first_name']['value'];
    $lastname = $post_data['last_name']['value'];
    $email = $post_data['email']['value'];
    $password = md5($post_data['password']['value']);
 
    
    $result = db_cud_function(users_create($username, $firstname, $lastname, $email, $password)); 


    if ($result) {
        http_response_code(201);
        echo $result;
        
    } else {
        http_response_code(304); //Not modified
        echo '{data:false}';
    }
