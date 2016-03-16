<?php
// auctions/retrieve_all GET OK

    include '../../sql_statements.php';
    include '../../helper.php';
    
    $q = $_GET['query'];
    $sort = $_GET['sort'];
    $order = $_GET['sort_order'];
    
    $q_split = preg_split("/\s/", $q);
    
    $q_send = "'" . join("* ", $q_split) . "*'";
    $sort_order =  ($_GET['sort_order'] ? $_GET['sort_order'] : 0);
    $sort = ($_GET['sort'] ? $_GET['sort'] : 'views');
    
    if ($order) {
       $result = db_r_function(auctions_search_desc($q_send, $sort));        
    } else {
       $result = db_r_function(auctions_search($q_send, $sort));
    }

    if ($result) {
        http_response_code(200);
        echo $result;
        
    } else {
        echo '{error:"no data returned"}';
    }

// SQL stored proc uses this concept:
    // http://stackoverflow.com/questions/8149545/pass-array-to-mysql-stored-routine
