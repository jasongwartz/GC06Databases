<?php
// bids/auction_bids GET OK

    include '../../sql_statements.php';
    include '../../helper.php';

    $auction_id = intval($_GET['auction_id']);
    $result = db_r_function(bids_auction_bids($auction_id));

    if ($result) {
        http_response_code(200);
        echo $result;
        
    } else {
        //http_response_code(500);
        echo '[]';
    }
