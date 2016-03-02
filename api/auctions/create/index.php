<?php
// auctions/create POST

    include '../../auth.php';
    include '../../sql_statements.php';
    include '../../helper.php';

    header('content-type: application/x-www-form-urlencoded');
    
    if(empty($_SERVER['CONTENT_TYPE'])){

         $type = "application/x-www-form-urlencoded";

         $_SERVER['CONTENT_TYPE'] = $type;

    }
    
    $auction_item_id = $_POST['auction_item_id'];
    $start_time = $_POST['start_time'];
    $end_time  = $_POST['end_time'];
    $reserve_price = $_POST['reserve_price'];

    $result = db_cud_function(auctions_create($auction_item_id, $start_time, $end_time, $reserve_price));

    if ($result === TRUE) {
        http_response_code(200);
        
        echo '{data: true}';
        
    } else {
        echo '{data: false}';
    }