<?php
// hashtagories/all GET

    include '../../sql_statements.php';
    include '../../helper.php';
    
    $result = db_r_function(hashtagories_all());

    if ($result) {
        http_response_code(200);
        echo $result;
        
    } else {
        echo '{error:"no data returned"}';
    }
