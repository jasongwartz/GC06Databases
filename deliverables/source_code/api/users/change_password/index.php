<?php
// users/change_password

    include '../../auth.php';
    include '../../sql_statements.php';
    include '../../helper.php';
    include '../../post_header.php';

    
    $post_data = validate_data("POST", array("user_id", "password", "new_password"));
    
    $user_id = $post_data['user_id']['value'];
    $password = md5($post_data['password']['value']);
    $new_password = md5($post_data['new_password']['value']);
    //$new_password_confirm = $_POST['new_password_confirm'];

    //echo $password;
    //echo users_change_password($user_id, $password, $new_password);
    $result = db_cud_function(users_change_password($user_id, $password, $new_password)); 


    if ($result === TRUE) {
        http_response_code(200);
        echo '{"data":true}';
        
    } else {
        http_response_code(200); //Not modified
        echo '{"error":"' . $result . '"}';
    }
