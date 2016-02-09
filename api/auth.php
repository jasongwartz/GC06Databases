<?php

$token = $_GET['access_token'];

session_start();

if ( $token != $_SESSION['access_token'] ) {
    
    echo 'Access token invalid';
    
}

