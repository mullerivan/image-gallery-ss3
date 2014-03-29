<?php

function getSlider()
{
    $list = Array();
//
    $images = glob($_POST['folder'].'*.{jpeg,gif,png,jpg}',GLOB_BRACE);

    foreach ($images  as $key => $file_die) {
        if ($file_die != '.' && $file_die != '..' && $file_die != '_resampled') {
            $list[] = $file_die;
        }
    }
    sort($list);
    return json_encode($list);
}
echo getSlider();

