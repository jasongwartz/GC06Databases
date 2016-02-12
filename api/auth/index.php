<?php



session_start();

//Make an access token save it in the session and get the users id.

$token = "token";

$_SESSION['access_token'] = $token;


echo '{"access_token":"' . $token . '","user_id":1}';

include '../auth.php';
    include '../sql_statements.php';
    include '../helper.php';

    //$id = intval($_GET['id']);
    //$result = db_r_function(user($id));

    if ($result) {
        http_response_code(200);
        echo $result;
        
    } else {
        http_response_code(500);
        echo '{error:"no data returned"}';
    }
