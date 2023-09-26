<?php



namespace App\Http\Controllers\admin;



use App\Http\Controllers\Controller;

use App\model\Occassionselect;
use App\model\Product;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\File;

use Validator;

use Session;



class OccassionselectController extends Controller

{

    private $messages = [
        'name.required' => 'Provide a :attribute',
        'name.max' => ':attribute can not exceed :max characters',
        // 'selectedproduct.required' => 'Please Select Products',
    ];

    private $attributes = [
        'name' => 'Occassion Name',
    ];

    public function index() {
        $occassionselects = Occassionselect::all();
        return view('admin.occassionselect.index', compact('occassionselects'));
    }



    public function create() {
        return view('admin.occassionselect.add');
    }



    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'slug' => 'required',
        ], $this->messages, $this->attributes);
        if($validator->fails())
            return redirect()->back()->withErrors($validator)->withInput();
        $occassionselect = new Occassionselect;
        $occassionselect->name = $request->name;
        $occassionselect->slug = str_slug($request->name);
        $occassionselect->save();

        return redirect('panel/admin/occassionselect')->with('message', 'New Occassion Asign is inserted!');

    }



    public function edit($id) {

        $occassionselect_details = Occassionselect::findOrFail($id);
        $products = Product::where('status',1)->get();
        return view('admin.occassionselect.edit', compact('occassionselect_details','products'));

    }



    public function show($id) {

        $occassionselect_detail = Occassionselect::findOrFail($id);

        return view('admin.occassionselect.view', compact('occassionselect_detail'));

    }



    public function update(Request $request , $id) {
        // $validator = Validator::make($request->all(), [
        //     'selectedproduct' => 'required',
        // ], $this->messages, $this->attributes);
        // if($validator->fails())
        //     return redirect()->back()->withErrors($validator)->withInput();
        $imagetable = Occassionselect::where('id', $id)->first();
        if($request->selectedproduct != null){
            $product = implode(",",$request->selectedproduct);
            $status = ($request->status != null) ? $request->status : $imagetable->status;
                Occassionselect::where('id', $id)
                ->update([
                    'products'=> $product,
                    'status' => $status
                ]);
        }
        else{
            $status = ($request->status != null) ? $request->status : $imagetable->status;
                Occassionselect::where('id', $id)
                ->update([
                    'status' => $status
                ]);
        }

        return redirect('panel/admin/occassionselect')->with('message', 'Occassion Assign has been Updated!');

    }



    public function destroy($id) {

        Occassionselect::destroy($id);

        Session::flash('flash_message', 'Occassion Assign Has Been Deleted!');

        return redirect('panel/admin/occassionselect');

    }

}

