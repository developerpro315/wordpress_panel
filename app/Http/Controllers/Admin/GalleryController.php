<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\model\Gallery;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Validator;
use Session;

class GalleryController extends Controller
{
    private $messages = [
        'link.required' => 'Provide a :attribute',
        'link.max' => ':attribute can not exceed :max characters',
        'image.required' => 'Provide :attribute',
        'image.mimes' => 'Provide:attribute of jpeg,jpg or png Type',
        'image.max' => 'Size of :attribute shold be less than 2 MBs',
    ];
    private $attributes = [
        'link' => 'Gallery Link',
        'image' => 'Gallery Image',
    ];
    public function index()
    {
        $gallery_details =Gallery::all();
        return view('admin.gallery.index',compact('gallery_details'));
    }

    public function create() {
        return view('admin.gallery.add');
    }

    public function store(Request $request) {

        if($request->method('POST')){
        $validator = Validator::make($request->all(), [
            'link' => 'required|string|max:255',
            'image' => 'required|mimes:jpeg,jpg,png|max:2000000'
        ], $this->messages, $this->attributes);

        if($validator->fails())
            return redirect()->back()->withErrors($validator->errors())->withInput();

        $gallery = new Gallery;
        $gallery->link = $request->link;
        if($request->hasfile('image'))
        {
            $file = $request->file('image');
            $extention = $file->getClientOriginalExtension();
            $filename = time() . '.' . $extention;
            $file->move(public_path('uploads/admin/galley/'),$filename);
            $gallery->image = 'uploads/admin/galley/'.$filename;
        }
        $gallery->save();
        return redirect('panel/admin/gallery')->with('message', 'Gallery Has been inserted!');
    }
    return redirect('panel/admin/gallery');
    }

    public function show($id)
    {
        $gallery = Gallery::findOrFail($id);
        return view('admin.gallery.view', compact('gallery'));
    }

    public function edit($id)
    {
        $gallery = Gallery::findOrFail($id);
        return view('admin.gallery.edit', compact('gallery'));
    }

    public function update(Request $request , $id)
    {
        $gallery = Gallery::find($id);
        $gallery->link = ($request->link != null) ? $request->link : $gallery->link;
        $gallery->status = ($request->status != null) ? $request->status : $gallery->status;
        if ($request->hasfile('image')) {
            $destination = 'uploads/admin/gallery/'.$gallery->image;
            if (File::exists($destination)) {
                File::delete($destination);
            }
            $file = $request->file('image');
            $extention = $file->getClientOriginalExtension();
            $filename = time().'.'.$extention;
            $file->move(public_path('uploads/admin/gallery/'),$filename);
            $gallery->image = 'uploads/admin/gallery/'.$filename;

        }
        $gallery->save();
        return redirect('panel/admin/gallery')->with('message', 'Gallery Info Has Been Updated Successfully!');
    }

    public function destroy($id)
    {
        Gallery::destroy($id);
        Session::flash('flash_message', 'Gallery Has Been Deleted!');
        return redirect('panel/admin/gallery');
    }
}

