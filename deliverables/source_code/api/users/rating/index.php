<?php
// users/rating GET

    include '../../sql_statements.php';
    include '../../helper.php';

    $get_data = validate_data("GET", array("user_id"));
    
    $user_id = $get_data['user_id']['value'];

    $result = db_r_function(users_rating($user_id)); 

    if ($result) {
        http_response_code(200);
        echo $result;
        
    } else {
        http_response_code(200);
        echo '{"error":"no data returned"}';
    }