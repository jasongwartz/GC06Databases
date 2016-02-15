<?php
// watches/create

include '../auth.php';
    include '../sql_statements.php';
    include '../helper.php';

    //$id = intval($_GET['id']);
    $result = db_r_function(watches_create($_POST['user_id'],$_POST['auction_id']));

    if ($result) {
        http_response_code(200);
        echo $result;
        
    } else {
        http_response_code(500);
        echo '{error:"no data returned"}';
    }
