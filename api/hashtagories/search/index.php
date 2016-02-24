<?php
// hashtagories/search

include '../auth.php';
    include '../sql_statements.php';
    include '../helper.php';

    $q = $_GET['query'];
    $result = db_r_function(hashtagories_search($q));

    if ($result) {
        http_response_code(200);
        echo $result;
        
    } else {
        http_response_code(500);
        echo '{error:"no data returned"}';
    }
