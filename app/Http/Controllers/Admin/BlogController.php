<?php



namespace App\Http\Controllers\admin;



use App\Http\Controllers\Controller;

use App\model\Blog;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\File;

use Validator;

use Session;



class BlogController extends Controller

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

        $blogs = Blog::all();

        return view('admin.blog.index', compact('blogs'));

    }



    public function create() {

        return view('admin.blog.add');

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

        $blog_detail = Blog::findOrFail($id);

        return view('admin.blog.edit', compact('blog_detail'));

    }



    public function show($id) {

        $blog_detail = Blog::findOrFail($id);

        return view('admin.blog.view', compact('blog_detail'));

    }



    public function update(Request $request , $id) {
        $imagetable = Blog::where('id', $id)->first();


        $title = ($request->title != null) ? $request->title : $imagetable->title;
        $short_description = ($request->short_description != null) ? $request->short_description : $imagetable->short_description;
        $description = ($request->description != null) ? $request->description : $imagetable->description;
        $status = ($request->status != null) ? $request->status : $imagetable->status;


        if($request->hasfile('image'))

        {

            $destination2 = 'uploads/admin/blog/'.$imagetable->image_path;

            if (File::exists($destination2)) {

                File::delete($destination2);

            }

            $file2 = $request->file('image');

            $extention2 = $file2->getClientOriginalExtension();

            $filename2 = time().'1.'.$extention2;

            $file2->move(public_path('uploads/admin/blog/'),$filename2);

            Blog::where('id', $id)

            ->update([

                'image_path' => 'uploads/admin/blog/'.$filename2,
                'title'=> $title,
                'short_description' => $short_description,
                'description' => $description,
                'status' => $status

            ]);

        }

        else{

            Blog::where('id', $id)

            ->update([

                'title'=> $title,
                'short_description' => $short_description,
                'description' => $description,
                'status' => $status

            ]);

        }

        return redirect('panel/admin/blog')->with('message', 'Blog detail has been Updated!');

    }



    public function destroy($id) {

        Blog::destroy($id);

        Session::flash('flash_message', 'Blog Has Been Deleted!');

        return redirect('panel/admin/blog');

    }

}

