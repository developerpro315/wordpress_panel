<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;

use App\model\Appointment;

use App\model\User;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\File;

use Validator;

use Illuminate\Support\Str;

use Session;

class AppointmentController extends Controller

{

    public function index() {

        if(auth()->check()){

            if(auth()->user()->hasRole('user')){

                $order_display  = Appointment::where('user_id',auth()->user()->id)->get();
                return view('admin.appointment.index', compact('order_display'));

            }

            else{

                $order_display  = Appointment::all();

                return view('admin.appointment.index', compact('order_display'));

            }

        }



    }



    public function show($id) {

        $order = Appointment::findOrFail($id);
        return view('admin.appointment.view', compact('order'));

    }

    public function update(Request $request, Appointment $order)

    {

        // dd($request->all());

        $order_status = $request->order_status;

        Appointment::where('id', $request->order_number)

            ->update([

                'order_status' => $order_status,

            ]);

        Session::flash('success','Appointment Status Has Been Updated Successfully!');

        return redirect('panel/admin/appointment');

    }



    public function destroy($id) {

        Appointment::destroy($id);

      Session::flash('flash_message', 'Service Has Been Deleted!');

        return redirect('panel/admin/appointment');

    }

}







