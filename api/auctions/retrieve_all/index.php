<?php
// auctions/retrieve_all

    include '../../sql_statements.php';
    include '../../helper.php';

    $result = db_r_function(retrieve_all()); 

    if ($result) {
        http_response_code(200);
        echo $result;
        
    } else {
        http_response_code(500);
        echo '{error:"no data returned"}';
    }