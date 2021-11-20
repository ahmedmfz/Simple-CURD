<?php


function checkimage($value){

        $filename = $value;
        $error = '';
        $success = '';
        $type = exif_imagetype($filename);
        switch ($type) {
            case 1:
                $isimage = @imagecreatefromgif($filename);
                (!$isimage) ? $error = "extn - gif, but not a valid gif" : $success = 'valid gif';
                break;
            case 2:
                $isimage = @imagecreatefromjpeg($filename);
                (!$isimage) ?  $error = "extn - jpg, but not a valid jpg" : $success = 'valid jpg';
                break;
            case 3:
                $isimage = @imagecreatefrompng($filename);
                (!$isimage) ? $error = "extn - png, but not a valid png" : $success = ' valid png';
                break;
            default: 
                $error = "Not an image";
                break;
        }

        if($error == ''){
            echo  $success;
            return true;
        }else{
            echo $error;
            return false;
        }
       
}