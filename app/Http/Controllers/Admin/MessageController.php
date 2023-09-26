<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\model\Message;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Validator;
use Session;

class MessageController extends Controller
{
    private $messages = [
        'name.required' => 'Provide a :attribute',
        'name.max' => ':attribute can not exceed :max characters',
        'description.required' => 'Provide :attribute',
        'image.required' => 'Provide :attribute',
        'image.mimes' => 'Provide:attribute of jpeg,jpg or png Type',
        'image.max' => 'Size of :attribute shold be less than 2 MBs',
    ];
    private $attributes = [
        'name' => 'Name',
        'image' => 'Image',
        'description' => 'Description',
    ];
    public function index()
    {
        $message_details =Message::all();
        return view('admin.message.index',compact('message_details'));
    }

    public function create() {
        return view('admin.message.add');
    }

    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'image' => 'required|image|mimes:jpeg,jpg,png|max:2000000',
            'description' => 'required',
        ], $this->messages, $this->attributes);

        if($validator->fails())
            return redirect()->back()->withErrors($validator->errors())->withInput();

        $message = new Message;
        $message->name = $request->name;
        $message->description = $request->description;
        if ($request->hasfile('image')) {
            $file = $request->file('image');
            $extention = $file->getClientOriginalExtension();
            $filename = time() . '.' . $extention;
            $file->move(public_path('uploads/admin/message/'), $filename);
            $message->image = 'uploads/admin/message/' . $filename;
            }
    
        $message->save();
        return redirect('panel/admin/message')->with('message', 'Message Has been inserted!');
    }

    public function show($id)
    {
        $message = Message::findOrFail($id);
        return view('admin.message.view', compact('message'));
    }

    public function edit($id)
    {
        $message = Message::findOrFail($id);
        return view('admin.message.edit', compact('message'));
    }

    public function update(Request $request , $id)
    {
        $message = Message::find($id);
        $message->name = ($request->name != null) ? $request->name : $message->name;
        $message->description = ($request->description != null) ? $request->description : $message->description;
        $message->status = ($request->status != null) ? $request->status : $message->status;
        if ($request->hasfile('image')) {
            $destination2 = public_path(). '/' . $message->image;
            if (File::exists($destination2)) {
                File::delete($destination2);
            }
            $file2 = $request->file('image');
            $extention2 = $file2->getClientOriginalExtension();
            $filename2 = time() . '1.' . $extention2;
            $file2->move(public_path('uploads/admin/message/'), $filename2);
            Message::where('id', $id)
                ->update([
                    'image' => 'uploads/admin/message/' . $filename2,
                    'name' => $message->name,
                    'description' => $message->description,
                    'status' =>$message->status
                ]);
        } else {
            Message::where('id', $id)
                ->update([
                    'name' => $message->name,
                    'description' => $message->description,
                    'status' =>$message->status
                ]);
        }
        $message->save();
        return redirect('panel/admin/message')->with('message', 'Message Info Has Been Updated Successfully!');
    }

    public function destroy($id)
    {
        Message::destroy($id);
        Session::flash('flash_message', 'Message Has Been Deleted!');
        return redirect('panel/admin/message');
    }
}

