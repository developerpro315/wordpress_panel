<?php

use App\imagetable;
use App\model\Config;

function getImage($image = 'logo') {
    return imagetable::where('table_name', $image)->first()->img_path;
}
function getImage2($image = 'logo2') {
    return imagetable::where('table_name', $image)->first()->img_path;
}

function returnFlag($id=false) {
    return Config::findorFail($id)->flag_value;
}
