<?php

$server_name = "localhost";
$user_name   = "root";
$password    = "";
$db_name     = "ecommerce_2";

$connection = mysqli_connect($server_name,$user_name,$password,$db_name);

if(!$connection){
    echo "connection falid : " . mysqli_connect_error();
}