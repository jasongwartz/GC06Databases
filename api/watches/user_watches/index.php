<?php
// watches/user_watches GET

    include '../../auth.php';
    include '../../sql_statements.php';
    include '../../helper.php';

    $watch_user_id = $_GET['watch_user_id']; 
    
    $result = db_r_function(watches_user_watches($watch_user_id));

    if ($result) {
        http_response_code(200);
        echo $result;
        
    } else {
        http_response_code(200); 
        echo $result;
    }
