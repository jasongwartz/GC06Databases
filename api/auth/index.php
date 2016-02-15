<?php



session_start();

//Make an access token save it in the session and get the users id.

$token = "token";

$_SESSION['access_token'] = $token;


echo '{"access_token":"' . $token . '","user_id":1}';
