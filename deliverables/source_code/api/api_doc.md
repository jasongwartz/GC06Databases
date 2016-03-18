# API DOC

## Users
users/authenticate/  POST params: username, password

users/  GET params: user_id 

users/create/  POST params:username, first_name, last_name, email, pass

users/update/ POST params:user_id, username, first_name, last_name, email

users/change_password/ POST params:user_id, old_password, new_password

## Items  
items/ GET params:item_id

items/create/ POST params:owner_user_id, title, description

items/update/ POST params:item_id, title, description

items/user_items/ GET params:owner_user_id

items/delete POST params:item_id

## Auctions
auctions/ GET params:auction_id

auctions/create/ POST params:auction_item_id, start_time, end_time, reserve_price

auctions/cancel/ POST params:auction_id

auctions/retrieve_all/ GET

auctions/user_auctions/ GET params:user_id

## Bids

bids/create/ POST params:bidder_user_id, bid_price, bid_auction_id

bids/user_bids/ GET params:user_id

bids/auction_bids/ GET params:bid_auction_id

## Watches

watches/user_watches/ GET params:user_id

watches/create/ POST params:watch_user_id, watch_auction_id

watches/delete/ POST params:watch_user_id, watch_auction_id

## Feedback

feedback/for_user/ GET  params:user_id

feedback/for_auction/ GET params:feedback_auction_id

feedback/update/ POST params:feedback_text, user_id, feedback_id

## Hashtagories

hashtagories/trending/ GET
   
hashtagories/all/ GET

hashtagories/search/ GET  params:str

hashtagories/tag_item/ POST params:item_id, hashtag

