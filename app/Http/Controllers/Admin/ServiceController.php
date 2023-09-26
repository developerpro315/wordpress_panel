<?php







namespace App\Http\Controllers\admin;







use App\Http\Controllers\Controller;



use App\model\Service;



use Illuminate\Http\Request;



use Illuminate\Support\Facades\File;



use Validator;

use Illuminate\Support\Str;

use Session;







class ServiceController extends Controller



{



    private $messages = [



        'title.required' => 'Provide a :attribute',
        'title.max' => ':attribute can not exceed :max characters',
        'short_description.required' => 'Provide :attribute',
        'long_description.required' => 'Provide :attribute',
        'image1.required' => 'Provide :attribute',
        'image1.mimes' => 'Provide:attribute of jpeg,jpg or png Type',
        'image1.max' => 'Size of :attribute shold be less than 2 MBs',
        'image2.required' => 'Provide :attribute',
        'image2.mimes' => 'Provide:attribute of jpeg,jpg or png Type',
        'image2.max' => 'Size of :attribute shold be less than 2 MBs',

    ];



    private $attributes = [
        'title' => 'Servive Title',
        'short_description' => 'short Description',
        'long_description' => 'long Description',
        'image1' => 'Image 1',
        'image2' => 'Image 2',
    ];



    public function index()
    {
        $services = Service::all()->where('special',0);
        return view('admin.service.index', compact('services'));
    }







    public function create()
    {
         return view('admin.service.add');
    }







    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [

            'title' => 'required|string|max:255',
            'slug' => 'required',
            'short_description' => 'required',
            'long_description' => 'required',
            'image1' => 'required|image|mimes:jpeg,jpg,png|max:2000000',
            'image2' => 'required|image|mimes:jpeg,jpg,png|max:2000000',

        ], $this->messages, $this->attributes);
        if ($validator->fails())
        return redirect()->back()->withErrors($validator)->withInput();
        $service = new Service;
        $service->title = $request->title;
        $service->slug = $request->slug;
        if ($request->short_description != null)
        $service->short_description = $request->short_description;
        $service->long_description = $request->long_description;
        $service->status = 1;
        if ($request->hasfile('image1')) {
        $file = $request->file('image1');
        $extention = $file->getClientOriginalExtension();
        $filename = time() . '.' . $extention;
        $file->move(public_path('uploads/admin/service/'), $filename);
        $service->image1 = 'uploads/admin/service/' . $filename;
        }

        if ($request->hasfile('image2')) {
            $file = $request->file('image2');
            $extention = $file->getClientOriginalExtension();
            $filename = time() . '.' . $extention;
            $file->move(public_path('uploads/admin/service/'), $filename);
            $service->image2 = 'uploads/admin/service/' . $filename;
        }
        $service->save();
        return redirect('panel/admin/service')->with('message', 'New Service is inserted!');
    }







    public function edit($id)
    {
        $service_detail = Service::findOrFail($id);
        return view('admin.service.edit', compact('service_detail'));
    }







    public function show($id)
    {
        $service_detail = Service::findOrFail($id);
        return view('admin.service.view', compact('service_detail'));
    }







    public function update(Request $request, $id)
    {
        $imagetable = Service::where('id', $id)->first();
        $title = ($request->title != null) ? $request->title : $imagetable->title;
        $short_description = ($request->short_description != null) ? $request->short_description : $imagetable->short_description;
        $long_description = ($request->long_description != null) ? $request->long_description : $imagetable->long_description;
        $status = ($request->status != null) ? $request->status : $imagetable->status;
        $is_active = ($request->is_active != null) ? $request->is_active : $imagetable->is_active;

        if ($request->hasfile('image')) {
            $destination2 = 'uploads/admin/service/' . $imagetable->image_path;
            if (File::exists($destination2)) {
                File::delete($destination2);
            }
            $file2 = $request->file('image');
            $extention2 = $file2->getClientOriginalExtension();
            $filename2 = time() . '1.' . $extention2;
            $file2->move(public_path('uploads/admin/service/'), $filename2);
            Service::where('id', $id)
                ->update([
                    'image1' => 'uploads/admin/service/' . $filename2,
                    'title' => $title,
                    'short_description' => $short_description,
                    'long_description' => $long_description,
                    'status' => $status,
                    'is_active' =>$is_active
                ]);
        }
        if ($request->hasfile('image2')) {
            $destination2 = 'uploads/admin/service/' . $imagetable->image_path2;
            if (File::exists($destination2)) {
                File::delete($destination2);
            }
            $file2 = $request->file('image2');
            $extention2 = $file2->getClientOriginalExtension();
            $filename2 = time() . '1.' . $extention2;
            $file2->move(public_path('uploads/admin/service/'), $filename2);
            Service::where('id', $id)
                ->update([
                    'image2' => 'uploads/admin/service/' . $filename2,
                    'title' => $title,
                    'short_description' => $short_description,
                    'long_description' => $long_description,
                    'status' => $status,
                    'is_active' =>$is_active
                ]);
        } else {
            Service::where('id', $id)
                ->update([
                    'title' => $title,
                    'short_description' => $short_description,
                    'long_description' => $long_description,
                    'status' => $status,
                    'is_active' =>$is_active
                ]);
        }
        return redirect('panel/admin/service')->with('message', 'Service detail has been Updated!');
    }






    public function destroy($id)
    {



        Service::destroy($id);



        Session::flash('flash_message', 'Service Has Been Deleted!');



        return redirect('panel/admin/service');
    }
}
