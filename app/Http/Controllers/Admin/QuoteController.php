<?php
namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\model\Quote_info;
use App\model\Service;
use Illuminate\Http\Request;
use Validator;
use Session;

class QuoteController extends Controller
{
    public function index()
    {
        $contact_inquiry =Quote_info::orderBy('id', 'DESC')->get();
        return view('admin.Quote.index', compact('contact_inquiry'));
    }

    public function show($id)
    {
        $contact_inquiry =Quote_info::findOrFail($id);
        return view('admin.Quote.view',compact('contact_inquiry' ));
    }

    public function destroy($id)
    {
        Quote_info::destroy($id);
        Session::flash('flash_message', 'Quote Has Been Deleted!');
        return redirect('panel/admin/inquiry');
    }
}

