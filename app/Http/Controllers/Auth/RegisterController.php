<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Profile;
use App\Providers\RouteServiceProvider;
use App\User;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Auth;
use Session;
use Illuminate\Support\Facades\Mail;

class RegisterController extends Controller
{
    use RegistersUsers;

    protected $redirectTo = RouteServiceProvider::HOME;

    public function __construct()
    {
        $this->middleware('guest');
    }

    protected function validator(array $data)
    {
        return Validator::make($data, [
                'first_name' => ['required', 'string', 'max:255','regex:/^[\pL\s\-]+$/u'],
                'last_name' => ['required', 'string', 'max:255','regex:/^[\pL\s\-]+$/u'],
                'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
                'password' => ['required', 'string', 'min:8', 'confirmed'],
                // 'phone' => 'required|regex:/^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}$/',
                'phone' => 'required|regex:/^([0-9\s\-\+\(\)]*)$/|min:12',
                // 'address_1' => ['required', 'max:255','regex:/(^[-0-9A-Za-z.,\/ ]+$)/'],
                // 'address_2' => ['nullable', 'max:255','regex:/(^[-0-9A-Za-z.,\/ ]+$)/'],
                // 'city' => ['required', 'string', 'max:255','regex:/^[\pL\s\-]+$/u'],
                // 'state' => ['required', 'string', 'max:255','regex:/^[\pL\s\-]+$/u'],
                // 'zip_code' => 'required',
            ],[ 
                'first_name.max' => 'First Name can not exceed :max characters',
                'first_name.required' => 'Please Enter a Firstname',
                'first_name.regex' => 'First Name can only contain aplabets',
                'last_name.max' => 'Last Name can not exceed :max characters',
                'last_name.required' => 'Please Enter a LastName',
                'last_name.regex' => 'Last Name can only contain aplabets',
                'email.required' => 'Please Provide a Email',
                'email.unique' => 'This Email is already Registered',
                'password.required' => 'Please Provide a Password',
                'password.confirmed' => 'Passwords must match With Confirm Password',
                'phone.required' => 'Please provide a Contact Number',
                'phone.regex' => 'Contact should be in Numbers',
                'phone.min' => 'Contact should be 10 Digits',
                // 'address_1.required' => 'Please Provide a Address',
                // // 'address_1.string' => 'Address Should Contain Alphabets and number Only',
                // 'address_1.regex' => 'Address Should Contain Alphabets and number Only',
                // // 'address_2.string' => 'Address Should Contain Alphabets and number Only',
                // 'address_2.regex' => 'Address Should Contain Alphabets and number Only',
                // 'city.required' => 'Please Provide a City',
                // 'city.regex' => 'City Contain only Alphabets',
                // 'state.required' => 'Please Provide a State',
                // 'state.regex' => 'State Contain only Alphabets',
                // 'zip_code.required' => 'Please Provide a Zip Code',
            ]);
        
    }

    protected function create($request)
    {
        $data = $request;
        
        $validator = $this->validator($data);
        if($validator->fails())
            return Redirect::back()->withErrors($validator)->withInput();
        $user = new User();
        $user->first_name = $data['first_name'];
        $user->last_name = $data['last_name'];
        $user->contact = $data['phone'];
        $user->email = $data['email'];
        // $user->address_1 = $data['address_1'];
        // $user->address_2 = $data['address_2'];
        // $user->city = $data['city'];
        // $user->state = $data['state'];
        // $user->zip_code = $data['zip_code'];
        $user->password = Hash::make($data['password']);
        $user->save();
        $role = 'user';
        $user->assignRole($role);
        $profile = new Profile();
        $profile->user_id = $user->id;
        $profile->phone = $data['phone'];
        // $profile->address = $data['address_1'];
        // $profile->city = $data['city'];
        // $profile->state = $data['state'];
        // $profile->postal = $data['zip_code'];
        $profile->pic = 'profile.png';
        $profile->save();
        $firstname = $data['first_name'];
        $lastname = $data['last_name'];
        $data2["email"] = $data['email'];
        $email = $data['email'];
        $data2["name"] = $firstname.$lastname;
        $data = array('name'=>"$firstname $lastname",'email'=>"$email",'type'=>"");
        Mail::send('emails.regemail', $data,function ($m) use ($data,$data2) {
            $m->from('noreply@demo-customlinks.com', 'Your Email Has Been Registered Successfully');
            $m->to($data2["email"],$data2["name"])->subject('Your Email Has Been Registered Successfully');
        });
        // $data = array('type'=>"admin");
        $data = array('name'=>"$firstname $lastname",'email'=>"$email",'type'=>"admin");
        Mail::send('emails.regemail', $data,function ($m) use ($data,$data2) {
            $m->from('noreply@demo-customlinks.com', 'New User Registered');
            $m->to('noreply@demo-customlinks.com','Admin')->subject('New User Registered');
        });
        Auth::loginUsingId($user->id, TRUE);
        Session::flash('message', 'Your Email has been registered. Welcome '.$firstname.' '.$lastname);
        Session::flash('alert-class', 'alert-success');
        return $user;
    }
}
