@extends('layouts.admin.app')
@section('title', 'Website Configuration')
@push('before-css')
<link href="{{ asset('https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css') }}" rel="stylesheet">
@endpush
@section('content')
<div class="container-fluid config">
    <div class="row">
        <div class="col-lg-12 col-md-12">
            <div class="card">
                <form method="POST" action="{{url('panel/admin/config')}}">
                @csrf
                <div class="card-body">
                    <h3>Global Detail</h3>
                    <hr>
                    <div class="row">
                        <div class="col-lg-12 col-md-12">
                            <div class="row">
                                <div class="form-wrap form-wrap2 mt-4">
                                    <div class="form-group m-b-15">
                                        <div class="row m-0 m-b-20">
                                            <?php
                                            $_getConfig=DB::table('m_flag')->where('is_active','1')->where('is_config','1')->orderBy('id')->get();
                                            ?>

                                            @foreach($_getConfig as $_Config)

                                            @if($_Config->type='1' && $_Config->id!='1972')
                                            <div class="col-sm-6 col-xs-6">
                                                <div class="form-group m-b-15">
                                                    <label class="control-label text-primary font-12 m-b-5">{{$_Config->flag_show_text}}
                                                    </label>
                                                    <div>
                                                        <input class="form-control font-14 {{$_Config->flag_show_text}}" placeholder="{{$_Config->flag_show_text}}" name="{{$_Config->flag_type}}" type="text" value="{{$_Config->flag_value}}">
                                                    </div>
                                                </div>
                                            </div>
                                            @elseif($_Config->id=='1972')
                                            <div class="col-sm-12 col-xs-12">
                                                <div class="form-group m-b-15">
                                                    <label class="control-label text-primary font-12 m-b-5">{{$_Config->flag_show_text}}
                                                    </label>
                                                    <div>
                                                        <!-- <input class="form-control font-14 {{$_Config->flag_show_text}}" placeholder="{{$_Config->flag_show_text}}" name="{{$_Config->flag_type}}" type="text" value="{{$_Config->flag_value}}"> -->
                                                        <textarea class="form-control font-14 {{$_Config->flag_show_text}}" id="textarea" name="{{$_Config->flag_type}}">{{$_Config->flag_value}}</textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            @else
                                            <h3>Social Media</h3>
                                            <hr>
                                            <div class="col-sm-6 col-xs-6">
                                                <div class="form-group m-b-15">
                                                    <label class="control-label text-primary font-12 m-b-5">{{$_Config->flag_show_text}}
                                                    </label>
                                                    <div>
                                                        <input class="form-control font-14" placeholder="Address" name="{{$_Config->flag_type}}" type="text" value="{{$_Config->flag_value}}">
                                                    </div>
                                                </div>
                                            </div>
                                            @endif
                                            @endforeach
                                        </div>
                                    </div>

                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12 col-md-12">
                        <input type="Submit" value="Update" >
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>



</div>

@endsection



@push('js')
<script src="{{asset('plugins/vendors/d3/d3.min.js')}}"></script>
<script src="{{asset('plugins/vendors/c3-master/c3.min.js')}}"></script>
<script src="{{asset('plugins/vendors/knob/jquery.knob.js')}}"></script>
<script src="{{asset('plugins/vendors/sparkline/jquery.sparkline.min.js')}}"></script>
<script src="{{asset('plugins/vendors/vectormap/jquery-jvectormap-2.0.2.min.js')}}"></script>
<script src="{{asset('plugins/vendors/vectormap/jquery-jvectormap-world-mill-en.js')}}"></script>
<script src="{{asset('plugins/vendors/raphael/raphael-min.js')}}"></script>
<script src="{{asset('plugins/vendors/morrisjs/morris.js')}}"></script>
<script src="{{asset('plugins/vendors/toast-master/js/jquery.toast.js')}}"></script>
<script src="{{asset('assets/js/dashboard-shop.js')}}"></script>

<script src="{{ asset('https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js') }}"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/cleave.js/1.6.0/cleave.min.js"></script>
<script type="text/javascript">

    var cleave = new Cleave('.Phone', {
        delimiters: ['-', '-', ' '],
        blocks: [3, 3, 4]
    });
    $('#textarea').summernote({
            placeholder: 'Type News Details',
            tabsize: 2,
            height: 100
        });
    $('input[name="files"]').removeAttr("name");
</script>
@endpush
