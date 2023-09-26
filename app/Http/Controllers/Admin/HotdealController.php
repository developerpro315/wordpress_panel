<?php



namespace App\Http\Controllers\admin;
use App\Http\Controllers\Controller;
use App\model\Product;
use App\model\Hotdeal;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Validator;
use Session;



class HotdealController extends Controller

{

    private $messages = [

        'product.required' => 'Provide a Product',
        'start_date.required' => 'Provide a Start Date',
        'end_date.required' => 'Provide a End Date',

    ];
    private $attributes = [

        'product' => 'Product',
        'start_date' => 'Start Date',
        'end_date' => 'End Date',

    ];
    public function index() {
        $hotdeals = Hotdeal::all();
        $products = Product::all();
        return view('admin.hotdeal.index', compact('hotdeals','products'));
    }



    public function create() {
        $products = Product::where('status',1)->get();
        return view('admin.hotdeal.add', compact('products'));

    }



    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'product_id' => 'required',
            'end_date' => 'required',
        ], $this->messages, $this->attributes);
        if($validator->fails())
            return redirect()->back()->withErrors($validator)->withInput();
        $hotdeal = new Hotdeal;
        $hotdeal->products = $request->product_id;
        $hotdeal->date = $request->end_date;
        $hotdeal->save();

        return redirect('panel/admin/hot-deal')->with('message', 'New Hot Deal is inserted!');

    }



    public function edit($id) {

        $hotdeal_details = Hotdeal::findOrFail($id);
        $products = Product::where('status',1)->get();
        $hots = explode(',',$hotdeal_details->products);
        $hotproducts = Product::where('status',1)->whereIn('id',$hots)->get();
        return view('admin.hotdeal.edit', compact('hotdeal_details','products','hotproducts'));

    }



    public function show($id) {
        $hotdeal = Hotdeal::where('id',$id)->first();
        $product = Product::where('id',$hotdeal->product_id)->first();
        return view('admin.hotdeal.view', compact('hotdeal','product'));

    }



    public function update(Request $request , $id) {
        if($request->id == 1){
        $imagetable = Hotdeal::where('id', $id)->first();
        if($request->selectedproduct != null){
            $product = implode(",",$request->selectedproduct);
            Hotdeal::where('id', $id)
                ->update([
                    'products'=> $product,
                ]);
        }
        else{
            Hotdeal::where('id', $id)
                ->update([
                    'products'=> '',
                ]);
        }
        return redirect('panel/admin/hot-deal')->with('message', 'Hot Deal has been Updated!');
    }else{
        $imagetable = Hotdeal::where('id', $id)->first();
        if($request->product_id != null){
            Hotdeal::where('id', $id)
                ->update([
                    'products'=> $request->product_id,
                    'date'=> $request->end_date,
                ]);
        }
        else{
            Hotdeal::where('id', $id)
                ->update([
                    'products'=> '',
                    'date'=> '',
                ]);
        }
        return redirect('panel/admin/hot-deal')->with('message', 'Hot Deal has been Updated!');
    }

    }



    public function destroy($id) {

        Company::destroy($id);

        Session::flash('flash_message', 'Hot Deal Has Been Deleted!');

        return redirect('panel/admin/hot-deal');

    }

}

