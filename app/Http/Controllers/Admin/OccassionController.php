<?php



namespace App\Http\Controllers\admin;
use App\Http\Controllers\Controller;
use App\model\Occassion;
use App\model\Occassionselect;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Validator;
use Session;



class OccassionController extends Controller

{

    private $messages = [
        'name.required' => 'Provide a :attribute',
        'name.max' => ':attribute can not exceed :max characters',
    ];

    private $attributes = [
        'name' => 'Occassion Name',
    ];

    public function index() {
        $occassions = Occassion::all();
        return view('admin.occassion.index', compact('occassions'));
    }



    public function create() {
        return view('admin.occassion.add');
    }



    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'slug' => 'required',
        ], $this->messages, $this->attributes);
        if($validator->fails())
            return redirect()->back()->withErrors($validator)->withInput();
        $occassion = new Occassion;
        $occassion->name = $request->name;
        $occassion->slug = str_slug($request->name);
        $occassion->save();
        $occassions = Occassion::orderBy('created_at','DESC')->first();
        $occassionselect = new Occassionselect;
        $occassionselect->occassion_id = $occassions->id;
        $occassionselect->save();


        return redirect('panel/admin/occassion')->with('message', 'New Occassion is inserted!');

    }



    public function edit($id) {

        $occassion_details = Occassion::findOrFail($id);

        return view('admin.occassion.edit', compact('occassion_details'));

    }



    public function show($id) {

        $occassion_detail = Occassion::findOrFail($id);

        return view('admin.occassion.view', compact('occassion_detail'));

    }



    public function update(Request $request , $id) {
        $imagetable = Occassion::where('id', $id)->first();
        $name = ($request->name != null) ? $request->name : $imagetable->name;
        $status = ($request->status != null) ? $request->status : $imagetable->status;
            Occassion::where('id', $id)
            ->update([
                'name'=> $name,
                'status' => $status
            ]);

        return redirect('panel/admin/occassion')->with('message', 'Occassion detail has been Updated!');

    }



    public function destroy($id) {

        Occassion::destroy($id);

        Session::flash('flash_message', 'Occassion Has Been Deleted!');

        return redirect('panel/admin/occassion');

    }

}

