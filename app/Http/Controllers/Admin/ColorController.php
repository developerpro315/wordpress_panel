<?php



namespace App\Http\Controllers\admin;



use App\Http\Controllers\Controller;

use App\model\Color;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\File;

use Validator;

use Session;



class ColorController extends Controller

{

    private $messages = [

        'name.required' => 'Provide a :attribute',
        'name.max' => ':attribute can not exceed :max characters',

    ];

    private $attributes = [

        'name' => 'Color Name',
    ];

    public function index() {

        $colors = Color::all();

        return view('admin.color.index', compact('colors'));

    }



    public function show($id) {

        $color = Color::findOrFail($id);

        return view('admin.color.view', compact('color'));

    }



    public function create() {

        return view('admin.color.add');

    }



    public function store(Request $request) {

        $validator = Validator::make($request->all(), [

            'name' => 'required|string|max:255',
        ], $this->messages, $this->attributes);



        if($validator->fails())

            return redirect()->back()->withErrors($validator)->withInput();

        $color = new Color;
        $color->color_name=$request->name;


        $color->save();

        return redirect('panel/admin/color')->with('message', 'New Color is inserted!');

    }



    public function edit($id) {

        $color = Color::findOrFail($id);

        return view('admin.color.edit', compact('color'));

    }



    public function update(Request $request , $id) {
        $validator = Validator::make($request->all(), [
            'name' => 'string|max:255',
        ], $this->messages, $this->attributes);
        if($validator->fails())
            return redirect()->back()->withErrors($validator)->withInput();

        $color = Color::where('id', $id)->first();
        $name = ($request->name != null) ? $request->name : $color->color_name;
        Color::where('id', $id)

        ->update([

            'color_name'=> $name,
        ]);

        return redirect('panel/admin/color')->with('message', 'Color Record is Updated!');

    }



    public function destroy($id) {

        Color::destroy($id);

        Session::flash('flash_message', 'Color Has Been Deleted!');

        return redirect('panel/admin/color');

    }

}

