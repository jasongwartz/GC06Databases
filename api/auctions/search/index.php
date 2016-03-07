<?php
// auctions/retrieve_all GET OK

    include '../../sql_statements.php';
    include '../../helper.php';
    
    $q = $_GET['query'];
    
    $q_split = preg_split("/\s/", $q);
    
    $q_send = "'" . join("* ", $q_split) . "*'";
    
    $result = db_r_function(auctions_search($q_send));

    if ($result) {
        http_response_code(200);
        echo $result;
        
    } else {
        echo '{error:"no data returned"}';
    }

// SQL stored proc uses this concept:
    // http://stackoverflow.com/questions/8149545/pass-array-to-mysql-stored-routine