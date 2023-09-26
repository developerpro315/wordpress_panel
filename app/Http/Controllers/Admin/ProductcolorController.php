<?php



namespace App\Http\Controllers\admin;



use App\Http\Controllers\Controller;

use App\model\Productcolor;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\File;

use Validator;

use Session;



class ProductcolorController extends Controller

{

    private $messages = [

        'color.required' => 'Provide a :attribute',
        'color.max' => ':attribute can not exceed :max characters',
        'color.max' => 'This is Already Aviliable',

    ];

    private $attributes = [

        'color' => 'Color Name',
    ];

    public function index() {

        $pcolors = Productcolor::all();

        return view('admin.productcolor.index', compact('pcolors'));

    }



    public function show($id) {

        $color = Color::findOrFail($id);

        return view('admin.color.view', compact('color'));

    }



    public function create() {

        return view('admin.productcolor.add');

    }



    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            
            'color' => 'required|string|max:255|unique:product_color',
        ], $this->messages, $this->attributes);



        if($validator->fails())

            return redirect()->back()->withErrors($validator)->withInput();

        $color = new Productcolor;
        $color->color=$request->color;


        $color->save();

        return redirect('panel/admin/productcolor')->with('message', 'New Product Color is inserted!');

    }



    public function edit($id) {

        $pcolor = Productcolor::findOrFail($id);

        return view('admin.productcolor.edit', compact('pcolor'));

    }



    public function update(Request $request , $id) {
        $validator = Validator::make($request->all(), [
            'color' => 'string|max:255|unique:product_color',
        ], $this->messages, $this->attributes);
        if($validator->fails())
            return redirect()->back()->withErrors($validator)->withInput();

        $color = Productcolor::where('id', $id)->first();
        $color = ($request->color != null) ? $request->color : $color->color;
        Color::where('id', $id)

        ->update([

            'color'=> $color,
        ]);

        return redirect('panel/admin/productcolor')->with('message', 'Product Color Record is Updated!');

    }



    public function destroy($id) {

        Productcolor::destroy($id);

        Session::flash('flash_message', 'Product Color Has Been Deleted!');

        return redirect('panel/admin/productcolor');

    }

}

