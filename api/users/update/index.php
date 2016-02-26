<?php
// users/update POST 

    include '../../auth.php';
    include '../../sql_statements.php';
    include '../../helper.php';

    header('content-type: application/x-www-form-urlencoded');
    
    if(empty($_SERVER['CONTENT_TYPE'])){

         $type = "application/x-www-form-urlencoded";

         $_SERVER['CONTENT_TYPE'] = $type;

    }
    
    $post_data = validate_data("POST", array("user_id", "first_name", "last_name", "email"));
    
    $user_id = $post_data['user_id']['value'];
    //$username = $_POST['username'];
    $firstname = $post_data['first_name']['value'];
    $lastname = $post_data['last_name']['value'];
    $email = $post_data['email']['value'];
    //$password = $_POST['password'];
    
    $result = db_cud_function(users_update($user_id, $username, $firstname, $lastname, $email)); 

    if ($result) {
        http_response_code(201);
        echo $result;
        
    } else {
        http_response_code(304); //Not modified
        echo '{data:false}';
    }
