@extends('layouts.front.app')
@section('title', 'Profile')
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
       
                 @if($order_display)
                    <div class="table-responsive m-t-10 mt-5" style="margin-top: 100px !important">

                        <table id="myTable" class="table color-table table-bordered product-table table-hover">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Booking Number</th>
                                    <th>Service Name</th>
                                    <th>Payment Status</th>
                                    <th>Price</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>

                            @foreach($order_display as $key=>$order_detail)
                                <tr>
                                    <td>{{ $key+1 }}</td>
                                    <td>{{ $order_detail->order_number }}</td>
                                    <td>{{ $order_detail->service_name }}</td>
                                    <td>{{ $order_detail->payment_status }}</td>
                                    <td>${{ $order_detail->package_price }}</td>
                                    

                                    <td class="text-center">
                                                                          
                                    <form action="{{route('bookingdetails')}}" method="POST" class="d-inline">
                                        @csrf
                                            <input type="hidden" name="id" value="{{$order_detail->order_number}}">
                                        <button style="background-color: transparent;border-color:transparent"><i class="fas fa-eye"></i></button>
                                    </form>
                                    </td>
                                    </tr>
                                @endforeach
                                </tbody>
                            </table>
                        </div>
                        @endif
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
