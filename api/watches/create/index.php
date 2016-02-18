<?php
// watches/create POST OK

    include '../../auth.php';
    include '../../sql_statements.php';
    include '../../helper.php';

    header('content-type: application/x-www-form-urlencoded');
    
    if(empty($_SERVER['CONTENT_TYPE'])){

         $type = "application/x-www-form-urlencoded";

         $_SERVER['CONTENT_TYPE'] = $type;

    }

    $watch_user_id = $_POST['watch_user_id'];
    $watch_auction_id = $_POST['watch_auction_id'];
    
    $result = db_cud_function(watches_create($watch_user_id, $watch_auction_id));

    if ($result) {
        http_response_code(201);
        echo $result;
        
    } else {
        http_response_code(304); //Not modified
        echo '{data:false}';
    }