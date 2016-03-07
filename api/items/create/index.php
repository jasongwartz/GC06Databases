<?php
// items/create POST OK

    //include '../../auth.php';
    include '../../sql_statements.php';
    include '../../helper.php';
    include '../../post_header.php';
    
    $post_data = validate_data("POST", array("owner_user_id", "title", "description", "image_ref"));

    $owner_user_id = $post_data['owner_user_id']['value'];
    $title = $post_data['title']['value'];
    $description = $post_data['description']['value'];
    $image_ref = $post_data['image_ref']['value'];
    
    preg_match_all("/#(\w+)/", $description, $tags);
    
    $result = db_cud_function(items_create($owner_user_id, $title, $description, $image_ref));
    $new_item = json_decode($result)['item_id'];

    // for each found hashtag in regex,
        // create hashtag relationship 
    //var_dump($tags[1]); 
    foreach ($tags[1] as $t) {
        db_cud_function(hashtagories_tag_item($new_item, $t));
    }
        

    if ($result) {
        http_response_code(201);
        echo $result;
        
    } else {
        http_response_code(304); //Not modified
        echo '{data:false}';
    }