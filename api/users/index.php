<?php
// users/self

    include '../auth.php';
    include '../sql_statements.php';
    include '../helper.php';

    $id = intval($_GET['id']);

    $result = db_r_function(user($id)); //Will be 'call get_user(1)'

    if ($result) {
        http_response_code(200);
        echo $result;
        
    } else {
        http_response_code(500);
        echo '{error:"no data returned"}';
    }