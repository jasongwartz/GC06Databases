<?php
// items/user_items GET POOR

    include '../../auth.php';
    include '../../sql_statements.php';
    include '../../helper.php';

    $owner_user_id = intval($_GET['user_id']);
    $result = db_r_function(items_user_items($owner_user_id));

    if ($result) {
        http_response_code(200);
        echo $result;
        
    } else {
        http_response_code(500);
        echo '{error:"no data returned"}';
    }
