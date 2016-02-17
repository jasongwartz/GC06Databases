<?php
// authenticate/self POST
    

    //Make an access token save it in the session and get the users id.

    include '../sql_statements.php';
    include '../helper.php';

    header('content-type: application/x-www-form-urlencoded');
    
    if(empty($_SERVER['CONTENT_TYPE'])){

         $type = "application/x-www-form-urlencoded";

         $_SERVER['CONTENT_TYPE'] = $type;

    }

    
    $username = $_POST['username'];
    $password = $_POST['password'];
    
    $result = TRUE;//db_r_function(authenticate_self($username, $password));

    if ($result) {
        http_response_code(200);
        
        session_start();

        $token = md5(uniqid(rand(), true));

        $_SESSION['access_token'] = $token;
        echo '{"access_token":"' . $token . '","user_id":1}';
        
        
//        echo $result;
        
    } else {
        http_response_code(201);
        echo '{error:"Invalid username and password"}';
    }

