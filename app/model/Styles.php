<?php



namespace App\model;



use Illuminate\Database\Eloquent\Model;

use Illuminate\Database\Eloquent\SoftDeletes;



class Styles extends Model

{

    use SoftDeletes;

    protected $table = 'style';

    protected $guarded = [];

}

