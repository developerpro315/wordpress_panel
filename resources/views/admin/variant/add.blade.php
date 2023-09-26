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
<style type="text/css">
    p.error-message {
        color: #df0a0a;
        font-weight: 500;
        font-size: 14px;
    }
    input[type=number] {
  -moz-appearance: textfield;
}
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

</style>
@endpush

@section('content')
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12 col-md-12">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex m-b-10 no-block">
                        <h5 class="card-title m-b-0 align-self-center">Add Variant</h5>
                        <div class="ml-auto text-light-blue">
                            <ul class="nav nav-tabs customtab default-customtab list-inline text-uppercase lp-5 font-medium font-12"
                                role="tablist">
                            </ul>
                        </div>
                    </div>
                    <form action="{{url('panel/admin/variant/')}}" method="POST" enctype="multipart/form-data">
                        @csrf
                    <div id="single">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="product_id">Product:</label>
                                    <select name="product_id" class="form-control" id="prod">
                                        <option selected disabled>Select Product</option>
                                        @foreach($products as $product)
                                        <option value="{{$product->id}}" class="{{$product->category}}" {{((old('product_id') == $product->id)? 'selected':'')}} >{{$product->title}}</option>
                                        @endforeach
                                    </select>
                                    @error('product_id')
                                    <p class="error-message">**{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-lg-4">
                            <div class="form-group">
                                    <label for="size" style="display: block !important;">Size:</label>
                                    <select class="js-example-basic-multiple-limit form-control" id="size"
                                         name="size[]" style="width: 250px !important;" multiple>
                                         @foreach ($sizes as $key => $size)
                                             <option value="{{ $size->name }}">{{ $size->name }}</option>
                                         @endforeach
                                     </select>
                                    @error('size')
                                    <p class="error-message">**{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-lg-4">  
                                <div class="form-group">
                                    <label for="color" style="display: block !important;">Color:</label>
                                    <select class="js-example-basic-multiple-limit2 form-control" id="colors"
                                         name="color[]" style="width: 250px !important;" multiple>
                                         @foreach ($colors as $key => $color)
                                             <option value="{{ $color->color }}">{{ $color->color }}</option>
                                         @endforeach
                                     </select>
                                    @error('color')
                                    <p class="error-message">**{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                            <div class="form-group">
                                    <label for="price">Price:</label>
                                    <input type="number" class="form-control" name="price" value="{{ old('price') }}">
                                    @error('price')
                                    <p class="error-message">**{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-lg-6">
                            <div class="form-group">
                                    <label for="quantity">Quantity:</label>
                                    <input type="number" class="form-control" name="quantity" value="{{ old('quantity') }}">
                                    @error('quantity')
                                    <p class="error-message">**{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="multi" class="d-none">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="product_id">Product:</label>
                                    <select name="cproduct_id" class="form-control" id="prod2">
                                        <option selected disabled>Select Product</option>
                                        @foreach($products as $product)
                                        <option value="{{$product->id}}" class="{{$product->category}}" {{((old('product_id') == $product->id)? 'selected':'')}}>{{$product->title}}</option>
                                        @endforeach
                                    </select>
                                    @error('product_id')
                                    <p class="error-message">**{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-lg-4">  
                                <div class="form-group">
                                    <label for="color" style="display: block !important;">Color:</label>
                                    <select class="js-example-basic-multiple-limit2 form-control" id="colors"
                                         name="ccolor[]" style="width: 250px !important;" multiple>
                                         @foreach ($colors as $key => $color)
                                             <option value="{{ $color->color }}">{{ $color->color }}</option>
                                         @endforeach
                                     </select>
                                    @error('color')
                                    <p class="error-message">**{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                            <div class="form-group">
                                    <label for="price">Small Price:</label>
                                    <input type="number" class="form-control" name="sprice" value="{{ old('sprice') }}">
                                    <input type="text" class="form-control" name="size[]" value="['small','medium','large']"hidden>
                                    @error('sprice')
                                    <p class="error-message">**{{ $message }}</p>
                                    @enderror
                                </div>
                            <div class="form-group">
                                    <label for="price">Medium Price:</label>
                                    <input type="number" class="form-control" name="mprice" value="{{ old('mprice') }}">
                                    @error('mprice')
                                    <p class="error-message">**{{ $message }}</p>
                                    @enderror
                                </div>
                            <div class="form-group">
                                    <label for="price">Large Price:</label>
                                    <input type="number" class="form-control" name="lprice" value="{{ old('lprice') }}">
                                    @error('lprice')
                                    <p class="error-message">**{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-lg-6">
                            <div class="form-group">
                                    <label for="quantity">Quantity:</label>
                                    <input type="number" class="form-control" name="quantity" value="{{ old('quantity') }}">
                                    @error('quantity')
                                    <p class="error-message">**{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>
                        </div>
                    </div>


                        <button class="btn btn-success pull-center" type="submit">Add</button>
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
<script>
    $(document).ready(function(){
  $('#description').summernote({
    placeholder: 'Please Provide Details',
    tabsize: 2,
    height: 100
  });
  });
  $('#name').keyup(function() {
        let text = $(this).val().toLowerCase();
        text = text.replace(/[^a-z0-9]+/g, '-');
        $('#slug').val(text);
    });
    $(document).ready(function() {
             $('.js-example-basic-multiple-limit2').select2();
         });
    $(document).ready(function() {
             $('.js-example-basic-multiple-limit').select2();
         });
         $('#prod').on('change',function(){
           var cat = $('#cat').attr('class').className;
           alert(cat);
            if(cat = "2"){
                $('#single').addClass('d-none');
                $('#multi').removeClass('d-none');
            }
            else{
                $('#single').removeClass('d-none');
                $('#multi').addClass('d-none');
            }
         });
         $('select#dropDownId option:selected').val();
         $('#prod2').on('change',function(){
           var cat = $('#cat').attr('class').className;
           alert(cat);
            if(cat = "2"){
                $('#single').addClass('d-none');
                $('#multi').removeClass('d-none');
            }
            else{
                $('#single').removeClass('d-none');
                $('#multi').addClass('d-none');
            }
         });
</script>
<script src="{{asset('plugins/vendors/styleswitcher/jQuery.style.switcher.js')}}"></script>
<script src="{{ asset('https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js') }}"></script>
@endpush
