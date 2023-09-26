<?php

namespace App\model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Hotdeal extends Model
{
    use SoftDeletes;
    protected $table = 'hotdeal';
    protected $guarded = [];
}
