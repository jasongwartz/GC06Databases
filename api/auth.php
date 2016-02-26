<?php

$token = $_GET['access_token'];

session_start();

if ( $token != $_SESSION['access_token'] || !isset($_SESSION['access_token'])) {
    http_response_code(401);
    die('Access token invalid ' + $token + " " + $_SESSION['access_token'] );
    
}

