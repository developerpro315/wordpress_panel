@extends('layouts.admin.app')
@section('title','Inquiries')
@section('content')
<div class="container-fluid bg-white mt-5">
    <div class="row">
        <div class="col-sm-12">
            <div class="white-box card">
                <div class="card-body">
                    <h3 class="box-title pull-left">Contact Inquiry Details </h3>

                    <a href="{{url('panel/admin/inquiry/')}}" class="btn waves-effect waves-light btn-rounded btn-primary float-right">Back</a>

                        <!-- <a class="btn btn-success pull-right" href="{{ url('/admin/request/inquiries') }}">
                            <i class="icon-arrow-left-circle" aria-hidden="true"></i> Back</a> -->

                    <div class="clearfix"></div>
                    <hr>
                    <div class="table-responsive">
                        <table class="table table">
                            <tbody>
                            <tr>
                                <th> Name </th>
                                <td> {{ $contact_inquiry->name }} </td>
							</tr>
                            <tr>
                                <th>Phone Number </th>
                                <td> {{ $contact_inquiry->phone }} </td>
							</tr>
                            <tr>
                                <th> Email </th>
                                <td> {{ $contact_inquiry->email }} </td>
                            </tr>
                            <tr>
                                <th> Message </th>
                                <td> {!! $contact_inquiry->message !!} </td>
                            </tr>
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

