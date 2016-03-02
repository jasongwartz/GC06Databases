<?php
//Helper file with CRUD functions.

include 'config.php';
include 'validation.php';

//Returns boolean
function db_cud_function($sql) {   

    // Create connection
    $conn = new mysqli(HOSTNAME, USERNAME, PASSWORD, DBNAME);
    
    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    } 

    $result = $conn->query($sql);
    //echo $result . ' ' . $sql;

    //echo $conn->error;
    
    if ($result) {
        $result = TRUE;
    } else {
        $result = $conn->error;
    }
    
    $conn->close();     
//    echo $result;
    return $result;   
    
}

//Returns data
function db_r_function($sql) {
   
    // Create connection
    $conn = new mysqli(HOSTNAME, USERNAME, PASSWORD, DBNAME);
    
    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    } 
    //echo $sql;
    $result = $conn->query($sql);
   
    $data = array();
    $index = 0;
    
    //echo $conn->error;
    
    if ($conn->error === TRUE) {
        
        $return = $conn->error;
        
    } else if ($result->num_rows > 0) {

        // save data of each row to an array.
        while($row = $result->fetch_assoc()) {
            $data[$index] = $row;
            $index++;
        }
        $return = json_encode($data, JSON_NUMERIC_CHECK);
        
    } else {

        $return = '[]';
    }


    $conn->close();     
    
    return $return;    
}
