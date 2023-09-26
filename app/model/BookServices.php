<?php



namespace App\model;



use Illuminate\Database\Eloquent\Model;

use Illuminate\Database\Eloquent\SoftDeletes;



class BookServices extends Model

{

    use SoftDeletes;

    protected $table = 'book_services';

    protected $guarded = [];

}

