<?php
// bids/create

//    include '../../auth.php';
    include '../../sql_statements.php';
    include '../../helper.php';

    $bidder_user_id = $_POST['bidder_user_id'];
    $bid_auction_id = $_POST['bid_auction_id'];
    $bid_price = $_POST['bid_price'];

//    echo $user_id . ' ' . $auction_id . ' ' . $bid_price;
    
    //$id = intval($_GET['id']);
    $result = db_cud_function(bids_create($bidder_user_id, $bid_price, $bid_auction_id));
    

    
    if ($result) {
        http_response_code(200);
        echo '{data: "it posted successfully!!"}';
        
    } else {
        http_response_code(500);
        echo '{error:"no data returned"}';
    }
