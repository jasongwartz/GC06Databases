<?php
// auctions/user_auctions

    include '../../auth.php';
    include '../../sql_statements.php';
    include '../../helper.php';

    $user_id = $_GET['user_id'];
    $result = db_r_function(auctions_user_auctions($user_id));

    if ($result) {
        http_response_code(200);
        echo $result;
        
    } else {
        echo '[]';
    }
