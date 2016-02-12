<?php

function retrieve_all() {  
    return "SELECT * FROM `auctions`";
}

function users_self($id) {  
    return "CALL users_self({$id});";
}

function users_create($username, $first_name, $last_name, $email, $pass) {
    return "CALL users_create({$username}, {$first_name}, {$last_name}, {$email}, {$pass});";
}

function users_change_password($username, $new_password) {
    return "CALL users_change_password({$username}, {$new_password});";
}

function get_auctions_feed(){
    return "CALL get_auctions_feed();";}
function items_self($item_id){
return "CALL items_self({$item_id});";}

function items_create($owner_user_id, $title, $description){
return "CALL items_create({$owner_user_id}, {$title}, {$description});";}

function items_update($item_id, $title, $description){
return "CALL items_update({$item_id}, {$title}, {$description});";}

function items_user_items($owner_user_id){
return "CALL items_user_items({$owner_user_id});";}

function items_delete($item_id){
return "CALL items_delete({$item_id});";}

function auctions_self($auction_id){
return "CALL auctions_self({$auction_id});";}

function auctions_create($auction_item_id, $start_time, $end_time, $reserve_price){
return "CALL auctions_create({$auction_item_id}, {$start_time}, {$end_time}, {$reserve_price});";}

function auctions_cancel($auction_id){
return "CALL auctions_cancel({$auction_id});";}

function auctions_retrieve_all(){
return "CALL auctions_retrieve_all();";}

function auctions_user_auctions($user_id){
return "CALL auctions_user_auctions({$user_id});";}

function user_feed($user_id){
return "CALL user_feed({$user_id});";}

function auctions_hastagory($hash1, $hash2, $hash3, $hash4, $hash5){
return "CALL auctions_hastagory`({$hash1}, {$hash2}, {$hash3}, {$hash4}, {$hash5});";}

function bids_self($bid_id){
return "CALL bids_self({$bid_id});";}

function bids_create($bidder_user_id, $bid_price, $bid_auction_id){
return "CALL bids_create({$bidder_user_id}, {$bid_price}, {$bid_auction_id});";}

function bids_user_bids($user_id){
return "CALL bids_user_bids({$user_id});";}

function bids_auction_bids($bid_auction_id){
return "CALL bids_auction_bids({$bid_auction_id});";}

function watches_user_watches($user_id){
return "CALL watches_user_watches({$user_id});";}

function watches_create($watch_user_id, $watch_auction_id){
return "CALL watches_create({$watch_user_id}, {$watch_auction_id});";}

function watches_delete($watch_user_id, $watch_auction_id){
return "CALL watches_delete({$watch_user_id}, {$watch_auction_id});";}

function feedback_for_user($user_id){
return "CALL feedback_for_user({$user_id});";}

function feedback_for_action($feedback_auction_id){
return "CALL feedback_for_action({$feedback_auction_id});";}

function feedback_update($feedback_text, $user_id, $feedback_id){
return "CALL feedback_update({$feedback_text}, {$user_id}, {$feedback_id});";}