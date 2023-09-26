@extends('layouts.front.app')
@section('title', 'Booking')
@section('css')
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="{{asset('plugins/vendors/bootstrap/css/bootstrap.min.css')}}" rel="stylesheet">
<link href="{{asset('assets/css/style.css')}}" rel="stylesheet">
<style>
    .sidebar-text{
        color:#fff !important
    }

</style>
@endsection
@push('js')
<script>
    function printDiv() {
        var divContents = document.getElementById("content").innerHTML;
        var a = window.open('', '', 'height=500, width=500');
        a.document.write('<html><head><link href="{{ asset('web-assets/css/bootstrap.css')}}" rel="stylesheet"><link href="{{ asset('web-assets/css/custom.css')}}" rel="stylesheet"></head>');
        a.document.write('<body>');
        a.document.write(divContents);
        a.document.write('</body></html>');
        a.document.close();
        a.print();
    }
</script>
@endpush
@section('content')
<section class="all-banners" >
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h2>Booking Details</h2>
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
        <div class="row">
            <div class="col-sm-12">
                <div class="white-box card">
                    <div class="card-body"><span class="mt-5">
                        <h3 class="box-title pull-left">Booking # {{$order->order_number}}</h3>
                    </span>
                            <a href="{{url('user/booking')}}" class="btn waves-effect waves-light btn-rounded btn-primary float-right"> Back</a>
                            <input type="button" class="btn waves-effect waves-light btn-rounded float-right" value="Print" onclick="printDiv()"> 
                            {{-- <a href="{{url('user/booking')}}" class="btn waves-effect waves-light btn-rounded float-right"> Print</a> --}}
                            <div id="content">
                            <div class="clearfix"></div>
                            <hr>
                            <div class="row mt-4">
                                <div class="col-md-4 offset-1">
                                    <label for="firstname"><h5>Booking number :</h5></label>
                                    <span id="firstname">{{ $order->order_number }}</span><br>
                                    <label for="firstname"><b>Name :</b></label>
                                    <span id="firstname">{{ $customer->first_name }} {{ $customer->last_name }}</span><br>
    
                                    <label for="firstname"><b>Address :</b></label>
                                    <span id="firstname">{{ $order->billing_address1 }}, {{ $order->billing_address2 }}</span><br>
                                    <label for="useremail"><b>Email :</b></label>
                                    <span id="useremail">{{ $customer->email }}</span><br>
    
                                    <label for="lastname"><b>City :</b></label>
                                    <span id="lastname">{{ $order->billing_city }}, {{ $order->billing_state }}</span><br>
                                    <label for="usercontact"><b>Contact :</b></label>
                                    <span id="usercontact">{{ $customer->contact }}</span><br>
                                    <label for="lastname"><b>Zip Code :</b></label>
                                    <span id="lastname">{{ $order->billing_zipcode }}</span>
                                </div>
                            </div><hr>
                            <h2 class="text-center">Booking Details</h2>
                            <div class="row mt-4">
                                <div class="col-md-4">
    
                                    <label for="firstname"><b>Service Name :</b></label>
                                    <span id="firstname">{{ $order->service_name }}</span><br>
                                    <label for="firstname"><b>Booking Date :</b></label>
                                    <span id="firstname">{{ $order->booking_date }}</span><br>
                                </div>
                                <div class="col-md-4">
                                    
                                    <label for="useremail"><b>Package Name :</b></label>
                                    <span id="useremail">{{ $order->package_name }}</span><br>
    
                                    <label for="lastname"><b>Booking Time :</b></label>
                                    <span id="lastname">{{ $order->booking_time }}</span><br>
                                </div>
                                <div class="col-md-4">
                                    <label for="usercontact"><b>Total Price :</b></label>
                                    <span id="usercontact">${{ $order->package_price }}</span><br>
    
                                    <label for="lastname"><b>Create Date :</b></label>
                                    <span id="lastname">{{ $order->created_at }}</span>
                                </div>
                            </div> <br><br>                      
                            <h2 class="text-center">Billing Information</h2>
                            <div class="row mt-4">
                                <div class="col-md-4">    
                                    <label for="firstname"><b>SubTotal :</b></label>
                                    <span id="firstname">${{ $order->package_price }}</span><br>    
                                </div>
                                <div class="col-md-4">
                                    <label for="firstname"><b>Total Amount :</b></label>
                                    <span id="firstname">${{ $order->package_price }}</span><br></div>
                                <div class="col-md-4">                            <label for="lastname"><b>Payment Status :</b></label>
                                    <span id="lastname">{{ $order->payment_status }}</span><br></div>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
        </div>
</div>
</div>
@endsection


@push('js')
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
        $('#example tbody').on('click', 'tr.group', function () {
            var currentOrder = table.order()[0];
            if (currentOrder[0] === 2 && currentOrder[1] === 'asc') {
                table.order([2, 'desc']).draw();
            }
            else {
                table.order([2, 'asc']).draw();
            }
        });
    });
</script>
@endpush 
