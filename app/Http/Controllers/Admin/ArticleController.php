<?php



namespace App\Http\Controllers\admin;



use App\Http\Controllers\Controller;

use App\model\Article;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\File;

use Validator;

use Session;



class ArticleController extends Controller

{

    public function index() {

        $articles = Article::all();

        return view('admin.article.index', compact('articles'));

    }



    public function show($id) {

        $article = Article::findOrFail($id);

        return view('admin.article.view', compact('article'));

    }



    public function create() {

        return view('admin.article.add');

    }



    public function store(Request $request) {
        $validator = Validator::make($request->all(), [ 
            'title' => ['required', 'string', 'max:20','regex:/^[\pL\s\-]+$/u'],
            'author' => ['required', 'string', 'max:20','regex:/^[\pL\s\-]+$/u'],
            'description' => 'required|max:255', 
            'image' => 'required|mimes:jpeg,jpg,png|max:2000000',
            'date' => 'required',
        ],
        [ 
            'title.max' => 'Title can not exceed :max characters',
            'title.regex' => 'Title can only contain aplabets',
            'author.required' => 'Please Provide a Author',
            'author.regex' => 'Please Provide a Valid Number',
            'description.required' => 'Please Provide A Description',
            'description.max' => 'Description can not exceed :max characters',
            'date.required' => 'Please Provide an Date',
        ]);
        if ($validator->fails())
         return redirect()->back()->withErrors($validator)->withInput();

        $article = new Article;
        $article->title=$request->title;
        $article->author=$request->author;
        $article->description=$request->description;
        $article->date=$request->date;
        if($request->hasfile('image'))
        {
            $file = $request->file('image');
            $extention = $file->getClientOriginalExtension();
            $filename = time() . '.' . $extention;
            $file->move(public_path('uploads/admin/article/'),$filename);
            $article->image = 'uploads/admin/article/'.$filename;
        }
        $article->save();

        return redirect('panel/admin/article')->with('message', 'New Article is inserted!');

    }



    public function edit($id) {

        $article = Article::findOrFail($id);

        return view('admin.article.edit', compact('article'));

    }



    public function update(Request $request , $id) {
        $validator = Validator::make($request->all(), [ 
            'title' => ['string', 'max:20','regex:/^[\pL\s\-]+$/u'],
            'author' => ['string', 'max:20','regex:/^[\pL\s\-]+$/u'],
            'description' => 'max:255', 
            'image' => 'mimes:jpeg,jpg,png|max:2000000',
        ],
        [ 
            'title.max' => 'Title can not exceed :max characters',
            'title.regex' => 'Title can only contain aplabets',
            'author.regex' => 'Please Provide a Valid Number',
            'description.required' => 'Please Provide A Description',
            'description.max' => 'Description can not exceed :max characters',
        ]);
        if ($validator->fails())
         return redirect()->back()->withErrors($validator)->withInput();

        $article = Article::where('id', $id)->first();

        $title = ($request->title != null) ? $request->title : $article->title;
        $author = ($request->author != null) ? $request->author : $article->author;
        $description = ($request->description != null) ? $request->description : $article->description;
        $date = ($request->date != null) ? $request->date : $article->date;
        $status = ($request->status != null) ? $request->status : $article->status;
        if ($request->hasfile('image')) {
            $destination = 'uploads/admin/article/'.$article->image;
            if (File::exists($destination)) {
                File::delete($destination);
            }
            $file = $request->file('image');
            $extention = $file->getClientOriginalExtension();
            $filename = time().'.'.$extention;
            $file->move(public_path('uploads/admin/article/'),$filename);
            $article->image = 'uploads/admin/article/'.$filename;
            $article->save();
        }
        Article::where('id', $id)

        ->update([

            'title'=> $title,
            'author'=> $author,
            'description'=> $description,
            'date'=> $date,
            'status'=> $status,

        ]);

        return redirect('panel/admin/article')->with('message', 'Article Record is Updated!');

    }



    public function destroy($id) {

        Article::destroy($id);

        Session::flash('flash_message', 'Article Has Been Deleted!');

        return redirect('panel/admin/article');

    }

}

