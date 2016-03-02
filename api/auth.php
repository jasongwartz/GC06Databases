<?php

    $token = "";//validate_data("GET", array("access_token"))["access_token"]["value"];
    $session_token = "";
    
    session_start();
    
    if (isset($_GET["user_id"])) {
        //$user_id = ;
        
        $session_token .= $_SESSION["user_id"] . "_";
        $token .= $_GET["user_id"] . "_";

        //echo $user_id;
    }
    
    $session_token .= $_SESSION["access_token"];
    $token .= $_GET["access_token"];
    
    //echo $token . " " . $session_token . "\n";
    
    if ( $token != $session_token || !isset($_SESSION['access_token']) ) {
        http_response_code(401);
        die('Access token invalid ' . $_GET["access_token"]);
        
    }

