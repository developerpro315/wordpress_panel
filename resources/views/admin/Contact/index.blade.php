@extends('layouts.admin.app')

@section('title','Sell Inquiries')

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

                        <h5 class="card-title m-b-0 align-self-center">Sell Inquiries</h5>

                        <div class="ml-auto text-light-blue">

                            <ul class="nav nav-tabs customtab default-customtab list-inline text-uppercase lp-5 font-medium font-12" role="tablist">

                            </ul>

                        </div>

                    </div>



                    @if($contact_inquiry)

                    <div class="table-responsive m-t-10">

                        <table id="myTable" class="table color-table table-bordered product-table table-hover">

                            <thead>

                                <tr>

                                    <th>#</th>
                                    <th>ID</th>
                                    <th>Package</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Currancy</th>
                                    <th>Unit Price</th>
                                    <th>Qty</th>
                                    <th>Total Price</th>
                                    <th>Payment Email</th>

                                    <th>Date</th>
                                    <!-- <th>Action</th> -->

                                </tr>

                            </thead>

                            <tbody>

                                @foreach($contact_inquiry as $key => $item)
                                <tr>
                                    <td>{{ $key+1}}</td>
                                    <td>{{ $item->uid }}</td>
                                    <td>{{ $item->package }}</td>
                                    <td>{{ $item->name }}</td>
                                    <td>{{ $item->email }}</td>
                                    <td>{{ $item->currency }}</td>
                                    <td>${{ $item->price }}</td>
                                    <td>{{ $item->qty }}</td>
                                    <td>${{ $item->qty * $item->price }}</td>
                                    <td>{{ $item->cur_email }}</td>
                                    <td><?= date_format($item->created_at,"d-M-Y") ?></td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                    @endif
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

        // $('#myTable').DataTable( {
        //     "order": [[ 3, "desc" ]]
        // });

        $('#myTable').DataTable({
            order: [[ 0, "desc" ]],
        });

        var table = $('#example').DataTable({

            "columnDefs": [{

                "visible": false,

                "targets": 2

            }],

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

    });

</script>

<script src="{{asset('plugins/vendors/styleswitcher/jQuery.style.switcher.js')}}"></script>

@endpush

