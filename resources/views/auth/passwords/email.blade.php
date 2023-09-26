@extends('layouts.front.app')
@section('title', 'Forget Password')
@section('css')
    <style type="text/css">
        .error-message {
            border-color: red !important;
            color: red !important;
        }
        .forget-center {
    justify-content: center;
}
.contact-pg-input-bttn button {
    width: 41%;
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

<section class="contact-us-pg contact-page-main cont-pg-form  log-in-page-main">
      <div class="container">
        <div class="row forget-center">
          <div class="col-lg-6 col-md-12 wow fadeInLeft" data-wow-delay="0.4s">
                    @if (session('status'))
                        <div class="alert alert-success " role="alert">
                            {{ session('status') }}
                        </div>
                    @endif
            <div class="log-in-wrap">

              <h2>Forget Your Password</h2>

              <form action="{{ route('password.email') }}" method="POST">
                        @csrf
                <div class="row">
                  <div class="col-md-12">

                    <div class="form-group">
                    <input type="email" name="email" class="mt-2 form-control " placeholder="Email" value=""  @error('email') class="error-message" @enderror>
                      </div>
                      @error('email')
                        <span class="error-message">**{{ $message }}</span>
                        @enderror
                      </div>
                  <div class="col-md-12 contact-pg-input-bttn">

                    <button type="submit" class="btn13 width-100 mb-15">Send Email verification</button>

                  </div>
                </div>

                </form>

            </div>

          </div>           
        </div>
      </div>
    </section>
    @endsection
