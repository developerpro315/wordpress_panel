<?php



namespace App\model;



use Illuminate\Database\Eloquent\Model;

use Illuminate\Database\Eloquent\SoftDeletes;



class Variant extends Model

{

    use SoftDeletes;

    protected $table = 'variant';

    protected $guarded = [];

}

