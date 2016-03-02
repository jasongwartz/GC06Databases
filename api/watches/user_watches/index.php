<?php
// watches/user_watches GET

    include '../../auth.php';
    include '../../sql_statements.php';
    include '../../helper.php';

    $get_data = validate_data("GET", array("watch_user_id"));
    
    $watch_user_id = $get_data['user_id']['value'];

    $result = db_r_function(watches_user_watches($watch_user_id));

    if ($result) {
        http_response_code(200);
        echo $result;
        
    } else {
        http_response_code(200); 
        echo $result;
    }
