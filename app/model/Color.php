<?php

namespace App\model;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class Color extends Model

{
    use SoftDeletes;
    protected $table = 'color';
    protected $guarded = [];

}

