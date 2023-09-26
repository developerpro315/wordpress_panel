<?php



namespace App\Http\Controllers\admin;



use App\Http\Controllers\Controller;

use App\model\Giftcard;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\File;

use Validator;

use Session;



class GiftcardController extends Controller

{

    private $messages = [
        'title.required' => 'Provide a :attribute',
        'title.max' => ':attribute can not exceed :max characters',
        'price.required' => 'Provide a :attribute',
        'image1.required' => 'Provide a Image',
        'description.required' => 'Provide a description',
    ];

    private $attributes = [
        'title' => 'Product Name',
        'price' => 'Product Price',
    ];

    public function index() {

        $giftcards = Giftcard::all();

        return view('admin.giftcard.index', compact('giftcards'));

    }



    public function show($id) {
        $giftcard = Giftcard::findOrFail($id);
        return view('admin.giftcard.view', compact('giftcard'));

    }



    public function create() {
        return view('admin.giftcard.add');

    }



    public function store(Request $request) {
        // dd($request->all());
             $validator = Validator::make($request->all(), [
            'title' => ['required', 'string', 'max:255'],
            'slug' => 'required',
            'price' => 'required',
            // 'link' => 'required',
            'description' => 'required',
            'image1' => 'required|mimes:jpeg,jpg,png|max:2000000',
        ], $this->messages, $this->attributes);
        if($validator->fails())
            return redirect()->back()->withErrors($validator)->withInput();
        $giftcard = new Giftcard;
        $giftcard->title =$request->title;
        $giftcard->slug =$request->slug;
        // $giftcard->link =$request->link;
        $giftcard->price =$request->price;
        $giftcard->description =$request->description;
        if ($request->hasfile('image1')) {
            $file1 = $request->file('image1');
            $extention1 = $file1->getClientOriginalExtension();
            $filename1 = time() . '.' . $extention1;
            $file1->move(public_path('uploads/admin/giftcard/'), $filename1);
            $giftcard->image1 = 'uploads/admin/giftcard/' . $filename1;
            }
        $giftcard->save();
       

        return redirect('panel/admin/giftcard')->with('message', 'New Gift Card is inserted!');
    }



    public function edit($id) {
        $giftcard = Giftcard::findOrFail($id);
        return view('admin.giftcard.edit', compact('giftcard'));

    }



    public function update(Request $request , $id) {
        $validator = Validator::make($request->all(), [
            'image1' => 'mimes:jpeg,jpg,png|max:2000000',
        ], $this->messages, $this->attributes);
        if($validator->fails())
            return redirect()->back()->withErrors($validator)->withInput();
        $product = Giftcard::where('id', $id)->first();
        $title = ($request->title != null) ? $request->title : $product->title;
        $price = ($request->price != null) ? $request->price : $product->price;
        $description = ($request->description != null) ? $request->description : $product->description;
        // $link = ($request->link != null) ? $request->link : $product->link;
        $status = ($request->status != null) ? $request->status : $product->status;
        if ($request->hasfile('image1')) {
            $destination = 'uploads/admin/giftcard/'.$product->image1;
            if (File::exists($destination)) {
                File::delete($destination);
            }
            $file = $request->file('image1');
            $extention = $file->getClientOriginalExtension();
            $filename = time().'.'.$extention;
            $file->move(public_path('uploads/admin/giftcard/'),$filename);
            $product->image1 = 'uploads/admin/giftcard/'.$filename;
            $product->save();
        }
        Giftcard::where('id', $id)
        ->update([
            'title'=> $title,
            'price'=> $price,
            // 'link'=> $link,
            'description'=> $description,
            'status'=> $status,

        ]);

        return redirect('panel/admin/giftcard')->with('message', 'Gift Card Has Beed Updated!');

    }



    public function destroy($id) {

        Giftcard::destroy($id);

        Session::flash('flash_message', 'Gift Card Has Been Deleted!');

        return redirect('panel/admin/giftcard');

    }

}

