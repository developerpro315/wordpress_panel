<?php

namespace App\model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Occassion extends Model
{
    use SoftDeletes;
    protected $table = 'occassion';
    protected $guarded = [];
}
