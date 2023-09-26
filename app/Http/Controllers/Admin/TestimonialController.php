<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\model\Testimonial;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Validator;
use Session;

class TestimonialController extends Controller
{
    public function index() {
        $testimonials_details = Testimonial::all();
        return view('admin.testimonials.index', compact('testimonials_details'));
    }

    public function show($id) {
        $testimonial = testimonial::findOrFail($id);
        return view('admin.testimonials.view', compact('testimonial'));
    }

    public function create() {
        return view('admin.testimonials.add');
    }

    public function store(Request $request) {
        $testimonial = new testimonial;
        $testimonial->name=$request->name;
        $testimonial->message=$request->message;
        if($request->hasfile('image'))
        {
            $file = $request->file('image');
            $extention = $file->getClientOriginalExtension();
            $filename = time() . '.' . $extention;
            $file->move(public_path('uploads/admin/testimonial/'),$filename);
            $testimonial->image = 'uploads/admin/testimonial/'.$filename;
        }
        $testimonial->status=1;
        $testimonial->save();
        return redirect('panel/admin/testimonial')->with('message', 'New Testimonial is inserted!');
    }

    public function edit($id) {
        $testimonial_detail = testimonial::findOrFail($id);
        return view('admin.testimonials.edit', compact('testimonial_detail'));
    }

    public function update(Request $request , $id) {
        $imagetable = Testimonial::where('id', $id)->first();
        $name = $request->name;
        $message = $request->message;
        $status = $request->status;

        if($request->hasfile('image'))
        {
            $destination2 = 'uploads/admin/testimonial/'.$imagetable->image;
            if (File::exists($destination2)) {
                File::delete($destination2);
            }
            $file2 = $request->file('image');
            $extention2 = $file2->getClientOriginalExtension();
            $filename2 = time().'1.'.$extention2;
            $file2->move(public_path('uploads/admin/testimonial/'),$filename2);
            Testimonial::where('id', $id)
            ->update([
                'image' => 'uploads/admin/testimonial/'.$filename2,
                'name'=> $name,
                'message'=> $message,
                'status' => $status
            ]);

        }
        else{
            Testimonial::where('id', $id)
                ->update([
                    'name'=> $name,
                    'message'=> $message,
                    'status'=> $status,
                ]);  
            }
        return redirect('panel/admin/testimonial')->with('message', 'Testimonial Record is Updated!');
    }

    public function destroy($id) {
        Testimonial::destroy($id);
        Session::flash('flash_message', 'Testimonial Has Been Deleted!');
        return redirect('panel/admin/testimonial');
    }
}
