<?php



namespace App\Http\Controllers\admin;



use App\Http\Controllers\Controller;

use App\model\Schedule;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\File;

use Validator;

use Session;



class ScheduleController extends Controller

{

    private $messages = [

        'schedule.required' => 'Provide a :attribute',
        'schedule.max' => ':attribute can not exceed :max characters',

    ];

    private $attributes = [

        'schedule' => 'Time Schedule',
    ];

    public function index() {

        $schedules = Schedule::all();

        return view('admin.schedule.index', compact('schedules'));

    }



    public function show($id) {

        $schedule = Schedule::findOrFail($id);

        return view('admin.schedule.view', compact('schedule'));

    }



    public function create() {

        return view('admin.schedule.add');

    }



    public function store(Request $request) {

        $validator = Validator::make($request->all(), [

            'schedule' => 'required|string|max:255',
        ], $this->messages, $this->attributes);



        if($validator->fails())

            return redirect()->back()->withErrors($validator)->withInput();

        $schedule = new Schedule;
        $schedule->schedule=$request->schedule;


        $schedule->save();

        return redirect('panel/admin/time-schedule')->with('message', 'New Schedule is inserted!');

    }



    public function edit($id) {

        $schedule = Schedule::findOrFail($id);

        return view('admin.schedule.edit', compact('schedule'));

    }



    public function update(Request $request , $id) {
        $validator = Validator::make($request->all(), [
            'schedule' => 'string|max:255',
        ], $this->messages, $this->attributes);
        if($validator->fails())
            return redirect()->back()->withErrors($validator)->withInput();

        $schedule = Schedule::where('id', $id)->first();
        $status = ($request->status != null) ? $request->status : $puppy->status;
        $schedule = ($request->schedule != null) ? $request->schedule : $schedule->schedule;
        Schedule::where('id', $id)

        ->update([

            'schedule'=> $schedule,
            'status' => $status,
        ]);

        return redirect('panel/admin/time-schedule')->with('message', 'Schedule Record is Updated!');

    }



    public function destroy($id) {

        Schedule::destroy($id);

        Session::flash('flash_message', 'Schedule Has Been Deleted!');

        return redirect('panel/admin/time-schedule');

    }

}

