@extends('layouts.admin.app')



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
                        <h5 class="card-title m-b-0 align-self-center">Section Info</h5>
                        <div class="ml-auto text-light-blue">
                            <ul class="nav nav-tabs customtab default-customtab list-inline text-uppercase lp-5 font-medium font-12" role="tablist">

                            </ul>
                        </div>
                    </div>

                    @if($Home_Section)
                    <div class="table-responsive m-t-10">
                        <a class="btn btn-success" href="{{url('panel/admin/home_section/add/')}}" role="button">Add More</a>

                        <table id="myTable" class="table color-table table-bordered product-table table-hover">

                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Title</th>
                                    <th>Desciptoin</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($Home_Section as $Home_Section_detail)
                                <tr>
                                    <td>{!! $Home_Section_detail->id !!}</td>
                                    <td>{!! $Home_Section_detail->heading !!}</td>
                                    <td><?= html_entity_decode($Home_Section_detail->description) ?></td>
                                    <td class="text-center">

                                        <a href="{{ url('panel/admin/home_section/view',$Home_Section_detail->id) }}"><i class="fas fa-eye"></i></a>
                                        <a href="{{ url('panel/admin/home_section/edit/'.$Home_Section_detail->id) }}"><i class="fas fa-edit"></i></a>
                                        <a href="{{ url('panel/admin/home_section/delete',$Home_Section_detail->id) }}" onclick='return confirm("Confirm delete?")'><i class="fas fa-trash-alt text-danger"></i></a>
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

    $('#example23').DataTable({
        dom: 'Bfrtip',
        buttons: [
        'copy', 'csv', 'excel', 'pdf', 'print'
        ]
    });
</script>
<script src="{{asset('plugins/vendors/styleswitcher/jQuery.style.switcher.js')}}"></script>

@endpush
