<?php

namespace App\Http\Controllers\Vendor;

use Image;
use DB;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\imagetable;
use App\User;
use App\model\Testimonial;
use App\model\News;
use Session;
use Auth;
use Carbon\Carbon;
use File;

class HomeController extends Controller
{
	public function index()
    {
        return view('web.index')->with('title','Josue Francois');
    }

    public function Dashboard()
    {
        $admin = User::findOrFail(1);
    	return view('admin.dashboard.index',compact('admin'));
    }

    public function updateLogo(Request $request)
    {
        if($request->method() != 'POST')
            return view('admin.logo.index-logo');
        $validArr = array();

        if ($request->hasfile('image')) {
            if($request->file('image')) {
                $validArr['image'] = 'required|mimes:jpeg,jpg,png,gif|required|max:10000';
            }
            $this->validate($request, $validArr);
            $imagetable = imagetable::where('table_name', 'logo')->first();
            $destination = public_path().'/'.$imagetable->image_path;
            if (\Illuminate\Support\Facades\File::exists($destination)) {
                File::delete($destination);
            }
            $file = $request->file('image');
            $extention = $file->getClientOriginalExtension();
            $filename = time().'.'.$extention;
            $file->move(public_path('/uploads/imagetable/'),$filename);
            imagetable::where('table_name', 'logo')
            ->update(['img_path' => 'uploads/imagetable/'.$filename]);
        } 


    
            if ($request->hasfile('image2')) {
                
            if($request->file('image2')) {
                $validArr['image2'] = 'required|mimes:jpeg,jpg,png,gif|required|max:10000';
            }
            $this->validate($request, $validArr);
            $imagetable = imagetable::where('table_name', 'logo2')->first();
                $destination = public_path().'/'.$imagetable->image_path;
                if (\Illuminate\Support\Facades\File::exists($destination)) {
                    File::delete($destination);
                }
                $file = $request->file('image2');
                $extention = $file->getClientOriginalExtension();
                $filename = time().'.'.$extention;
                $file->move(public_path('/uploads/imagetable/'),$filename);
                imagetable::where('table_name', 'logo2')
                ->update(['img_path' => 'uploads/imagetable/'.$filename]);
            } else{
                return redirect()->back()->with('flash_message',(($request->hasFile('image')==null && $request->hasFile('image2') == null)?'Please Provide Image ':session()->flash('message', 'Logo Image updated Successfully')));
            }


        
        return redirect('panel/admin/logo');
    }

    public function faviconUpload(Request $request) {
        if($request->method() != 'POST')
            return view('admin.dashboard.index-favicon');
        $validArr = array();
        if($request->file('image')) {
            $validArr['image'] = 'required|mimes:jpeg,jpg,png,gif|required|max:10000';
        }
        $this->validate($request, $validArr);

        if ($request->hasfile('image')) {
            $destination = 'uploads/admin/'. imagetable::where('table_name', 'favicon')->first()->image_path;
            if (\Illuminate\Support\Facades\File::exists($destination)) {
                File::delete($destination);
            }
            $file = $request->file('image');
            $extention = $file->getClientOriginalExtension();
            $filename = time().'.'.$extention;
            $file->move(public_path('uploads/imagetable/'),$filename);
        } else{
            return redirect()->back()->with('flash_message','Please Provide Favicon Image');
        }
        imagetable::where('table_name', 'favicon')
            ->update(['img_path' => 'uploads/imagetable/'.$filename]);
        session()->flash('message', 'Successfully updated the favicon');
        return redirect('panel/admin/favicon');
    }

    // public function DeleteBanner($id)
    // {
    //     banner::destroy($id);
    //     Session::flash('flash_message', 'Banner Has Been Deleted!');
    //     return redirect('admin/banner');
    // }

    public function UserDisplay(Request $request)
    {
        $keyword = $request->get('search');
        $perPage = 15;

        if (!empty($keyword)) {
            $users = User::where('name', 'LIKE', "%$keyword%")->orWhere('email', 'LIKE', "%$keyword%")
                ->paginate($perPage);
        } else {
            $users = User::paginate($perPage);
        }

        return view('admin.users.index', compact('users'));
    }

    public function UserEdit($id)
    {
        $user_detail = DB::table('users')->where('id',$id)->get();
        return view('admin.users.edit-user', ['user_detail' => $user_detail]);

    }

    public function UserUpdate(Request $request,$id)
    {
        $first_name = $request->first_name;
        $last_name = $request->last_name;
        $contact = $request->contact;
        $address_1 = $request->address_1;
        $address_2 = $request->address_2;
        $city = $request->city;
        $state = $request->state;
        $zip_code = $request->zip_code;
        // $users->password = hash::make($req->password);
        User::where('id', $id)
        ->update([
            'first_name' => $first_name,
            'last_name' => $last_name,
            'contact' => $contact,
            'address_1' => $address_1,
            'address_2' => $address_2,
            'city' => $city,
            'state' => $state,
            'zip_code' => $zip_code,
            ]);
        return redirect('panel/admin/users')->with('message', 'User Info is Updated!');

    }

    public function UserDelete($id){
        User::destroy($id);
        Session::flash('flash_message', 'User Has Been Deleted!');
        return redirect('panel/admin/users');

    }

    public function ShowUser($id)
    {
        $data['user_detail'] = User::findOrFail($id);
        return view('admin.users.user-detail',$data);
    }

    public function HomeInfoSectionDisplay()
    {
        $data['HomeInfo'] = HomeInfo::all();
        return view('admin.web.home_info_section',$data);
    }

    public function AddHomeInfoSection()
    {
        return view('admin.web.add_section_info');
    }

    public function createSlug($title, $id = 0)
    {
        // Normalize the title
        $slug = str_slug($title);
        // Get any that could possibly be related.
        // This cuts the queries down by doing it once.
        $allSlugs = $this->getRelatedSlugs($slug, $id);
        // If we haven't used it before then we are all good.
        if (! $allSlugs->contains('info_slug', $slug)){
            return $slug;
        }
        for ($i = 1; $i <= 10; $i++) {
            $newSlug = $slug.'-'.$i;
            if (! $allSlugs->contains('info_slug', $newSlug)) {
                return $newSlug;
            }
        }
        throw new \Exception('Can not create a unique slug');
    }

    protected function getRelatedSlugs($slug, $id = 0)
    {
        return HomeInfo::select('info_slug')->where('info_slug', 'like', $slug.'%')
        ->where('id', '<>', $id)
        ->get();
    }

    public function profile(Request $request){
	    if($request->method() == 'POST') {
            $this->validate($request,[
                'firstname' => 'required',
                'lastname' => 'required',
                'email' => 'required',
                'company' => 'required',
                'phone' => 'required',
                'industry' => 'required',
                'password'=> 'confirmed'
            ]);
            $user =  auth()->user();
            if($request->password){
                $user->password = bcrypt($request->password);
            }
            $user->email = $request->email;
            $user->first_name = $request->firstname;
            $user->last_name = $request->lastname;
            $user->save();
            $profile = $user->profile;
            if($user->profile == null){
                $profile = new  Profile();
            }
            if($request->dob != null){
                $date =  Carbon::parse($request->dob)->format('Y-m-d');
            }else{
                $date = $request->dob;
            }
            if ($file = $request->file('pic_file')) {
                $extension = $file->extension()?: 'png';
                $destinationPath = public_path() . '/storage/uploads/users/';
                $safeName = time() . '.' . $extension;
                $file->move($destinationPath, $safeName);
                //delete old pic if exists
                if (File::exists($destinationPath . $user->pic)) {
                    File::delete($destinationPath . $user->pic);
                }
                $profile->pic = $safeName;
            }
            $profile->user_id = $user->id;
            // $profile->bio = $request->bio;
            // $profile->gender = $request->gender;
            // $profile->dob = $date;
            // $profile->country = $request->country;
            // $profile->state = $request->state;
            // $profile->city = $request->city;
            // $profile->address = $request->address;
            // $profile->postal = $request->postal;
            $profile->company = $request->company;
            $profile->phone = $request->phone;
            $profile->industry = $request->industry;
            $profile->save();
            Session::flash('message','Account has been updated');
            return redirect()->back();
        }
        $user = auth()->user();
        return view('admin.users.account_setting',compact('user'));
    }

    public function markAsRead()
    {
        auth()->user()->unreadNotifications->markAsRead();
        return redirect()->back()->with('message','All Notification read');
    }
}
