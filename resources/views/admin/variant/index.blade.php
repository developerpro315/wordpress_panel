@extends('layouts.admin.app')
@section('title', 'Variant')
@section('content')
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12 col-md-12">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex m-b-10 no-block">
                        <h5 class="card-title m-b-0 align-self-center">Variant Management</h5>
                        <div class="ml-auto text-light-blue">
                            <ul class="nav nav-tabs customtab default-customtab list-inline text-uppercase lp-5 font-medium font-12" role="tablist">
                                <li>
                                    <a href="{{url('panel/admin/variant/create/')}}" class="btn waves-effect waves-light btn-rounded btn-primary">Add Variant</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    @if($variants)
                        <div class="table-responsive m-t-10">
                            <table id="myTable" class="table color-table table-bordered variant-table table-hover">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Product Name</th>
                                    <th>Product Category</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($variants as $key=>$variant)
                                    <tr>
                                        <td>{{ $key+1 }}</td>
                                        @php
                                        $product = \App\model\Product::findOrFail($variant->product_id);
                                        @endphp
                                        <td>{{ $product->title}}</td>
                                        <td>{{ (($product->category == 1)?'Clothes':'Beds')}}</td>
                                        <td>${{ $variant->price}}</td>
                                        <td>{{ $variant->quantity}}</td>
                                            @if($variant->status == 1)
                                            <td><span class="bg-success text-white p-2" style="padding: 4px 4px">Active</span></td>
                                            @else
                                            <td><span class="bg-danger text-white p-2" style="padding: 4px 4px">Hidden</span></td>
                                            @endif
                                        <td class="text-center">
                                            <a href="{{ url('panel/admin/variant',$variant->id) }}"><i class="fas fa-eye"></i></a>
                                            <a href="{{ url('panel/admin/variant/'.$variant->id.'/edit') }}"><i class="fas fa-edit"></i></a>
                                            <form style="display: inline-block;" method="POST" action="{{ url('panel/admin/variant',$variant->id) }}">
                                                @csrf
                                                @method('DELETE')
                                                <button onclick='return confirm("Confirm delete?")' style="border: none;outline: none;padding:0;background: #fff;" type="submit"><i class="fas fa-trash-alt text-danger"></i></button>
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
    </div>
    @include('layouts.admin.includes.templates.footer')
</div>
@endsection

@push('js')
<script src="{{asset('plugins/vendors/datatables/jquery.dataTables.min.js')}}"></script>
<script>
       $('#myTable').DataTable({
            "order": [[ 0, "asc" ]]
        });
</script>
@endpush
