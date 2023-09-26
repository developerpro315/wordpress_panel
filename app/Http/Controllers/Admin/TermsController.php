<?php



namespace App\Http\Controllers\admin;



use App\Http\Controllers\Controller;

use App\model\CMS;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\File;

use Validator;

use Session;



class TermsController extends Controller

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

        // $companies = Company::all();
        $terms = CMS::where('page_name','Terms & Condition')->get();
        return view('admin.terms.index', compact('terms'));

    }



    public function create() {

        return view('admin.company.add');

    }



    // public function store(Request $request) {
    //     $validator = Validator::make($request->all(), [

    //         'name' => 'required|string|max:255',
    //         'slug' => 'required',
    //         'image' => 'required|image|mimes:jpeg,jpg,png|max:2000000',

    //     ], $this->messages, $this->attributes);



    //     if($validator->fails())

    //         return redirect()->back()->withErrors($validator)->withInput();



    //     $company = new Company;
    //     $company->name = $request->name;
    //     $company->slug = str_slug($request->name);
    //     if($request->hasfile('image'))
    //     {
    //         $file = $request->file('image');
    //         $extention = $file->getClientOriginalExtension();
    //         $filename = time() . '.' . $extention;
    //         $file->move(public_path('uploads/admin/company/'),$filename);
    //         $company->image = 'uploads/admin/company/'.$filename;
    //     }

    //     $company->save();

    //     return redirect('panel/admin/company')->with('message', 'New Company is inserted!');

    // }



    public function edit($id) {

        $terms = CMS::findOrFail($id);

        return view('admin.terms.edit', compact('terms'));

    }



    public function show($id) {

        $company_detail = Company::findOrFail($id);

        return view('admin.company.view', compact('company_detail'));

    }



    public function update(Request $request,$id) {
        $imagetable = CMS::where('id', $id)->first();
        $title = ($request->title != null) ? $request->title : $imagetable->title;
        $description = ($request->description != null) ? $request->description : $imagetable->description;
            CMS::where('id', $id)
            ->update([
                'title'=> $title,
                'description' => $description
            ]);


        return redirect('panel/admin/terms')->with('message', 'Terms & Condition has been Updated!');

    }



    // public function destroy($id) {

    //     Company::destroy($id);

    //     Session::flash('flash_message', 'Company Has Been Deleted!');

    //     return redirect('panel/admin/company');

    // }

}

