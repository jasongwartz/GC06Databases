<?php
//Need to get the function it reuqires and the sql statement.

include '../helpers/read_function.php';
include '../sql_statements/sql_get_user.php';


$sql = sql_get_user();


echo $sql;