<?php



namespace App\model;



use Illuminate\Database\Eloquent\Model;

use Illuminate\Database\Eloquent\SoftDeletes;

class Position extends Model

{
    use SoftDeletes;
    protected $table = 'positions';

    protected $guarded = [];

}

