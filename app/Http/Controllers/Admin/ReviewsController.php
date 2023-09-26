<?php



namespace App\Http\Controllers\admin;
use App\Http\Controllers\Controller;
use App\model\Review;
use App\model\Occassionselect;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Validator;
use Session;



class ReviewsController extends Controller

{

    private $messages = [
        'name.required' => 'Provide a :attribute',
        'name.max' => ':attribute can not exceed :max characters',
    ];

    private $attributes = [
        'name' => 'Occassion Name',
    ];

    public function index() {
        $reviews = Review::all();
        return view('admin.review.index', compact('reviews'));
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
        $occassions = Review::orderBy('created_at','DESC')->first();
        $occassionselect = new Occassionselect;
        $occassionselect->occassion_id = $occassions->id;
        $occassionselect->save();


        return redirect('panel/admin/occassion')->with('message', 'New Occassion is inserted!');

    }



    public function edit($id) {

        $occassion_details = Review::findOrFail($id);

        return view('admin.occassion.edit', compact('occassion_details'));

    }



    public function show($id) {

        $review_detail = Review::findOrFail($id);

        return view('admin.review.view', compact('review_detail'));

    }



    public function update(Request $request , $id) {
        $imagetable = Review::where('id', $id)->first();
        $name = ($request->name != null) ? $request->name : $imagetable->name;
        $status = ($request->status != null) ? $request->status : $imagetable->status;
            Review::where('id', $id)
            ->update([
                'name'=> $name,
                'status' => $status
            ]);

        return redirect('panel/admin/occassion')->with('message', 'Occassion detail has been Updated!');

    }



    public function destroy($id) {

        Review::destroy($id);

        Session::flash('flash_message', 'Review Has Been Deleted!');

        return redirect('panel/admin/reviews');

    }

}

