<?php
// items/delete POST OK

    include '../../auth.php';
    include '../../sql_statements.php';
    include '../../helper.php';

    header('content-type: application/x-www-form-urlencoded');
    
    if(empty($_SERVER['CONTENT_TYPE'])){

         $type = "application/x-www-form-urlencoded";

         $_SERVER['CONTENT_TYPE'] = $type;

    }

    $item_id = $_POST['item_id'];
    $result = db_cud_function(items_delete($item_id));

    if ($result) {
        http_response_code(200);
        echo $result;
        
    } else {
//        http_response_code(500);
        echo '{data:false}';
    }
