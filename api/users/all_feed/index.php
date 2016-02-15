<?php
// users/all_feed

include '../auth.php';
    include '../sql_statements.php';
    include '../helper.php';

    $result = db_r_function(user_feed($_GET['user_id']));

    if ($result) {
        http_response_code(200);
        echo $result;
        
    } else {
        http_response_code(500);
        echo '{error:"no data returned"}';
    }
