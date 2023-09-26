<?php



namespace App\model;



use Illuminate\Database\Eloquent\Model;

use Illuminate\Database\Eloquent\SoftDeletes;



class OrderDetails extends Model

{

    use SoftDeletes;

    protected $table = 'order_details';

    protected $guarded = [];

}

