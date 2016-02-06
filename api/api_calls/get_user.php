<?php
//Need to get the function it reuqires and the sql statement.

include '../helpers/db_read_function.php';
include '../sql_statements/sql_get_user.php';

//header();
$sql = sql_get_user();

echo db_read($sql);