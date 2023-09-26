@extends('layouts.admin.app')
@section('title','Users')
@push('after-css')

@endpush

@section('content')
    <div class="container-fluid">
        <!-- .row -->
        <div class="row">
            <div class="col-sm-12">
                <div class="white-box card">
                    <div class="card-body">
                        <h3 class="box-title pull-left">Users List</h3>

                        <div class="clearfix"></div>
                        <hr>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="table-responsive">
                                    <table id="myTable"  class="table color-table table-striped product-table table-hover">
                                        <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>Actions</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        @foreach($users as $key=>$user)

                                        @if($user->email != auth()->user()->email)
                                            <tr>
                                                <td>{{$key+1}}</td>
                                                <td>{{$user->first_name}} {{$user->last_name}}</td>
                                                <td>{{$user->email}}</td>
                                                <th>
                                                    <a  href="{{ url('panel/admin/user/'.$user->id) }}"><i class="fa fa-eye"></i></a>
                                                <a  href="{{ url('panel/admin/user-edit/'.$user->id) }}"><i class="fas fa-edit"></i></a>
                                                    <form style="display: inline-block;" method="POST" action="{{ url('panel/admin/user/delete/'.$user->id) }}">
                                                        @csrf
                                                        <button  onclick='return confirm("Confirm delete?")' style="border: none;outline: none;padding:0;" type="submit"><i class="fas fa-trash-alt text-danger"></i></button>
                                                    </form>
                                                </th>
                                            </tr>
                                        @endif
                                        @endforeach
                                        </tbody>
                                    </table>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        @include('layouts.admin.includes.templates.footer')
    </div>
@endsection

@push('js')
    <script src="{{asset('plugins/components/toast-master/js/jquery.toast.js')}}"></script>
    <script src="{{asset('plugins/vendors/datatables/jquery.dataTables.min.js')}}"></script>
<script>
    $(function () {
        $('#myTable').DataTable({
            "order": [[ 2, "desc" ]]
        });
    });
</script>
    <script>
        $(document).ready(function () {
            $(document).on('click', '.delete', function (e) {
                if (confirm('Are you sure want to delete?')) {
                }
                else {
                    return false;
                }
            });
            @if(\Session::has('message'))
            $.toast({
                heading: 'Success!',
                position: 'top-center',
                text: '{{session()->get('message')}}',
                loaderBg: '#ff6849',
                icon: 'success',
                hideAfter: 3000,
                stack: 6
            });
            @endif
        })

        // $(function () {
        //     $('#myTable').DataTable({
        //         "columns": [
        //             null, null, null, {"orderable": false}
        //         ]
        //     });

        // });
    </script>

@endpush
