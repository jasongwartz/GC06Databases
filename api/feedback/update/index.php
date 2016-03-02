<?php
// feedback/update POST

    include '../../auth.php';
    include '../../sql_statements.php';
    include '../../helper.php';
    include '../../post_header.php';
    
    $post_data = validate_data("POST", array("feedback_text", "user_id", "feedback_auction_id"));
    
    $feedback_text = $post_data['feedback_text']['value'];
    $user_id = $post_data['user_id']['value'];
    $feedback_auction_id = $post_data['feedback_auction_id']['value'];

    $result = db_cud_function(feedback_update($feedback_text, $user_id, $feedback_auction_id)); 

    if ($result) {
        http_response_code(201);
        echo $result;
        
    } else {
        http_response_code(304); //Not modified
        echo '{data:false}';
    }