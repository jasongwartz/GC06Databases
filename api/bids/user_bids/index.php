<?php
// bids/user_bids GET ?UNKNOWN UNUSED

    include '../auth.php';
    include '../sql_statements.php';
    include '../helper.php';

    if ($result) {
        http_response_code(200);
        echo $result;
        
    } else {
        http_response_code(500);
        echo '{error:"no data returned"}';
    }
