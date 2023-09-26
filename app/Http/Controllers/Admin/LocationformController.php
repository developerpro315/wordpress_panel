<?php
namespace App\Http\Controllers\admin;
use App\Http\Controllers\Controller;
use App\model\Location;
use App\model\Location_form;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Validator;
use Session;
class LocationformController extends Controller

{

    private $messages = [

        'name.required' => 'Provide a :attribute',
        'name.max' => ':attribute can not exceed :max characters',
        'image.required' => 'Provide :attribute',
        'image.mimes' => 'Provide:attribute of jpeg,jpg or png Type',
        'image.max' => 'Size of :attribute shold be less than 2 MBs',

    ];

    private $attributes = [

        'name' => 'Blog Name',
        'image' => 'Image',

    ];

    public function index() {
        $locations = Location_form::all();
        return view('admin.locationform.index', compact('locations'));

    }



    public function create() {
        return view('admin.locationform.add');
    }



    public function store(Request $request) {
        $validator = Validator::make($request->all(), [

            'title' => 'required|string|max:255',
            'description' => 'required',
            'long' =>'required',
            'lat' =>'required'

        ], $this->messages, $this->attributes);



        if($validator->fails())

            return redirect()->back()->withErrors($validator)->withInput();



        $company = new Location;
        $company->title = $request->title;
        $company->description = $request->description;
        $company->long = $request->long;
        $company->lat = $request->lat;
        $company->save();
        return redirect('panel/admin/location')->with('message', 'New Location is inserted!');
    }



    public function edit($id) {
        $location_details = Location_form::findOrFail($id);
        return view('admin.locationform.edit', compact('location_details'));

    }



    public function show($id) {

        $location_detail = Location_form::findOrFail($id);
        return view('admin.locationform.view', compact('location_detail'));

    }



    public function update(Request $request , $id) {
        $imagetable = Location_form::where('id', $id)->first();
        $status = ($request->status != null) ? $request->status : $imagetable->status;
            Location_Form::where('id', $id)
            ->update([
                'status' => $status
            ]);
        return redirect('panel/admin/location-form')->with('message', 'Location Form Status has been Updated!');

    }



    public function destroy($id) {
        Location_form::destroy($id);
        Session::flash('flash_message', 'Location Has Been Deleted!');
        return redirect('panel/admin/location-form');
    }

}

