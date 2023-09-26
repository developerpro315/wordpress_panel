@extends('layouts.front.app')
@section('title', 'Profile')
@section('css')
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
    .sidebar-text{
        color:#fff !important
    }

</style>
@endsection
@section('content')
<section class="all-banners" >
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h2>Update Profile</h2>
            </div>
        </div>
    </div>
</section>
<div class="login_content_area">
<div class="container">
    <div class="row">
    <div class="col-md-3">
        <div class="side-bar" style="height:800px; background-color:#005a8985 !important;">
            <ul class="side-bar-nav">
              <li><h3 class="sidebar-text">My Account</h3></li>
              <li class="current article_col"><i class="fa fa-user sidebar-text" aria-hidden="true" ></i><a href="{{url('user/profile')}}" class="sidebar-text" >Profile</a></li>
              <li class="current article_col" ><i class="fa fa-shopping-cart sidebar-text" aria-hidden="true"></i><a href="{{url('user/booking')}}" class="sidebar-text">Bookings</a></li>
            </ul>
          </div>
    </div>
    <div class="col-md-9">
        <div class="m-5" style="margin-top: 100px !important">
            <form action="{{ route('userProfile') }}" method="POST">
                @csrf
                <div class="form_area ">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="fields_area">
                                <input name="first_name" type="text" placeholder="First Name" class="form-control" style="border-color:#bfbfbf" value="{{ Auth()->user()->first_name }}">
                                @error('first_name')
                                <p class="error-message">**{{ $message }}</p>
                                @enderror
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="fields_area">
                                <input name="last_name" type="text" placeholder="Last name" class="form-control" style="border-color:#bfbfbf" value="{{ Auth()->user()->last_name }}">
                                @error('last_name')
                                <p class="error-message">**{{ $message }}</p>
                                @enderror
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="fields_area">
                                <input name="contact" type="number" placeholder="Contact Number" class="form-control" style="border-color:#bfbfbf" value="{{ Auth()->user()->contact }}">
                                @error('contact')
                                <p class="error-message">**{{ $message }}</p>
                                @enderror
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="fields_area">
                                <input name="address_1" type="text" placeholder="Address one" class="form-control" style="border-color:#bfbfbf" value="{{ Auth()->user()->address_1 }}">
                                @error('address_1')
                                <p class="error-message">**{{ $message }}</p>
                                @enderror
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="fields_area">
                                <input name="address_2" type="text" placeholder="Address Two" class="form-control" style="border-color:#bfbfbf" value="{{ Auth()->user()->address_2}}">
                                @error('address_2')
                                <p class="error-message">**{{ $message }}</p>
                                @enderror
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-4">
                            <div class="fields_area">
                                <input name="city" type="text" placeholder="City" class="form-control" style="border-color:#bfbfbf" value="{{ Auth()->user()->city }}">
                                @error('city')
                                <p class="error-message">**{{ $message }}</p>
                                @enderror
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="fields_area">
                                <input name="state" type="text" placeholder="State" class="form-control" style="border-color:#bfbfbf" value="{{ Auth()->user()->state}}">
                                @error('state')
                                <p class="error-message">**{{ $message }}</p>
                                @enderror
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="fields_area">
                                <input type="number" name="zip_code" maxlength="5" placeholder="Zip Code" value="{{ Auth()->user()->zip_code}}" class="form-control" style="border-color:#bfbfbf">
                                @error('zip_code')
                                <p class="error-message">**{{ $message }}</p>
                                @enderror
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 offset-4">
                        <div class="fields_area buttons_area">
                            <button class="btn1">Update</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        {{-- <div style="background-color:#fff;padding-top:100px;"></div> --}}
    </div>
    
</div>

</div>
@endsection