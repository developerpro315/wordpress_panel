<?php



namespace App\Http\Controllers\admin;
use App\Http\Controllers\Controller;
use App\model\Styles;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Validator;
use Session;



class StylesController extends Controller

{

    private $messages = [

        'name.required' => 'Provide a :attribute',
        'name.max' => ':attribute can not exceed :max characters',

    ];

    private $attributes = [

        'name' => 'Style Name',
    ];

    public function index() {

        $styles = Styles::all();

        return view('admin.style.index', compact('styles'));

    }



    public function show($id) {

        $style = Styles::findOrFail($id);
        return view('admin.style.view', compact('style'));

    }



    public function create() {

        return view('admin.style.add');

    }



    public function store(Request $request) {

        $validator = Validator::make($request->all(), [

            'name' => 'required|string|max:255',
        ], $this->messages, $this->attributes);



        if($validator->fails())

            return redirect()->back()->withErrors($validator)->withInput();

        $style = new Styles;
        $style->name=$request->name;
        $style->save();

        return redirect('panel/admin/style')->with('message', 'New Style is inserted!');

    }



    public function edit($id) {

        $style = Styles::findOrFail($id);

        return view('admin.style.edit', compact('style'));

    }



    public function update(Request $request , $id) {
        $validator = Validator::make($request->all(), [
            'name' => 'string|max:255',
            // 'image' => 'mimes:jpeg,jpg,png|max:2000000',
        ], $this->messages, $this->attributes);
        if($validator->fails())
            return redirect()->back()->withErrors($validator)->withInput();

        $style = Styles::where('id', $id)->first();
        $name = ($request->name != null) ? $request->name : $style->name;
        $status = ($request->status != null) ? $request->status : $style->status;
        // if ($request->hasfile('image')) {
        //     $destination = 'uploads/admin/style/'.$style->image;
        //     if (File::exists($destination)) {
        //         File::delete($destination);
        //     }
        //     $file = $request->file('image');
        //     $extention = $file->getClientOriginalExtension();
        //     $filename = time().'.'.$extention;
        //     $file->move(public_path('uploads/admin/style/'),$filename);
        //     $styleimage = 'uploads/admin/style/'.$filename;
        //     // $style->save();
        // }
        // $image = ($request->image != null) ?$styleimage : $style->image ;
        // $slug = ($request->slug != null) ? $request->slug : $puppy->slug;
        Styles::where('id', $id)

        ->update([

            'name'=> $name,
            'status'=> $status,
            // 'slug'=>$slug,
            // 'image' => $image,

        ]);

        return redirect('panel/admin/style')->with('message', 'Style Record is Updated!');

    }



    public function destroy($id) {

        Styles::destroy($id);

        Session::flash('flash_message', 'Style Has Been Deleted!');

        return redirect('panel/admin/style');

    }

}

