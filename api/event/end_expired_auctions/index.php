<?php

    include '../../sql_statements.php';
    include '../../helper.php';
    
    $result = db_r_function(event_end_expired_auctions());

    if ($result) {
        http_response_code(200);
        echo $result;
        
    } else {
        echo '{error:"no data returned"}';
    }
