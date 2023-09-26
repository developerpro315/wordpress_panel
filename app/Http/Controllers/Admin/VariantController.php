<?php



namespace App\Http\Controllers\admin;



use App\Http\Controllers\Controller;

use App\model\Variant;
use App\model\Product;
use App\model\Productcolor;
use App\model\Size;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\File;

use Validator;

use Session;



class VariantController extends Controller

{

    private $messages = [
        'title.required' => 'Provide a :attribute',
        'title.max' => ':attribute can not exceed :max characters',
    ];

    private $attributes = [

        'title' => 'Product Name',
    ];

    public function index() {

        $variants = Variant::all();

        return view('admin.variant.index', compact('variants'));

    }



    public function show($id) {
        $variant = Variant::findOrFail($id);
        $product = Product::where('status',1)->where('id',$variant->product_id)->first();
        $color = Productcolor::where('id',$variant->color)->first();
        $size = Size::where('id',$variant->size)->first();
        return view('admin.variant.view', compact('variant','product','color','size'));

    }



    public function create() {
        $products = Product::where('status',1)->get();
        $colors = Productcolor::all();
        $sizes = Size::all();
        return view('admin.variant.add',compact('sizes','colors','products'));

    }



    public function store(Request $request) {
        
        $validator = Validator::make($request->all(), [
            'product_id' => 'required|unique:variant',
            // 'size' => 'required',
            // 'color' => 'required',
            'price' => 'required',
            'quantity' => 'required',
        ], $this->messages, $this->attributes);
        if($validator->fails())
            return redirect()->back()->withErrors($validator)->withInput();
                
        $variant = new Variant;

        $variant->product_id =$request->product_id;
        // $variant->color =$request->color;
        if($request->color){
            $variant->color =$request->color = implode(',',$request->color);
        }
        // $variant->size =$request->size;
        if($request->size){
            $variant->size =$request->size = implode(',',$request->size);
        }
        $variant->price = $request->price;
        $variant->quantity = $request->quantity;
        $variant->save();

        return redirect('panel/admin/variant')->with('message', 'New Variant is inserted!');
    }



    public function edit($id) {
        $variant = Variant::findOrFail($id);
        $products = Product::where('status',1)->get();
        $colors = Productcolor::all();
        if($variant->size != null){
            $size = explode(',', $variant->size);
            $sizesel = Size::whereIN('name',$size)->get();
            $sizes = Size::whereNotIn('name',$size)->get();
        }
        else{
            $sizesel = null;
            $sizes = Size::all();
        }
        if($variant->color != null){
            $color = explode(',', $variant->color);
            $colorsel = Productcolor::whereIN('color',$color)->get();
            $colors = Productcolor::whereNotIn('color',$color)->get();
        }
        else{
            $colorsel =null;
            $colors = Productcolor::all();
        }
    
        return view('admin.variant.edit', compact('variant','products','colors','colorsel','sizes','sizesel'));

    }



    public function update(Request $request , $id) {
        $validator = Validator::make($request->all(), [
            'product_id' => 'required',
            // 'size' => 'required',
            // 'color' => 'required',
            'price' => 'required',
            'quantity' => 'required',
        ], $this->messages, $this->attributes);
        if($validator->fails())
            return redirect()->back()->withErrors($validator)->withInput();

        $variant = Variant::where('id', $id)->first();
        $product_id = ($request->product_id != null) ? $request->product_id : $product->product_id;
        // $size = ($request->size != null) ? $request->size : $variant->size;
        // $color = ($request->color != null) ? $request->color : $variant->color;
        if($request->color){
            $color =implode(',',$request->color);
        }
        else{
            $color='';
        }
        if($request->size){
            $size =implode(',',$request->size);
        }
        else{
            $size = '';
        }

                $price = ($request->price != null) ? $request->price : $variant->price;
                $quantity = ($request->quantity != null) ? $request->price : $variant->price;
                $status = ($request->status != null) ? $request->status : $variant->status;
        Variant::where('id', $id)

        ->update([

            'product_id'=> $product_id,
            'size'=> $size,
            'color'=> $color,
            'price'=> $price,
            'quantity'=> $quantity,
            'status'=> $status,
        ]);

        return redirect('panel/admin/variant')->with('message', 'Variant Has Beed Updated!');

    }



    public function destroy($id) {

        Variant::destroy($id);

        Session::flash('flash_message', 'Variant Has Been Deleted!');

        return redirect('panel/admin/variant');

    }

}

