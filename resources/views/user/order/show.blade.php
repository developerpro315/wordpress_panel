@extends('layouts.admin.app')
@section('title', 'Orders')
<style type="text/css">
    .status_select {
    width: 14%;
    text-align: right;
    height: 150px;
    padding: 16px 3px 10px 10px;
}
.status_select button {
    text-align: center;
    width: 137px;
    height: 32px;
}
</style>

@section('content')
<div class="container-fluid bg-white mt-5">
    <div class="row">
        <div class="col-sm-12">
            <div class="white-box card">
                <div class="card-body">
                    <h3 class="box-title pull-left">Order # {{$order->number}}</h3>
                        <a href="{{url('/panel/User/orders/')}}" class="btn waves-effect waves-light btn-rounded btn-primary float-right"> Back</a>
                        <div class="clearfix"></div>
                        <hr>
                        <h2 class="text-center">Order Details</h2>
                        <hr>
                        <div class="row">
                            <div class="col-md-6">
                                <h2>Customer Information:</h2>

                                <label for="firstname"><b>Customer Name :</b></label>
                                <span id="firstname">{{ $order->first_name }} {{ $order->last_name }}</span><br>

                                <label for="useremail"><b>Email :</b></label>
                                <span id="useremail">{{ $order->email }}</span><br>

                                <label for="usercontact"><b>Contact :</b></label>
                                <span id="usercontact">{{ $order->contact }}</span><br>

                                    <label for="firstname"><b>Address :</b></label>
                                <span id="firstname">{{ $order->address1 }}, {{ $order->address2 }}</span><br>

                                <label for="lastname"><b>Country :</b></label>
                                <span id="lastname">{{ $order->country }}</span><br>

                                <label for="lastname"><b>City :</b></label>
                                <span id="lastname">{{ $order->city }}</span><br>

                            </div>

                            <div class="col-md-6">
                                <h2>Billing Information:</h2>

                                <label for="firstname"><b>SubTotal :</b></label>
                                <span id="firstname">${{ $order->subtotal }}</span><br>

                                <label for="firstname"><b>Total Amount :</b></label>
                                <span id="firstname">${{ $order->total }}</span><br>

                                <label for="lastname"><b>Quantity :</b></label>
                                <span id="lastname">{{ $order->quantity }}</span><br>

                                <label for="lastname"><b>Payment Status :</b></label>
                                <span id="lastname">{{ $order->payment_status }}</span><br>

                                <label for="lastname"><b>Transaction Id :</b></label>
                                <span id="lastname">{{ $order->transaction_id }}</span><br>
                            </div>
                        </div>
                        <br>
                        @if($OrderDetails)
                            <div class="table-responsive m-t-10">
                                <table id="myTable" class="table color-table table-bordered product-table table-hover">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>Product Name</th>
                                            <th>Price</th>
                                            <th>Quantity</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    @foreach($OrderDetails as $index => $item)
                                        <tr class="get_order_number">
                                            <td>{{ $item->id }}</td>
                                            <td>{{ $item->product_name }}</td>
                                            <td>${{ $item->total_price }}</td>
                                            <td>{{ $item->quantity }}</td>
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
@endpush





