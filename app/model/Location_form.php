<?php

namespace App\model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Location_form extends Model
{
    use SoftDeletes;
    protected $table = 'location_form';
    protected $guarded = [];
}
