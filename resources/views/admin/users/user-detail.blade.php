@extends('layouts.admin.app')
@section('title','Users')
@section('content')
    <div class="container-fluid bg-white mt-5">
        <!-- .row -->
        <div class="row">
            <div class="col-sm-12">
                <div class="white-box card">
                <div class="card-body">
                    <h3 class="box-title pull-left">User # {{$user_detail->id}}</h3>
                            <a href="{{url('panel/admin/users')}}" class="btn waves-effect waves-light btn-rounded btn-primary float-right"> Back</a>

                    <div class="clearfix"></div>
                    <hr>
                    <div class="table-responsive">
                        <table class="table table">
                            <tbody>
                            <!-- <tr>
                                <th>ID</th>
                                <td>{{ $user_detail->id }}</td>
                            </tr> -->
                            <tr><th> First Name </th>
                            <td> {{ $user_detail->first_name }} </td>
                            </tr>
                            <tr><th> Last Name </th>
                            <td> {{ $user_detail->last_name }} </td>
                            </tr>
                            <tr><th> Email </th>
                            <td> {{ $user_detail->email }} </td>
                            </tr>
                            <tr><th> Contact </th>
                            <td> {{ $user_detail->contact }} </td>
                            </tr>
                            @if($user_detail->address_1 != null)
                            <tr><th> Address One </th>
                            <td> {{ $user_detail->address_1 }} </td>
                            </tr>
                            @endif
                            @if($user_detail->address_2 != null)
                            <tr><th> Address Two </th>
                            <td> {{ $user_detail->address_2 }} </td>
                            </tr>
                            @endif
                            @if($user_detail->city != null)
                            <tr><th> City </th>
                            <td> {{ $user_detail->city }} </td>
                            </tr>
                            @endif
                            @if($user_detail->state != null)
                            <tr><th> State </th>
                            <td> {{ $user_detail->state }} </td>
                            </tr>
                            @endif
                            @if($user_detail->zip_code != null)
                            <tr><th> Zip code </th>
                            <td> {{ $user_detail->zip_code }} </td>
                            </tr>
                            @endif
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @include('layouts.admin.includes.templates.footer')
</div>
@endsection

