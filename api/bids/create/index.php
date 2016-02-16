<?php
// bids/create

//    include '../../auth.php';
    include '../../sql_statements.php';
    include '../../helper.php';

    //$id = intval($_GET['id']);
    //$result = db_r_function(user($id));
    
    $user_id = $_POST['bidder_user_id'];
    $auction_id = $_POST['bid_auction_id'];
    $bid_price = $_POST['bid_price'];

    echo $user_id . ' ' . $auction_id . ' ' . $bid_price;
    
    if ($result) {
        http_response_code(200);
        echo $result;
        
    } else {
        http_response_code(500);
        echo '{error:"no data returned"}';
    }
