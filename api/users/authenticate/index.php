<?php
// users/authenticate POST

    include '../../sql_statements.php';
    include '../../helper.php';
    include '../../post_header.php';

    $post_data = validate_data("POST", array("username", "password"));
    
    $username = $post_data['username']['value'];
    $password = $post_data['password']['value'];
    
    $result = db_r_function(users_authenticate($username, $password));

    //echo $result . " ". users_authenticate($username, $password);
    
    if ( $result != "[]" ) {
        http_response_code(200);
        
        session_start();

        $token = md5(uniqid(rand(), true));

        $_SESSION['access_token'] = $token;
        
        $user_id = json_decode($result, TRUE)[0]["user_id"];
        
        echo '{"access_token":"' . $token . '","user_id":' . $user_id . '}';
        
    } else {
        http_response_code(401);
        echo '{"error":"Invalid username and password pair."}';
    }

