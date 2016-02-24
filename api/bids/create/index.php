<?php
// bids/create POST OK

    include '../../auth.php';
    include '../../sql_statements.php';
    include '../../helper.php';

    header('content-type: application/x-www-form-urlencoded');
    
    if(empty($_SERVER['CONTENT_TYPE'])){

         $type = "application/x-www-form-urlencoded";

         $_SERVER['CONTENT_TYPE'] = $type;

    }

    $post_data = validate_data("POST", array('bidder_user_id', 'bid_auction_id', 'bid_price'));
    
    $bidder_user_id = $post_data['bidder_user_id'];
    $bid_auction_id = $post_data['bid_auction_id'];
    $bid_price = $post_data['bid_price'];
    
    
    var_dump($post_data);

//    $result = db_cud_function(bids_create($bidder_user_id, $bid_price, $bid_auction_id));

    if ($result === TRUE) {
        http_response_code(200);
        
        echo '{data: true}';
        
    } else {

        echo '{data: false}';
    }