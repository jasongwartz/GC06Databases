<?php
// auctions/close

include '../auth.php';
    include '../sql_statements.php';
    include '../helper.php';

    $id = $_POST['auction_id'];
    $result = db_cud_function(auctions_close($id));

    if ($result) {
        http_response_code(200);
        echo $result;
        
    } else {
        http_response_code(500);
        echo '{error:"no data returned"}';
    }
