<?php 


function required($value){
    if(empty($value)){
        return false;
    }
    return true;
}

function minVal($value,int $length){
    if(strlen($value) < $length){
        return false;
    }
    return true;
}

function maxVal($value,int $length){
    if(strlen($value) > $length){
        return false;
    }
    return true;
}

function emailVal($value){
    if(!filter_var($value , FILTER_VALIDATE_EMAIL)){
        return false;
    }
    return true;
}

function numericVal($value){
    if(!is_numeric($value)){
        return false;
    }
    return true;
}

function integerVal($value){
    if(!is_int($value)){
        return false;
    }
    return true;
}

function decimalVal($value){
    if(!is_float($value)){
        return false;
    }
    return true;
}

function requestPostVal(){
    if($_SERVER['REQUEST_METHOD'] != 'POST'){
        return false;
    }
    return true;
}

function requestGetVal(){
    if($_SERVER['REQUEST_METHOD'] != 'GET'){
        return false;
    }
    return true;
}

function arrayVal($value){
    if(!is_array($value)){
        return false;
    }
    return true;
}

function valuesempty($arry){
    foreach( $arry as $key => $value){
        if($value != ''){
            return false;
        }
    }
    return true;
}


