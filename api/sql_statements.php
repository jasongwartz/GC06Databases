<?php

function retrieve_all() {  
    return "SELECT * FROM `auctions`";
}

function user($id) {  
    return "SELECT * FROM `users` WHERE user_id=" . $id;
}