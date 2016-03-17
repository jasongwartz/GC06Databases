<?php
// auctions/search GET OK

    include '../../sql_statements.php';
    include '../../helper.php';
    
    if (isset($_GET['query'])) {
        $q = $_GET['query'];
    
        $q_split = preg_split("/\s/", $q);
    
        $q_send = "'" . join("* ", $q_split) . "*'";
    } else {
        $q_send = "''";
    }
    
    $sort_order =  ($_GET['sort_order'] ? $_GET['sort_order'] : 0);
    $sort = ($_GET['sort'] ? $_GET['sort'] : 'views');
    
    if ($sort_order) {
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
