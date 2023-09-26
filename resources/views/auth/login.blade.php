@extends('layouts.front.app')
@section('title', 'Login / Register')
@section('content')
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" rel="stylesheet">
<style type="text/css">
    .error-message {
        border-color: red !important;
        color: red;
    }
    body{background: #000}.card{border: none;height: 320px}.forms-inputs{position: relative}.forms-inputs span{position: absolute;top:-18px;left: 10px;background-color: #fff;padding: 5px 10px;font-size: 15px}.forms-inputs input{height: 50px;border: 2px solid #eee}.forms-inputs input:focus{box-shadow: none;outline: none;border: 2px solid #000}.btn{height: 50px}.success-data{display: flex;flex-direction: column}.bxs-badge-check{font-size: 90px}
    .forms-inputs input {
    height: 50px;
    width: 100%;
    border: 2px solid #eee;
}
</style>

  <form action="{{ route('login') }}" method="POST">
    @csrf
      <div class="container mt-5">
          <div class="row d-flex justify-content-center">
              <div class="col-md-6">
                  <div class="card px-5 py-5">
                      <div class="form-data">
                          <div class="forms-inputs mb-4"> <span>Email or username</span> 
                          <input type="text" name="email" value="{{ old('email') }}" @error('email') class="error-message" @enderror>
                              <div class="invalid-feedback">A valid email is required!</div>
                          </div>
                          <div class="forms-inputs mb-4"> <span>Password</span> 
                          <input type="password" name="password" value="{{ old('password') }}"  @error('password') class="error-message" @enderror>
                              <div class="invalid-feedback">Password must be 8 character!</div>
                          </div>
                          <div class="mb-3"> <button type="submit" class="btn btn-dark w-100">Login</button> </div>
                      </div>
                      <div class="success-data">
                          <div class="text-center d-flex flex-column">  <a href="{{ route('password.request') }}">Forgot Password?</a></div>
                      </div>
                  </div>
              </div>
          </div>
      </div>
  </form>






    @endsection
    @section('js')
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

    @error('first_name') 
    <script>toastr.error("{{$message}}")</script>
    @enderror
    @error('last_name') 
    <script>toastr.error("{{$message}}")</script>
    @enderror
    @error('email') 
    <script>toastr.error("{{$message}}")</script>
    @enderror
    @error('phone') 
    <script>toastr.error("{{$message}}")</script>
    @enderror
    @error('password') 
    <script>toastr.error("{{$message}}")</script>
    @enderror
    @endsection