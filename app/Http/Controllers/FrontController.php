<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;

use Illuminate\Support\Facades\Validator;

use Illuminate\Support\Facades\File;

use Illuminate\Http\Request;

use Session;

use Auth;

use URL;

use App\model\Inquiry;

use Error;

use Illuminate\Support\Facades\Mail;

use Mockery\Generator\Method;

use Mockery\Undefined;

use Illuminate\Support\Str;



class FrontController extends Controller

{
  public function admin()

  {

    return redirect('login');

  }

  public function index()

  {
    if(auth()->check()){
      return redirect('panel/admin/dashboard');
    }else{
      return redirect('login');
    }
    }

  public function forminquiry(Request $request,$data=null){
    if($request->method() == 'POST'){

      $validator = Validator::make($request->all(), [ 
        'username' => 'required',
        'title' => 'required',
        'email' => 'required',
        'price' => 'required', 
        'payment_method' => 'required', 
        'staticpri' => 'required', 
        'qty' => 'required', 
        'paypal_account_email' => 'required', 

    ],
    [ 

        'name.max' => 'First Name can not exceed :max characters',

        'name.regex' => 'First Name can only Contain ALPHABETS',

        'email.required' => 'Please Provide an Email',

        'email.regex' => 'Please Provide Valid Email',

        'subject.required' => 'Please Provide a Subject',

        'subject.max' => 'Subject can not exceed :max characters',

        'message.required' => 'Please Provide A Message',

        'message.max' => 'Message can not exceed :max characters',

    ]);

    if ($validator->fails()){

        // return response()->json(['errors' => $validator->errors()]);

        Session::flash('error', $validator->errors()->first());

        return redirect()->back()->withErrors($validator)->withInput();

    }
    $randomNumber = random_int(100000, 999999);
    // $uid = uniqid(5);
    $inquiry = new Inquiry;
    $inquiry->uid = $randomNumber;
    $inquiry->name = $request->username;
    $inquiry->package = $request->title;
    $inquiry->email = $request->email;
    $inquiry->price = $request->price;
    $inquiry->currency = (($request->payment_method == 1)?'Paypal':'Bitcoin');
    $inquiry->unitprice = $request->staticpri;
    $inquiry->qty = $request->qty;
    $inquiry->cur_email = $request->paypal_account_email;
    $inquiry->save();
    
            $data2["email"] = $request->email;

        $data['email']= $request->email;

        $data = array('email'=>"$request->email",'uid'=>"$randomNumber",'package'=>"$request->title",'unitprice'=>"$request->staticpri",'qty'=>"$request->qty",'name'=>"$request->username",'price'=>"$request->price",'currency'=>"$request->payment_method",'cur_email'=>"$request->paypal_account_email",'type'=>"");

        Mail::send('emails.newsletter', $data,function ($m) use ($data,$data2) {

            $m->from('noreply@demo-customlinks.com', 'Thank you for Purchase');

            $m->to($data2["email"],'User')->subject('Thank you for Purchase');

        });


    if ($inquiry->save()) {
      $url = 'https://demolinksphp8.com/ezrsgold/v1/checkout-details/?d='.$inquiry->uid;
      // return redirect('https://demolinksphp8.com/ezrsgold/v1/checkout-details/');
      Session::flash('message', $url);

        // return response()->json(['message' => 'Thankyou For Contacting Us']);

    }

    }
    return view('front.inquiry',compact('request'));

  }
  public function forminquirydeatil(Request $request,$dataa=null){

    $data = Inquiry::where('uid',$request->get('d'))->first();
    return view('front.inquiry-detail',compact('data'));

  }



}