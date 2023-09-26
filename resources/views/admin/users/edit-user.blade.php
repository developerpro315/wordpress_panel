@extends('layouts.admin.app')
@section('title','Users')
@push('before-css')
<link href="{{asset('plugins/vendors/morrisjs/morris.css')}}" rel="stylesheet">
<link href="{{asset('plugins/vendors/c3-master/c3.min.css')}}" rel="stylesheet">
<link href="{{asset('plugins/vendors/toast-master/css/jquery.toast.css')}}" rel="stylesheet">
<link href="{{asset('plugins/vendors/vectormap/jquery-jvectormap-2.0.2.css')}}" rel="stylesheet"/>
<link href="{{asset('plugins/vendors/bootstrap-datepicker/bootstrap-datepicker.min.css')}}" rel="stylesheet" type="text/css"/>
<link href="{{asset('assets/css/pages/google-vector-map.css')}}" rel="stylesheet">
@endpush

@section('content')
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12 col-md-12">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex m-b-10 no-block">
                        <h5 class="card-title m-b-0 align-self-center">Update </h5>
                        <div class="ml-auto text-light-blue">
                            <ul class="nav nav-tabs customtab default-customtab list-inline text-uppercase lp-5 font-medium font-12" role="tablist">
                            </ul>
                        </div>
                    </div>
                    @foreach($user_detail as $user_info)
                    <form action="{{url('panel/admin/user-update/'.$user_info->id)}}" method="POST" enctype="multipart/form-data">
                        @csrf
                        @method('put')
                        <div class="form-group">
                            <div class="form-row">
                                <div class="col">
                                    <label for="first_name">User First Name:</label>
                                    <input type="text" class="form-control" id="first_name" name="first_name" value="{{$user_info->first_name}}">
                                </div>
                                <div class="col">
                                    <label for="last_name">User Last Name:</label>
                                    <input type="text" class="form-control" id="last_name" name="last_name" value="{{$user_info->last_name}}">
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="form-row">
                                <div class="col">
                                    <label for="email">User Email:</label>
                                    <input type="email" class="form-control" id="email" name="email" value="{{$user_info->email}}" disabled>
                                </div>
                                <div class="col">
                                    <label for="contact">User Phone:</label>
                                    <input type="text" class="form-control" id="contact" name="contact" value="{{$user_info->contact}}">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="form-row">
                                <div class="col">
                                    <label for="address_1">Address One:</label>
                                    <input type="text" class="form-control" id="address_1" name="address_1" value="{{$user_info->address_1}}">
                                </div>
                                <div class="col">
                                    <label for="address_2">Address Two:</label>
                                    <input type="text" class="form-control" id="address_2" name="address_2" value="{{$user_info->address_2}}">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="form-row">
                                <div class="col">
                                    <label for="city">City:</label>
                                    <input type="text" class="form-control" id="city" name="city" value="{{$user_info->city}}">
                                </div>
                                <div class="col">
                                    <label for="state">State:</label>
                                    <input type="text" class="form-control" id="state" name="state" value="{{$user_info->state}}">
                                </div>
                                <div class="col">
                                    <label for="zip_code">Zip:</label>
                                    <!-- maxlength="5" -->
                                    <input type="text" class="form-control" id="zip_code" name="zip_code" value="{{$user_info->zip_code}}">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            
                        </div>
                        <button class="btn btn-success pull-center" type="submit">Update</button>
                    </form>
                    @endforeach
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
<script>
    $(function () {
        $('#myTable').DataTable();
        var table = $('#example').DataTable({
            "columnDefs": [{
                "visible": false,
                "targets": 2
            }],
            "order": [
                [2, 'asc']
            ],
            "displayLength": 18,
            "drawCallback": function (settings) {
                var api = this.api();
                var rows = api.rows({
                    page: 'current'
                }).nodes();
                var last = null;
                api.column(2, {
                    page: 'current'
                }).data().each(function (group, i) {
                    if (last !== group) {
                        $(rows).eq(i).before('<tr class="group"><td colspan="5">' + group + '</td></tr>');
                        last = group;
                    }
                });
            }
        });
        // Order by the grouping
        $('#example tbody').on('click', 'tr.group', function () {
            var currentOrder = table.order()[0];
            if (currentOrder[0] === 2 && currentOrder[1] === 'asc') {
                table.order([2, 'desc']).draw();
            } else {
                table.order([2, 'asc']).draw();
            }
        });

    });
    $('#example23').DataTable({
        dom: 'Bfrtip',
        buttons: [
            'copy', 'csv', 'excel', 'pdf', 'print'
        ]
    });
</script>
<script src="{{asset('plugins/vendors/styleswitcher/jQuery.style.switcher.js')}}"></script>
@endpush
