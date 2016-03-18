<?php
// bids/user_bids GET

    //include '../auth.php';
    include '../../sql_statements.php';
    include '../../helper.php';

    $get_data = validate_data("GET", array("bidder_user_id"));

    $bidder_user_id = $get_data['bidder_user_id']['value'];
//    echo bids_user_bids($bidder_user_id);
    $result = db_r_function(bids_user_bids($bidder_user_id));

    if ($result) {
        http_response_code(200);
        echo $result;
        
    } else {
        http_response_code(500);
        echo '{"error":"no data returned"}';
    }
