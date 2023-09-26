<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\model\Subscribe;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Validator;
use Session;

class SubscribeController extends Controller
{
    public function index()
    {
        $subscribe_details =Subscribe::all();
        return view('admin.subscribe.index',compact('subscribe_details'));
    }   
     public function destroy($id)
    {
        Subscribe::destroy($id);
        Session::flash('flash_message', 'Newsletter Has Been Deleted!');
        return redirect('panel/admin/newsletter-subscribers');
    }


}

