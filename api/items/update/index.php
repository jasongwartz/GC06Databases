<?php
// items/update POST 

    include '../../auth.php';
    include '../../sql_statements.php';
    include '../../helper.php';
    include '../../post_header.php';
    
    $post_data = validate_data("POST", array("item_id", "title", "description", "image_ref"));
    
    $item_id = $post_data['item_id']['value'];
    $title = $post_data['title']['value'];
    $description = $post_data['description']['value'];
    $image_ref = $post_data['image_ref']['value'];
    
    $result = db_cud_function(items_update($item_id, $title, $description, $image_ref));

    if ($result) {
        http_response_code(200);
        echo $result;
        
    } else {
        echo '{data:false}';
    }
