<?php 
session_start();
include '../core/database.php';

$id = $_GET['id'];

$sql_select = "SELECT `image` FROM `products` WHERE `id_product` = '$id'";

$result = mysqli_query($connection , $sql_select);

$row = mysqli_fetch_assoc($result);

if(file_exists(__DIR__."/../files/".$row['image'])){
    unlink(__DIR__."/../files/".$row['image']);
}

$sql_delete = "DELETE FROM `products` WHERE `id_product` = '$id'";

$delete = mysqli_query($connection, $sql_delete);

if($delete){
    $_SESSION['delete'] = "YOU DELETED PRODUCT SUCCESSFULLY";
    header("location:../category/index.php");
}

