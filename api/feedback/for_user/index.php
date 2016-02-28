<?php
// feedback/for_user GET

    include '../../auth.php';
    include '../../sql_statements.php';
    include '../../helper.php';

    $get_data = validate_data("GET", array("user_id"));
    
    $user_id = $get_data['user_id']['value'];

    $result = db_r_function(feedback_for_user($user_id)); 

    if ($result) {
        http_response_code(200);
        echo $result;
        
    } else {
        http_response_code(200);
        echo '{"error":"no data returned"}';
    }