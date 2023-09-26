@extends('layouts.admin.app')
@section('title', 'Variant')
@section('content')
    <div class="container-fluid bg-white mt-5">
        <!-- .row -->
        <div class="row">
            <div class="col-sm-12">
                <div class="white-box card">
                <div class="card-body">
                    <h3 class="box-title pull-left">Variant # {{$variant->id}}</h3>

                    <a href="{{url('panel/admin/variant/')}}" class="btn waves-effect waves-light btn-rounded btn-primary float-right">Back</a>

                    <div class="clearfix"></div>
                    <hr>
                    <div class="table-responsive">
                        <table class="table table">
                            <tbody>
                            <tr>
                                <th>Product Name:</th>
                                <td>{{ $product->title }}</td>
                            </tr>
                            <tr>
                                <th>Product Category:</th>
                                <td>{{(($product->category == 1)?'Clothes':'Beds')}}</td>
                            </tr>   
                            <tr>
                                <th>Size :</th>
                                <td>{{$size->name}}</td>
                            </tr>   
                            <tr>
                                <th>Color:</th>
                                <td>{{$color->color_name}}</td>
                            </tr>
                            <tr>
                                <th>Price:</th>
                                <td>${{$variant->price}}</td>
                            </tr>
                            <tr>
                                <th>Quantity:</th>
                                <td>{{$variant->quantity}}</td>
                            </tr>
                            <tr><th>Status:</th>
                                <td>
                                    <span style="padding: 10px;"
                                        class={{ $variant->status == 1 ? 'bg-success' : ' bg-danger' }}>{{ $variant->status == 1 ? 'Active' : 'Hidden' }}</span>
                                </td>
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

