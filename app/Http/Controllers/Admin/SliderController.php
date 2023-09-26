<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\model\Slider;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Validator;
use Session;

class SliderController extends Controller
{
    private $messages = [
        'title.required' => 'Provide a :attribute',
        'title.string' => 'Title Should be a Alphabets',
        'title.max' => ':attribute can not exceed :max characters',
        'slider_image.required' => 'Provide :attribute',
        'slider_image.mimes' => 'Provide:attribute of jpeg,jpg or png Type',
        'slider_image.max' => 'Size of :attribute shold be less than 2 MBs',
    ];
    private $attributes = [
        'title' => 'Slider Title',
        'slider_image' => 'Slider Image',
    ];
    public function index()
    {
        $slider_details =Slider::all();
        return view('admin.slider.index',compact('slider_details'));
    }

    public function create() {
        return view('admin.slider.add');
    }

    public function store(Request $request) {

        if($request->method('POST')){
        $validator = Validator::make($request->all(), [
            'title' => 'required|string|max:255',
            'slider_image' => 'required|mimes:jpeg,jpg,png|max:2000000',
            'button' => 'required',
            'button_link' => 'required',
        ], $this->messages, $this->attributes);

        if($validator->fails())
            return redirect()->back()->withErrors($validator->errors())->withInput();

        $slider = new Slider;
        $slider->title = $request->title;
        $slider->description = $request->description;
        $slider->button = $request->button;
        $slider->button_link = $request->button_link;

        if($request->hasfile('slider_image'))
        {
            $file = $request->file('slider_image');
            $extention = $file->getClientOriginalExtension();
            $filename = time() . '.' . $extention;
            $file->move(public_path('uploads/admin/slider/'),$filename);
            $slider->slider_image = 'uploads/admin/slider/'.$filename;
        }
        $slider->save();
        return redirect('panel/admin/slider')->with('message', 'Slider Has been inserted!');
    }
    return redirect('panel/admin/slider');
    }

    public function show($id)
    {
        $slider = Slider::findOrFail($id);
        return view('admin.slider.view', compact('slider'));
    }

    public function edit($id)
    {
        $slider = Slider::findOrFail($id);
        return view('admin.slider.edit', compact('slider'));
    }

    public function update(Request $request , $id)
    {
        $slider = Slider::find($id);
        $slider->title = ($request->title != null) ? $request->title : $slider->title;
        $slider->description = ($request->description != null) ? $request->description : $slider->description;
        $slider->button = ($request->button != null) ? $request->button : $slider->button;
        $slider->button_link = ($request->button_link != null) ? $request->button_link : $slider->button_link;
        $slider->status = ($request->status != null) ? $request->status : $slider->status;
        if ($request->hasfile('image')) {
            $destination = 'uploads/admin/slider/'.$slider->image;
            if (File::exists($destination)) {
                File::delete($destination);
            }
            $file = $request->file('image');
            $extention = $file->getClientOriginalExtension();
            $filename = time().'.'.$extention;
            $file->move(public_path('uploads/admin/slider/'),$filename);
            $slider->slider_image = 'uploads/admin/slider/'.$filename;

        }
        $slider->save();
        return redirect('panel/admin/slider')->with('message', 'Slider Info Has Been Updated Successfully!');
    }

    public function destroy($id)
    {
        Slider::destroy($id);
        Session::flash('flash_message', 'Slider Has Been Deleted!');
        return redirect('panel/admin/slider');
    }
}

