<?php

namespace App\model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Occassionselect extends Model
{
    use SoftDeletes;
    protected $table = 'occassionselect';
    protected $guarded = [];
}
