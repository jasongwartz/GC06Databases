<?php
// bids/create POST OK

    include '../../auth.php';
    include '../../sql_statements.php';
    include '../../helper.php';
    include '../../post_header.php';

    $post_data = validate_data("POST", array('bidder_user_id', 'bid_auction_id', 'bid_price'));
    
    $bidder_user_id = $post_data['bidder_user_id']['value'];
    $bid_auction_id = $post_data['bid_auction_id']['value'];
    $bid_price = $post_data['bid_price']['value'];
    
    
//    var_dump($post_data);
    //echo bids_create($bidder_user_id, $bid_price, $bid_auction_id);
    $result = db_cud_function(bids_create($bidder_user_id, $bid_price, $bid_auction_id));

    if ($result) {
        http_response_code(200);
        
        echo '{"data": true}';
        
    } else {

        echo '{data: false}';
    }