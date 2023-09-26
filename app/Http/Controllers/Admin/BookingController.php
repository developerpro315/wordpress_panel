<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;

use App\model\Booking;

use App\model\User;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\File;

use Validator;

use Illuminate\Support\Str;

use Session;

class BookingController extends Controller

{

    public function index() {

        if(auth()->check()){

            if(auth()->user()->hasRole('user')){

                $order_display  = Booking::where('user_id',auth()->user()->id)->get();
                return view('admin.booking.index', compact('order_display'));

            }

            else{

                $order_display  = Booking::all();

                return view('admin.booking.index', compact('order_display'));

            }

        }



    }



    public function show($id) {
        // dd($id);
        $order = Booking::findOrFail($id);
        return view('admin.booking.view', compact('order'));

    }

    public function update(Request $request, Booking $order)

    {

        // dd($request->all());

        $order_status = $request->order_status;

        Booking::where('id', $request->order_number)

            ->update([

                'order_status' => $order_status,

            ]);

        Session::flash('success','Order Status Has Been Updated Successfully!');

        return redirect('panel/admin/orders');

    }



    public function destroy($id) {

        Booking::destroy($id);

      Session::flash('flash_message', 'Service Has Been Deleted!');

        return redirect('panel/admin/orders');

    }

}







