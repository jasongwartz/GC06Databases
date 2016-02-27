<?php
// users/change_password

    //include '../../auth.php';
    include '../../sql_statements.php';
    include '../../helper.php';

    header('content-type: application/x-www-form-urlencoded');
    
    if(empty($_SERVER['CONTENT_TYPE'])){

         $type = "application/x-www-form-urlencoded";

         $_SERVER['CONTENT_TYPE'] = $type;

    }
    
    $post_data = validate_data("POST", array("user_id", "password", "new_password"));
    
    $user_id = $post_data['user_id']['value'];
    $password = $post_data['password']['value'];
    $new_password = $post_data['new_password']['value'];
    //$new_password_confirm = $_POST['new_password_confirm'];

    echo $password;
    echo users_change_password($user_id, $password, $new_password);
    $result = db_cud_function(users_change_password($user_id, $password, $new_password)); 


    if ($result) {
        http_response_code(201);
        echo $result;
        
    } else {
        http_response_code(200); //Not modified
        echo '{"error":"' . $result . '"}';
    }
