<?php
// watches/create POST OK

    include '../../auth.php';
    include '../../sql_statements.php';
    include '../../helper.php';
    include '../../post_header.php';
    
    $post_data = validate_data("POST", array("watch_user_id", "watch_auction_id"));

    $watch_user_id = $post_data['watch_user_id']['value'];
    $watch_auction_id = $post_data['watch_auction_id']['value'];
    
    $result = db_cud_function(watches_create($watch_user_id, $watch_auction_id));

    if ($result) {
        http_response_code(201);
        echo $result;
        
    } else {
        http_response_code(304); //Not modified
        echo '{data:false}';
    }