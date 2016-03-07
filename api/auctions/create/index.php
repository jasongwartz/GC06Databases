<?php
// auctions/create POST

    include '../../auth.php';
    include '../../sql_statements.php';
    include '../../helper.php';
    include '../../post_header.php';
    
    $post_data = validate_data("POST", array("auction_item_id", "start_time", "end_time", "reserve_price"));
    
    $auction_item_id = $post_data['auction_item_id']['value'];
    $start_time = $post_data['start_time']['value'];
    $end_time  = $post_data['end_time']['value'];
    $reserve_price = $post_data['reserve_price']['value'];

        echo auctions_create($auction_item_id, $start_time, $end_time, $reserve_price);
    
    $result = db_cud_function(auctions_create($auction_item_id, $start_time, $end_time, $reserve_price));

    if ($result) {
        http_response_code(200);
        
        echo '{"data": true}';
        
    } else {
        echo '{"data": false}';
    }