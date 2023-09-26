<?php



namespace App\Http\Controllers\admin;



use App\Http\Controllers\Controller;

use App\model\Company;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\File;

use Validator;

use Session;



class CompanyController extends Controller

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

        $companies = Company::all();

        return view('admin.company.index', compact('companies'));

    }



    public function create() {

        return view('admin.company.add');

    }



    public function store(Request $request) {
        $validator = Validator::make($request->all(), [

            'name' => 'required|string|max:255',
            'slug' => 'required',
            'image' => 'required|image|mimes:jpeg,jpg,png|max:2000000',

        ], $this->messages, $this->attributes);



        if($validator->fails())

            return redirect()->back()->withErrors($validator)->withInput();



        $company = new Company;
        $company->name = $request->name;
        $company->slug = str_slug($request->name);
        if($request->hasfile('image'))
        {
            $file = $request->file('image');
            $extention = $file->getClientOriginalExtension();
            $filename = time() . '.' . $extention;
            $file->move(public_path('uploads/admin/company/'),$filename);
            $company->image = 'uploads/admin/company/'.$filename;
        }

        $company->save();

        return redirect('panel/admin/company')->with('message', 'New Company is inserted!');

    }



    public function edit($id) {

        $company_details = Company::findOrFail($id);

        return view('admin.company.edit', compact('company_details'));

    }



    public function show($id) {

        $company_detail = Company::findOrFail($id);

        return view('admin.company.view', compact('company_detail'));

    }



    public function update(Request $request , $id) {
        $imagetable = Company::where('id', $id)->first();
        $name = ($request->name != null) ? $request->name : $imagetable->name;
        $status = ($request->status != null) ? $request->status : $imagetable->status;


        if($request->hasfile('image'))

        {

            $destination2 = 'uploads/admin/company/'.$imagetable->image;

            if (File::exists($destination2)) {

                File::delete($destination2);

            }

            $file2 = $request->file('image');

            $extention2 = $file2->getClientOriginalExtension();

            $filename2 = time().'1.'.$extention2;

            $file2->move(public_path('uploads/admin/company/'),$filename2);

            Company::where('id', $id)

            ->update([

                'image' => 'uploads/admin/company/'.$filename2,
                'name'=> $name,
                'status' => $status

            ]);

        }

        else{

            Company::where('id', $id)
            ->update([
                'name'=> $name,
                'status' => $status
            ]);

        }

        return redirect('panel/admin/company')->with('message', 'Company detail has been Updated!');

    }



    public function destroy($id) {

        Company::destroy($id);

        Session::flash('flash_message', 'Company Has Been Deleted!');

        return redirect('panel/admin/company');

    }

}

