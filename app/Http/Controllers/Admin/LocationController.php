<?php



namespace App\Http\Controllers\admin;



use App\Http\Controllers\Controller;

use App\model\Location;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\File;

use Validator;

use Session;



class LocationController extends Controller

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

        $locations = Location::all();

        return view('admin.location.index', compact('locations'));

    }



    public function create() {

        return view('admin.location.add');

    }



    public function store(Request $request) {
        $validator = Validator::make($request->all(), [

            'title' => 'required|string|max:255',
            'description' => 'required',
            'country' => 'required',
            'city' => 'required',
            'description' => 'required',
            'long' =>'required',
            'lat' =>'required'

        ], $this->messages, $this->attributes);



        if($validator->fails())

            return redirect()->back()->withErrors($validator)->withInput();


        $location = new Location;
        $location->title = $request->title;
        $location->description = $request->description;
        $location->long = $request->long;
        $location->lat = $request->lat;
        $location->country = $request->country;
        $location->city = $request->city;
        $location->save();

        return redirect('panel/admin/location')->with('message', 'New Location is inserted!');

    }



    public function edit($id) {

        $location_details = Location::findOrFail($id);

        return view('admin.location.edit', compact('location_details'));

    }



    public function show($id) {

        $company_detail = Location::findOrFail($id);

        return view('admin.location.view', compact('company_detail'));

    }



    public function update(Request $request , $id) {
        $imagetable = Location::where('id', $id)->first();
        $title = ($request->title != null) ? $request->title : $imagetable->title;
        $description = ($request->description != null) ? $request->description : $imagetable->description;
        $lat = ($request->lat != null) ? $request->lat : $imagetable->lat;
        $long = ($request->long != null) ? $request->long : $imagetable->long;
        $city = ($request->city != null) ? $request->city : $imagetable->city;
        $country = ($request->country != null) ? $request->country : $imagetable->country;
        $status = ($request->status != null) ? $request->status : $imagetable->status;
            Location::where('id', $id)
            ->update([
                'title'=> $title,
                'description'=> $description,
                'lat'=> $lat,
                'long'=> $long,
                'city'=> $city,
                'country'=> $country,
                'status' => $status
            ]);
        return redirect('panel/admin/location')->with('message', 'Location detail has been Updated!');

    }



    public function destroy($id) {

        Location::destroy($id);

        Session::flash('flash_message', 'Location Has Been Deleted!');

        return redirect('panel/admin/location');

    }

}

