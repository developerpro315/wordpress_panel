@extends('layouts.admin.app')
@section('title', 'Variant')
@push('before-css')
<link href="{{asset('plugins/vendors/morrisjs/morris.css')}}" rel="stylesheet">
<link href="{{asset('plugins/vendors/c3-master/c3.min.css')}}" rel="stylesheet">
<link href="{{asset('plugins/vendors/toast-master/css/jquery.toast.css')}}" rel="stylesheet">
<link href="{{asset('plugins/vendors/vectormap/jquery-jvectormap-2.0.2.css')}}" rel="stylesheet"/>
<link href="{{asset('plugins/vendors/bootstrap-datepicker/bootstrap-datepicker.min.css')}}" rel="stylesheet" type="text/css"/>
<link href="{{asset('assets/css/pages/google-vector-map.css')}}" rel="stylesheet">
<link href="{{ asset('https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css') }}" rel="stylesheet">
@endpush
@section('content')
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12 col-md-12">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex m-b-10 no-block">
                        <h5 class="card-title m-b-0 align-self-center">Update Variant</h5>
                        <div class="ml-auto text-light-blue">
                            <ul class="nav nav-tabs customtab default-customtab list-inline text-uppercase lp-5 font-medium font-12" role="tablist">
                            </ul>
                        </div>
                    </div>
                    <form action="{{url('panel/admin/variant/'.$variant->id)}}" method="POST" enctype="multipart/form-data">
                        @csrf
                        @method('put')
                        <div class="row">
                        <div class="col-md-4">
                                <div class="form-group">
                                    <label for="product_id">Product :</label>
                                    <select name="product_id" class="form-control">
                                        <option selected disabled>Select Product</option>
                                        @foreach($products as $product)
                                        <option value="{{$product->id}}" {{($variant->product_id == $product->id ) ? 'selected' : ''}}>{{$product->title}}</option>
                                        @endforeach
                                    </select>
                                    @error('product_id')
                                    <p class="error-message">**{{ $message }}</p>
                                    @enderror
                                </div>
                                        
                            </div>
                            <div class="col-lg-4">
                            <div class="form-group">
                                  <label for="size" style="display:block;">Color:</label>
                                     <!--  <select name="size" class="form-control">
                                        <option selected disabled>Select Size</option>
                                        @foreach($sizes as $size)
                                        <option value="{{$size->id}}" {{(($size->id == $variant->size)? 'selected':'')}}>{{$size->name}}</option>
                                        @endforeach
                                    </select> -->
                                    <select class="js-example-basic-multiple-limit form-control" id="color"
                                         name="color[]" style="width: 250px !important;" multiple>
                                         @if($colorsel)
                                         @foreach ($colorsel as $key => $colorss)
                                             <option value="{{ $colorss->color }}" selected>{{ $colorss->color }}</option>
                                         @endforeach
                                         @endif
                                         @foreach ($colors as $key => $color)
                                             <option value="{{ $color->color }}">{{ $color->color }}</option>
                                         @endforeach
                                     </select>
                                    @error('color')
                                    <p class="error-message">**{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-lg-4">  
                                <div class="form-group">
                                    <label for="color" style="display:block;">Size:</label>
                                    <!-- <select name="color" class="form-control">
                                        <option selected disabled>Select Color</option>
                                        @foreach($colors as $color)
                                        <option value="{{$color->id}}" {{(($color->id == $variant->color)? 'selected':'')}}>{{$color->color_name}}</option>
                                        @endforeach
                                    </select> -->
                                    <select class="js-example-basic-multiple-limit2 form-control" id="size"
                                         name="size[]" style="width: 250px !important;" multiple>
                                         @if($sizesel)
                                         @foreach ($sizesel as $key => $sizess)
                                             <option value="{{ $sizess->name }}" selected>{{ $sizess->name }}</option>
                                         @endforeach
                                         @endif
                                         @foreach ($sizes as $key => $size)
                                             <option value="{{ $size->name }}">{{ $size->name}}</option>
                                         @endforeach
                                     </select>
                                    @error('size')
                                    <p class="error-message">**{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                        </div>
                            <div class="row">
                                <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="price">Price:</label>
                                            <input type="number" class="form-control" id="price" name="price" value="{{ $variant->price }}">
                                            @error('price')    
                                            <p class="error-message">**{{ $message }}</p>
                                            @enderror
                                        </div>
                                    </div>
                                <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="service">Quantity:</label>
                                            <input type="number" class="form-control" id="quantity" name="quantity" value="{{ $variant->quantity }}">
                                            @error('quantity')    
                                            <p class="error-message">**{{ $message }}</p>
                                            @enderror
                                        </div>
                                    </div>
                                <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="service">Status:</label>
                                            <select class="form-control" name="status" aria-label=".form-select-sm example">
                                                @if($variant->status==1)
                                                <option value="1" selected>Active</option>
                                                <option value="0">Hidden</option>
                                                @else
                                                <option value="1">Active</option>
                                                <option value="0" selected>Hidden</option>
                                                @endif
                                              </select>
                                            @error('status')    
                                            <p class="error-message">**{{ $message }}</p>
                                            @enderror
                                        </div>
                                    </div>

                                </div>
                        <button class="btn btn-success pull-center" type="submit">Update</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    @include('layouts.admin.includes.templates.footer')
</div>
@endsection
@push('js')
<script src="{{asset('plugins/vendors/d3/d3.min.js')}}"></script>
<script src="{{asset('plugins/vendors/c3-master/c3.min.js')}}"></script>
<script src="{{asset('plugins/vendors/knob/jquery.knob.js')}}"></script>
<script src="{{asset('plugins/vendors/sparkline/jquery.sparkline.min.js')}}"></script>
<script src="{{asset('plugins/vendors/raphael/raphael-min.js')}}"></script>
<script src="{{asset('plugins/vendors/morrisjs/morris.js')}}"></script>
<script src="{{asset('plugins/vendors/toast-master/js/jquery.toast.js')}}"></script>
<script src="{{asset('plugins/vendors/datatables/jquery.dataTables.min.js')}}"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script src="{{asset('plugins/vendors/styleswitcher/jQuery.style.switcher.js')}}"></script>
<script src="{{ asset('https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js') }}"></script>
<script>
        $(document).ready(function() {
             $('.js-example-basic-multiple-limit2').select2();
         });
    $(document).ready(function() {
             $('.js-example-basic-multiple-limit').select2();
         });
</script>
@endpush
