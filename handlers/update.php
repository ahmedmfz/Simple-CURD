<?php

session_start();
include '../core/database.php';
include '../core/validationfile.php';
include '../core/validation.php';

$errors = ['category' => '', 'name' => '', 'price' => '', 'quantity' => '', 'file' => ''];

$id = $_GET['id'];

if (isset($_POST['submit']) && requestPostVal()) {

    foreach ($_POST as $key => $value) {
        $$key = $value;
    }

    $pro_N = filter_var($pro_N, FILTER_SANITIZE_STRING, FILTER_FLAG_STRIP_HIGH);

    if (!required($cat_N)) :
        $errors['category'] = "please choose category for product";
    endif;

    if (!required($pro_N)) :
        $errors['name'] = "name cannot be empty";
    elseif (!minVal($pro_N, 3)) :
        $errors['name'] =  "name must be greater than 3 char";
    endif;

    if (!required($pro_P)) :
        $errors['price'] = "price cannot be empty";
    elseif (!is_numeric($pro_P)) :
        $errors['price'] = "price must be numbers only";
    endif;

    if (!required($pro_Q)) :
        $errors['quantity'] = "Quantity cannot be empty";
    elseif (!is_numeric($pro_Q)) :
        $errors['quantity'] = "Quantity must be numbers only";
    endif;

    $file = $_FILES['pro_F'];

    if ($file['error'] != 4) :

        $f_name = $file['name'];
        $f_size = $file['size'];
        $f_error = $file['error'];
        $f_tmp_name = $file['tmp_name'];
        $f_type = $file['type'];

        if ($f_name != '') :
            $file_path = pathinfo($f_name);
            $file_name = $file_path['filename'];
            $extention = $file_path['extension'];

            if ($f_size < 50000) :

                if (checkimage($f_tmp_name) == true) :

                    $new_name = uniqid("", true) . "." . $extention;
                    $desnation = __DIR__ . "/../files/" . $new_name;
                    move_uploaded_file($f_tmp_name, $desnation);

                else :
                    $errors['file'] = checkimage($f_tmp_name);
                endif;

            else :
                $errors['file'] = "max file size is 5 MB";
            endif;
        else :
            $errors['file'] = "please choose your file";
        endif;

        $select_sql = "SELECT `image` FROM `products` WHERE `id_product` = '$id'";
        $result_select = mysqli_query($connection,$select_sql);
        $row = mysqli_fetch_assoc($result_select);
        $image = $row['image'];


            if(file_exists(__DIR__."/../files/".$image)){
                unlink(__DIR__."/../files/".$image);
            }
        
        $update_sql = "UPDATE `products` SET `image` = '$new_name' WHERE `id_product`= '$id'";
        $update_result = mysqli_query($connection, $update_sql);

    endif;

    if (valuesempty($errors)) :

        $sql = "UPDATE `products` SET `category_id`= '$cat_N' , `name_product` = '$pro_N' , `price` = '$pro_P' ,
                `qty` = '$pro_Q' WHERE `id_product`= '$id'";         
        $result = mysqli_query($connection, $sql);

        if ($result) :
            $_SESSION['passed'] = "YOU updated product successfully";
            header("location:../category/index.php");
        endif;
        
    else :
        $_SESSION['id'] = $id;
        $_SESSION['errors']= $errors;
        header("location:../category/edit.php");
    endif;
}
