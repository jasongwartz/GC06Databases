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
    
    $bidder_user_id = $_POST['bidder_user_id'];
    $bid_auction_id = $_POST['bid_auction_id'];
    $bid_price = $_POST['bid_price'];

    $result = db_cud_function(bids_create($bidder_user_id, $bid_price, $bid_auction_id));

    if ($result === TRUE) {
        http_response_code(200);
        
        echo '{data: true}';
        
    } else {

        echo '{data: false}';
    }