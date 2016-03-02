<?php
// items/delete POST OK

    include '../../auth.php';
    include '../../sql_statements.php';
    include '../../helper.php';
    include '../../post_header.php';

    $post_data = validate_data("POST", array("item_id"));
    
    $item_id = $post_data['item_id']['value'];
    
    $result = db_cud_function(items_delete($item_id));

    if ($result) {
        http_response_code(200);
        echo $result;
        
    } else {
//        http_response_code(500);
        echo '{data:false}';
    }
