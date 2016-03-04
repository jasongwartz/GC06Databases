<?php
// auctions/retrieve_all GET OK

    include '../../sql_statements.php';
    include '../../helper.php';
    
    $q = $_GET['query'];
    
    $result = db_r_function(auctions_search($q));

    if ($result) {
        http_response_code(200);
        echo $result;
        
    } else {
        echo '{error:"no data returned"}';
    }
