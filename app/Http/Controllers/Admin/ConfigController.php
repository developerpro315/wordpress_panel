<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\model\Config;
use App\imagetable;
use App\model\Slider;
use Validator;
use Session;

class ConfigController extends Controller
{
    private $messages = [
        'COMPANYPHONE.regex' => ':attribute should be numeric',
    ];
    private $attributes = [
        'COMPANYPHONE' => 'Phone Number',
    ];

    public function update(Request $request)
    {
        if($request->isMethod('Post')) {
            $validator = Validator::make($request->all(), [
                'COMPANYPHONE' => 'regex:/^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}$/',
            ], $this->messages, $this->attributes);

            if($validator->fails()){ 
                session::flash('flash_message',$validator->errors()->first());
                return redirect()->back();
            }

            foreach($request->except(['_token']) as $index => $value) {
                $config = Config::where('flag_type', $index)->first();
                $config->flag_value = $value;   
                $config->flag_additionalText = $value;
                $config->save();
            }
            session()->flash('message', 'Successfully Updated');
            return redirect('panel/admin/config');
        }
        return view('admin.dashboard.index-config');
    }

}
