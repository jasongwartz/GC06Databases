<?php
// feedback/for_auction GET

    include '../../auth.php';
    include '../../sql_statements.php';
    include '../../helper.php';

    $get_data = validate_data("GET", array("feedback_auction_id"));
    
    $feedback_auction_id = $get_data['feedback_auction_id']['value'];

    //echo feedback_for_auction($feedback_auction_id);
    $result = db_r_function(feedback_for_auction($feedback_auction_id)); 

    if ($result) {
        http_response_code(200);
        echo $result;
        
    } else {
        http_response_code(200);
        echo '{"error":"no data returned"}';
    }

