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
    
     preg_match_all("/#(\w+)/", $description, $tags);
   
    $result = db_cud_function(items_update($item_id, $title, $description, $image_ref));
    
    db_cud_function(hashtagories_clear($item_id));

//    var_dump($result);
//    var_dump($new_item);
    
    
    // for each found hashtag in regex,
        // create hashtag relationship 
    //var_dump($tags[1]); 
    foreach ($tags[1] as $t) {
        //echo hashtagories_tag_item($new_item, $t);
        //echo 
        db_cud_function(hashtagories_tag_item($item_id, $t));
    }


    if ($result) {
        http_response_code(200);
        echo $result;
        
    } else {
        echo '{data:false}';
    }
