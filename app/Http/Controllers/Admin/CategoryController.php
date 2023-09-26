<?php



namespace App\Http\Controllers\admin;



use App\Http\Controllers\Controller;

use App\model\Category;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\File;

use Validator;

use Session;



class CategoryController extends Controller

{

    private $messages = [

        'name.required' => 'Provide a :attribute',
        'name.max' => ':attribute can not exceed :max characters',
        'image.required' => 'Provide :attribute',
        'image.mimes' => 'Provide:attribute of jpeg,jpg or png Type',
        'image.max' => 'Size of :attribute shold be less than 2 MBs',

    ];

    private $attributes = [

        'name' => 'Category Name',
        'image' => 'Image',

    ];

    public function index() {

        $categories = Category::all();

        return view('admin.category.index', compact('categories'));

    }



    public function create() {

        return view('admin.category.add');

    }



    public function store(Request $request) {
        $validator = Validator::make($request->all(), [

            'name' => 'required|string|max:255',
            'slug' => 'required',
            'image' => 'required|image|mimes:jpeg,jpg,png|max:2000000',

        ], $this->messages, $this->attributes);



        if($validator->fails())

            return redirect()->back()->withErrors($validator)->withInput();



        $category = new Category;
        $category->name = $request->name;
        $category->slug = str_slug($request->name);
        if($request->hasfile('image'))
        {
            $file = $request->file('image');
            $extention = $file->getClientOriginalExtension();
            $filename = time() . '.' . $extention;
            $file->move(public_path('uploads/admin/category/'),$filename);
            $category->image = 'uploads/admin/category/'.$filename;
        }

        $category->save();

        return redirect('panel/admin/category')->with('message', 'New Category is inserted!');

    }



    public function edit($id) {

        $category_details = Category::findOrFail($id);

        return view('admin.category.edit', compact('category_details'));

    }



    public function show($id) {

        $category_detail = Category::findOrFail($id);

        return view('admin.category.view', compact('category_detail'));

    }



    public function update(Request $request , $id) {
        $imagetable = Category::where('id', $id)->first();
        $name = ($request->name != null) ? $request->name : $imagetable->name;
        $status = ($request->status != null) ? $request->status : $imagetable->status;


        if($request->hasfile('image'))

        {

            $destination2 = 'uploads/admin/category/'.$imagetable->image;

            if (File::exists($destination2)) {

                File::delete($destination2);

            }

            $file2 = $request->file('image');

            $extention2 = $file2->getClientOriginalExtension();

            $filename2 = time().'1.'.$extention2;

            $file2->move(public_path('uploads/admin/category/'),$filename2);

            Category::where('id', $id)

            ->update([

                'image' => 'uploads/admin/category/'.$filename2,
                'name'=> $name,
                'status' => $status

            ]);

        }

        else{

            Category::where('id', $id)
            ->update([
                'name'=> $name,
                'status' => $status
            ]);

        }

        return redirect('panel/admin/category')->with('message', 'Category detail has been Updated!');

    }



    public function destroy($id) {

        Category::destroy($id);

        Session::flash('flash_message', 'Category Has Been Deleted!');

        return redirect('panel/admin/category');

    }

}

