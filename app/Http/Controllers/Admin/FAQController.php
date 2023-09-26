<?php



namespace App\Http\Controllers\admin;



use App\Http\Controllers\Controller;

use App\model\FAQ;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\File;

use Validator;

use Session;



class FAQController extends Controller

{

    private $messages = [

        'question.required' => 'Provide a :attribute',

        'question.max' => ':attribute can not exceed :max characters',

        'answer.required' => 'Provide an :attribute',

    ];

    private $attributes = [

        'question' => 'Question',

        'answer' => 'Answer',

    ];

    public function index() {

        $FAQ_details = FAQ::all();

        return view('admin.FAQ.index', compact('FAQ_details'));

    }



    public function show($id) {

        $FAQ_detail = FAQ::findOrFail($id);

        return view('admin.FAQ.view', compact('FAQ_detail'));

    }



    public function create() {

        return view('admin.FAQ.add');

    }



    public function store(Request $request) {

        $validator = Validator::make($request->all(), [

            'question' => 'required|string|max:255',

            'answer' => 'required|string',

        ], $this->messages, $this->attributes);



        if($validator->fails())

            return redirect()->back()->withErrors($validator)->withInput();

        $FAQ = new FAQ;

        $FAQ->question=$request->question;

        $FAQ->answer=$request->answer;

        $FAQ->save();

        return redirect('panel/admin/faq')->with('message', 'New FAQ is inserted!');

    }



    public function edit($id) {

        $FAQ_detail = FAQ::findOrFail($id);

        return view('admin.FAQ.edit', compact('FAQ_detail'));

    }



    public function update(Request $request , $id) {


        $faq = FAQ::where('id', $id)->first();

        $question = ($request->question != null) ? $request->question : $faq->question;
        $answer = ($request->answer != null) ? $request->answer : $faq->answer;

        FAQ::where('id', $id)

        ->update([

            'question'=> $question,

            'answer'=> $answer,

        ]);

        return redirect('panel/admin/faq')->with('message', 'FAQ Record is Updated!');

    }



    public function destroy($id) {

        FAQ::destroy($id);

        Session::flash('flash_message', 'FAQ Has Been Deleted!');

        return redirect('panel/admin/faq');

    }

}

