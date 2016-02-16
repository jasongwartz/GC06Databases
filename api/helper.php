<?php
//Helper file with CRUD functions.

include 'config.php';

//Returns boolean
function db_cud_function($sql) {
    // Create connection
    $conn = new mysqli(HOSTNAME, USERNAME, PASSWORD, DBNAME);
    
    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    } 

    $result = $conn->query($sql);

    if ($result === TRUE) {

        $return = TRUE;
        
    } else {

        $return = FALSE;
    }


    $conn->close();     
    
    return $return;   
    
}

//Returns data
function db_r_function($sql) {
   
    // Create connection
    $conn = new mysqli(HOSTNAME, USERNAME, PASSWORD, DBNAME);
    
    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    } 

    $result = $conn->query($sql);

    $data = array();
    $index = 0;
    if ($result->num_rows > 0) {

        // save data of each row to an array.
        while($row = $result->fetch_assoc()) {
            $data[$index] = $row;
            $index++;
        }
        $return = json_encode($data, JSON_NUMERIC_CHECK);
        
    } else {

        $return = FALSE;
    }


    $conn->close();     
    
    return $return;    
}