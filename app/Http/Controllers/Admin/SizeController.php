<?php



namespace App\Http\Controllers\admin;



use App\Http\Controllers\Controller;

use App\model\Size;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\File;

use Validator;

use Session;



class SizeController extends Controller

{

    private $messages = [

        'name.required' => 'Provide a :attribute',
        'name.max' => ':attribute can not exceed :max characters',

    ];

    private $attributes = [

        'name' => 'Size Name',
    ];

    public function index() {

        $sizes = Size::all();

        return view('admin.size.index', compact('sizes'));

    }



    public function show($id) {

        $size = Size::findOrFail($id);

        return view('admin.size.view', compact('size'));

    }



    public function create() {

        return view('admin.size.add');

    }



    public function store(Request $request) {

        $validator = Validator::make($request->all(), [

            'name' => 'required|string|max:255',
        ], $this->messages, $this->attributes);



        if($validator->fails())

            return redirect()->back()->withErrors($validator)->withInput();

        $size = new Size;
        $size->name=$request->name;


        $size->save();

        return redirect('panel/admin/size')->with('message', 'New Size is inserted!');

    }



    public function edit($id) {

        $size = Size::findOrFail($id);

        return view('admin.size.edit', compact('size'));

    }



    public function update(Request $request , $id) {
        $validator = Validator::make($request->all(), [
            'name' => 'string|max:255',
        ], $this->messages, $this->attributes);
        if($validator->fails())
            return redirect()->back()->withErrors($validator)->withInput();

        $size = Size::where('id', $id)->first();
        $name = ($request->name != null) ? $request->name : $size->name;
        Size::where('id', $id)

        ->update([

            'name'=> $name,
        ]);

        return redirect('panel/admin/size')->with('message', 'Size Record is Updated!');

    }



    public function destroy($id) {

        Size::destroy($id);

        Session::flash('flash_message', 'Size Has Been Deleted!');

        return redirect('panel/admin/size');

    }

}

