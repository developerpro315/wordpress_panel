@extends('layouts.admin.app')
@section('title', 'Website Logo Management')
@push('before-css')
  <link rel="stylesheet" href="{{asset('plugins/vendors/dropify/dist/css/dropify.min.css')}}">
  <link href="{{asset('assets/css/pages/file-upload.css')}}" rel="stylesheet">
@endpush
@section('content')
<div class="container-fluid logo">
    <div class="row">
          <div class="col-lg-6 col-md-6">
              <form class="form-horizontal" method="post" action="{{url('panel/admin/logo')}}" enctype= "multipart/form-data">
                  @csrf
                  <div class="card">
                      <div class="card-body ">
                          <h3></h3><br>
                          <h5>Logo For Header</h5>
                          <div class="clearfix"></div>
                          <hr>
                          @if ($errors->any())
                              <ul class="alert alert-danger">
                                  @foreach ($errors->all() as $error)
                                      <li>{{ $error }}</li>
                                  @endforeach
                              </ul>
                          @endif
                          <div class="col-md-6">
                              <div>
                              <img alt="Website Logo" style="max-width: 340px;"  id="input-preview" src="{{ asset(getImage()) }}">
                              </div>
                              <div class="upload-photo">
                                  <input type="file" name="image" id="input-file-now" class="dropify" />
                              </div>
                          </div>
                          <div class="row m-b-15">
                              <div class="col-lg-4 col-md-4 text-right">
                                  <button type="submit" class="btn btn-lg btn-success text-right">Update</button>
                              </div>
                          </div>
                      </div>
                  </div>
              </form>
          </div>
          <!-- <div class="col-lg-6 col-md-6">
            <form class="form-horizontal" method="post" action="{{url('panel/admin/logo')}}" enctype= "multipart/form-data">
                @csrf
                <div class="card">
                    <div class="card-body">
                        <h3></h3><br>
                        <h5>Logo For Footer</h5>
                        <div class="clearfix"></div>
                        <hr>
                        @if ($errors->any())
                            <ul class="alert alert-danger">
                                @foreach ($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                @endforeach
                            </ul>
                        @endif
                        <div class="col-md-6">
                            <div>
                            <img alt="Website Logo" style="max-width: 340px;" id="input-preview" src="{{ asset(getImage2()) }}">
                            </div>
                            <div class="upload-photo">
                                <input type="file" name="image2" id="input-file-now" class="dropify" />
                            </div>
                        </div>
                        <div class="row m-b-15">
                            <div class="col-lg-4 col-md-4 text-right">
                                <button type="submit" class="btn btn-lg btn-success text-right">Update</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div> -->
    </div>
</div>
@endsection

@push('js')
  <script src="{{asset('plugins/vendors/dropify/dist/js/dropify.min.js')}}"></script>
  <script>
      $(function() {
          $('.dropify').dropify();
          var drEvent = $('#input-file-events').dropify();
          drEvent.on('dropify.beforeClear', function(event, element) {
              return confirm("Do you really want to delete \"" + element.file.name + "\" ?");
          });
          drEvent.on('dropify.afterClear', function(event, element) {
              alert('File deleted');
          });
          var drDestroy = $('#input-file-to-destroy').dropify();
          drDestroy = drDestroy.data('dropify')
          $('#toggleDropify').on('click', function(e) {
              e.preventDefault();
              if (drDestroy.isDropified()) {
                  drDestroy.destroy();
              } else {
                  drDestroy.init();
              }
          })
      });
  </script>
@endpush
