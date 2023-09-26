<?php



namespace App\Http\Controllers\admin;
use App\Http\Controllers\Controller;
use App\model\Breed;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Validator;
use Session;



class BreedController extends Controller

{

    private $messages = [

        'name.required' => 'Provide a :attribute',
        'image.required' => 'Provide a Image',
        'name.max' => ':attribute can not exceed :max characters',

    ];

    private $attributes = [

        'name' => 'Breed Name',
    ];

    public function index() {

        $breeds = Breed::all();

        return view('admin.breed.index', compact('breeds'));

    }



    public function show($id) {

        $breed = Breed::findOrFail($id);
        return view('admin.breed.view', compact('breed'));

    }



    public function create() {

        return view('admin.breed.add');

    }



    public function store(Request $request) {

        $validator = Validator::make($request->all(), [

            'name' => 'required|string|max:255',
            'image' => 'required|mimes:jpeg,jpg,png|max:2000000',
            'slug' => ['required', 'string', 'max:255', 'unique:breed,slug'],
        ], $this->messages, $this->attributes);



        if($validator->fails())

            return redirect()->back()->withErrors($validator)->withInput();

        $breed = new Breed;
        $breed->name=$request->name;
        $breed->slug = $request->slug;
        if ($request->hasfile('image')) {
            $file1 = $request->file('image');
            $extention1 = $file1->getClientOriginalExtension();
            $filename1 = time() . '.' . $extention1;
            $file1->move(public_path('uploads/admin/breed/'), $filename1);
            $breed->image = 'uploads/admin/breed/' . $filename1;
            }

        $breed->save();

        return redirect('panel/admin/breed')->with('message', 'New Breed is inserted!');

    }



    public function edit($id) {

        $breed = Breed::findOrFail($id);

        return view('admin.breed.edit', compact('breed'));

    }



    public function update(Request $request , $id) {
        $validator = Validator::make($request->all(), [
            'name' => 'string|max:255',
            'image' => 'mimes:jpeg,jpg,png|max:2000000',
            // 'slug' => ['string', 'max:255', 'unique:breed,slug'],
        ], $this->messages, $this->attributes);
        if($validator->fails())
            return redirect()->back()->withErrors($validator)->withInput();

        $breed = Breed::where('id', $id)->first();
        $name = ($request->name != null) ? $request->name : $breed->name;
        $status = ($request->status != null) ? $request->status : $breed->status;
        if ($request->hasfile('image')) {
            $destination = 'uploads/admin/breed/'.$breed->image;
            if (File::exists($destination)) {
                File::delete($destination);
            }
            $file = $request->file('image');
            $extention = $file->getClientOriginalExtension();
            $filename = time().'.'.$extention;
            $file->move(public_path('uploads/admin/breed/'),$filename);
            $breedimage = 'uploads/admin/breed/'.$filename;
            // $breed->save();
        }
        $image = ($request->image != null) ?$breedimage : $breed->image ;
        // $slug = ($request->slug != null) ? $request->slug : $puppy->slug;
        Breed::where('id', $id)

        ->update([

            'name'=> $name,
            'status'=> $status,
            // 'slug'=>$slug,
            'image' => $image,

        ]);

        return redirect('panel/admin/breed')->with('message', 'Breed Record is Updated!');

    }



    public function destroy($id) {

        Breed::destroy($id);

        Session::flash('flash_message', 'Breed Has Been Deleted!');

        return redirect('panel/admin/breed');

    }

}

