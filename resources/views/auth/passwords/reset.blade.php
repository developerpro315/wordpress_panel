@extends('layouts.front.app')
@section('title', 'Reset Password')
@section('css')
    <style type="text/css">
        .error-message {
            border-color: red !important;
            color: red;
        }
        .forget-center {
    justify-content: center;
}
    </style>
@endsection
@section('content')
@php
    $value = \App\model\Banner::where('page_name', 'Forget Password')->first();
    @endphp
  <section class="inner-banner-sec">
        <img src="{{asset($value->image_path)}}" alt="img">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="inner-banner-txt">
                        <h1>{{$value->heading}}</h1>
                    </div>
                </div>
            </div>
        </div>
    </section>

<section class="contact-page-main log-in-page-main">

      <div class="container">

        <div class="row forget-center">
          <div class="col-lg-6 col-md-12 wow fadeInRight" data-wow-delay="0.4s">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif
                     @if($errors->any())
                    @foreach($errors as $error_message)
                    <p>{{$error_message}}</p>
                    @endforeach
                    @endif
            <div class="log-in-wrap">

              <h2>{{ __('Reset Password') }}</h2>

              <form action="{{ route('password.update') }}" method="POST">
                    @csrf
                        <input type="hidden" name="token" value="{{ $token }}">
                <div class="row">

                  <div class="col-md-12">

                    <div class="form-group">

                    <input name="email" type="hidden" placeholder="Email" class="form-control text-dark" value="{{ $email ?? old('email') }}" required autocomplete="email" autofocus>
                    <input name="email-show" type="email" placeholder="Email" disabled class="form-control" value="{{ $email ?? old('email') }}" required autocomplete="email" autofocus>

                    </div>

                  </div>
                  <div class="col-md-12">

                    <div class="form-group">

                      <!-- <input type="password" class="form-control" name="password" placeholder="Password" value="{{ old('password') }}"> -->
                      <input name="password" type="password" placeholder="Password" class="form-control @error('password') is-invalid @enderror" value="{{ old('password') }}">
                                        @error('password')
                                        <p class="error-message">**{{ $message }}</p>
                                        @enderror
                    </div>

                  </div>

                  <div class="col-md-12">

                    <div class="form-group">

                    <input id="password-confirm" type="password" placeholder="Confirm Password" class="text-dark form-control" name="password_confirmation" required autocomplete="new-password">
                      @error('password_confirmation')
                                        <p class="error-message">**{{ $message }}</p>
                                        @enderror
                    </div>

                  </div>

                  <div class="col-md-12">

                    <button type="submit" class="btn13 width-100 mb-15">{{ __('Reset Password') }}</button>

                  </div>

                </div>

                </form>

            </div>

          </div>

            

        </div>

      </div>
    </section>@endsection