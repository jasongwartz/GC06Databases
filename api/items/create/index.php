<?php
// items/create POST OK

    include '../../auth.php';
    include '../../sql_statements.php';
    include '../../helper.php';

    header('content-type: application/x-www-form-urlencoded');
    
    if(empty($_SERVER['CONTENT_TYPE'])){

         $type = "application/x-www-form-urlencoded";

         $_SERVER['CONTENT_TYPE'] = $type;

    }

    $owner_user_id = $_POST['owner_user_id'];
    $title = $_POST['title'];
    $description = $_POST['description'];
    $result = db_cud_function(items_create($owner_user_id, $title, $description));

    if ($result) {
        http_response_code(201);
        echo $result;
        
    } else {
        http_response_code(304); //Not modified
        echo '{data:false}';
    }