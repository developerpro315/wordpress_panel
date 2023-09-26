<?php

namespace App\model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Blog_comment extends Model
{
    use SoftDeletes;
    protected $table = 'blog_comment';
    protected $guarded = [];
}
