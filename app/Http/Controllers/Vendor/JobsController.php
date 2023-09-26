<?php



namespace App\Http\Controllers\Vendor;



use App\Http\Controllers\Controller;

use App\model\Job;
use App\model\Banner;
use App\model\CMS;
use App\model\Industry;
use App\model\Jobtitle;
use App\model\Skill;
use App\model\TechSkill;
use App\model\User;
use App\model\Workpermit;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\File;

use Validator;

use Session;



class JobsController extends Controller

{


    public function index() {

        $jobs = Job::where('user_id',auth()->user()->id)->get();
        // $companys = User::where('id',$jobs->id);
        return view('admin.jobs.index', compact('jobs'));

    }



    // public function create() {

    //     return view('admin.blog.add');

    // }



    // public function store(Request $request) {



    //     $validator = Validator::make($request->all(), [

    //         'title' => 'required|string|max:255',

    //         'blogger_name' => 'required|string|max:255',

    //         'description' => 'required',

    //         'image' => 'required|image|mimes:jpeg,jpg,png|max:2000000',

    //     ], $this->messages, $this->attributes);



    //     if($validator->fails())

    //         return redirect()->back()->withErrors($validator)->withInput();



    //     $blog = new Blog;

    //     $blog->title = $request->title;

    //     $blog->slug = str_slug($request->title);

    //     if ($request->short_description != null)

    //         $blog->short_description = $request->short_description;

    //     $blog->description = $request->description;

    //     $blog->blogger_name = $request->blogger_name;

    //     $blog->tag = 'blog';

    //     if($request->hasfile('image'))

    //     {

    //         $file = $request->file('image');

    //         $extention = $file->getClientOriginalExtension();

    //         $filename = time() . '.' . $extention;

    //         $file->move(public_path('uploads/admin/blog/'),$filename);

    //         $blog->image_path = 'uploads/admin/blog/'.$filename;

    //     }

    //     $blog->save();

    //     return redirect('panel/admin/blog')->with('message', 'New Blog is inserted!');

    // }



    public function edit($id) {

        $job_detail = Job::findOrFail($id);
        $work_permit = Workpermit::where('status',1)->get();
        $job_title = Jobtitle::where('status',1)->get();
        $skill = Skill::where('status',1)->get();
        $techskill = TechSkill::where('status',1)->get();
        $industry = Industry::where('status',1)->get();
        $post_banner = Banner::where('page_name','Post A Job')->first();
        $cms = CMS::where('page_name','Post Guest')->first();
        return view('front.post-job-edit', compact('job_detail','post_banner','cms','industry','techskill','skill','job_title','work_permit'));

    }



    public function show($id) {
        if(auth()->user()->hasRole('vendor')){
            $job_detail = Job::where('id',$id)->where('user_id', auth()->user()->id)->first();
        }else{
            $job_detail = Job::findOrFail($id);
        }
        return view('admin.jobs.view', compact('job_detail'));

    }



    public function update(Request $request , $id) {
            $validator = Validator::make($request->all(), [ 
                'job_seeker' => 'required',
                'job_title' => 'required',
                'otherskill'=> ['nullable','regex:/^[\pL\s\-]+$/u'],
                'othertskill'=> ['nullable','regex:/^[\pL\s\-]+$/u'],
                'address' => 'required|max:255', 
                'city' => 'required|max:255|regex:/^[\pL\s\-]+$/u', 
                'state' => 'nullable|required_unless:sel_country,2|max:255|regex:/^[\pL\s\-]+$/u', 
                'country' => 'required|max:255|regex:/^[\pL\s\-]+$/u', 
                'work_permit' => 'required', 
                'income' => 'required', 
            ],
            [ 
                'job_title' => 'Please Provide A Job Title',
                'job_seeker.required' => 'Please Provide A Job Type',
                'otherskill.regex' => 'Skill can only contain aplabets',
                'othertskill.regex' => 'Skill can only contain aplabets',
                'address.required' => 'Please Provide A Address',
                'address.max' => 'Address can not exceed :max characters',
                'city.required' => 'Please Provide A City',
                'city.max' => 'City can not exceed :max characters',
                'city.regex' => 'City can only contain aplabets',
                'state.required_unless' => 'State is Required',
                'state.max' => 'State can not exceed :max characters',
                'state.regex' => 'State can only contain aplabets',
                'country.required' => 'Please Provide A Country',
                'country.max' => 'Country can not exceed :max characters',
                'country.regex' => 'Country can only contain aplabets',
                'job_seeker.required' => 'Please Provide A Job Seeker',
                'work_permit.required' => 'Please Select A Work Permit Option',
                'income.required' => 'Please Provide A Income',
            ]);
            if ($validator->fails()){
                $errors = $validator->errors();
                return response()->json(['error' => 'Please Fill all Mandatory Fields','errors'=>$errors],500);
            }

        $job = Job::where('id', $id)->first();

        Job::where('id', $id)

        ->update([

            'job_title' => $request->job_title,
            'job_type'=> $request->job_seeker,
            'short_description'=> $request->short_description,
            'skill' => (($request->skill != '') ? $request->skill = implode(',',$request->skill) : ''),
            'skill_exp' => (($request->exp_date != '') ? $request->exp_date = implode(',',$request->exp_date) : ''),
            'other_skill' => $request->otherskill,
            'tech_skill' => (($request->tskill != '') ? $request->tskill = implode(',',$request->tskill) : ''),
            'other_techexp' => (($request->texp != '') ? $request->texp = implode(',',$request->texp) : ''),
            'other_techskill' => $request->othertskill,
            'certificate' => $request->certificate,
            'long_description' =>  $request->long_description,
            'address' =>  $request->address,
            'city' => $request->city,
            'country' => $request->country,
            'work_permit' => $request->work_permit,
            'income' => $request->income,
            'add_info' => $request->add_info

        ]);
        Session::flash('message', 'Job Has successfully updated!!'); 
        return response()->json(['success' => 'Job Post Successfully',"redirect_url"=>url('panel/Vendor/jobs'),'message'=>'Job has been Updated!'],200);
        // return response()->json(['success' => 'Job Update Successfully',"redirect_url"=>url('/panel/Vendor/jobs')],200)->with('message', 'Job has been Updated!');
    }



    public function destroy($id) {

        Job::destroy($id);

        Session::flash('flash_message', 'Job Has Been Deleted!');

        return redirect('panel/Vendor/jobs');

    }

}

