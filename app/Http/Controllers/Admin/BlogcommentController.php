<?php



namespace App\Http\Controllers\admin;



use App\Http\Controllers\Controller;

use App\model\Blog;
use App\model\Blog_comment;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\File;

use Validator;

use Session;



class BlogcommentController extends Controller

{

    private $messages = [

        'title.required' => 'Provide a :attribute',
        'title.max' => ':attribute can not exceed :max characters',
        'description.required' => 'Provide :attribute',
        'short_description.required' => 'Provide :attribute',
        'image.required' => 'Provide :attribute',
        'image.mimes' => 'Provide:attribute of jpeg,jpg or png Type',
        'image.max' => 'Size of :attribute shold be less than 2 MBs',

    ];

    private $attributes = [

        'title' => 'Blog Title',
        'description' => 'Description',
        'short_description' => 'Short Description',
        'image' => 'Image',

    ];

    public function index() {

        $blog_comments = Blog_comment::all();

        return view('admin.blog-comment.index', compact('blog_comments'));

    }



    public function create() {

        return view('admin.blog-comment.add');

    }



    public function store(Request $request) {
        $validator = Validator::make($request->all(), [

            'title' => 'required|string|max:255',
            'slug' => 'required',
            'short_description' => 'required',
            'description' => 'required',
            'image' => 'required|image|mimes:jpeg,jpg,png|max:2000000',

        ], $this->messages, $this->attributes);



        if($validator->fails())

            return redirect()->back()->withErrors($validator)->withInput();



        $blog = new Blog;
        $blog->title = $request->title;
        $blog->slug = str_slug($request->title);
        $blog->short_description = $request->short_description;
        $blog->description = $request->description;
        if($request->hasfile('image'))
        {
            $file = $request->file('image');
            $extention = $file->getClientOriginalExtension();
            $filename = time() . '.' . $extention;
            $file->move(public_path('uploads/admin/blog/'),$filename);
            $blog->image_path = 'uploads/admin/blog/'.$filename;
        }

        $blog->save();

        return redirect('panel/admin/blog')->with('message', 'New Blog is inserted!');

    }



    public function edit($id) {

        $blog_comment_detail = Blog_comment::findOrFail($id);

        return view('admin.blog-comment.edit', compact('blog_comment_detail'));

    }



    public function show($id) {

        $blog_comment_detail = Blog_comment::findOrFail($id);

        return view('admin.blog-comment.view', compact('blog_comment_detail'));

    }



    public function update(Request $request , $id) {
        $name = ($request->name != null) ? $request->name : $imagetable->name;
        $subject = ($request->subject != null) ? $request->subject : $imagetable->subject;
        $message = ($request->message != null) ? $request->message : $imagetable->message;
        $status = ($request->status != null) ? $request->status : $imagetable->status;
            Blog_comment::where('id', $id)
            ->update([
                'name'=> $name,
                'subject' => $subject,
                'message' => $message,
                'status' => $status

            ]);
        return redirect('panel/admin/blogcomments')->with('message', 'Blog Comment has been Updated!');

    }



    public function destroy($id) {

        Blog_comment::destroy($id);

        Session::flash('flash_message', 'Blog Comment Has Been Deleted!');

        return redirect('panel/admin/blogcomments');

    }

}

