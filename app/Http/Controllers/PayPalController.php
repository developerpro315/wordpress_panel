<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Srmklive\PayPal\Services\PayPal as PayPalClient;
use Validator;
use Session;
use App\User;
use Notification;
use App\Notifications\ApplicationNotification;
use App\model\Order;
use App\model\OrderDetails;
use App\model\Product;
use Illuminate\Support\Facades\Mail;

class PayPalController extends Controller
{
    /**
     * create transaction.
     *
     * @return \Illuminate\Http\Response
     */
    public function createTransaction()
    {

        return redirect('/');
    }

    /**
     * process transaction.
     *
     * @return \Illuminate\Http\Response
     */
    // private $messages = [
       
    //     'p_amount.required' => 'Amount is required',
    //     'p_amount.numeric' => 'Amount must be Numeric',
    //     'p_first_name.required' => ':attribute is required',
    //     'p_first_name.regex' => ':attribute must be character',
    //     'p_last_name.required' => ':attribute is required',
    //     'p_last_name.regex' => ':attribute must be character',
    //     'p_email.required' => ':attribute is required',
    //     'p_email.regex' => 'Invalid Email Format',
    //     'p_country.required' => ':attribute is required',
    //     'p_country.regex' => ':attribute must be character',
    //     'p_phone_number.required' => ':attribute is required',
    //     // 'p_phone_number.regex' => ':attribute must be ',
       
       
    // ];

    // private $attributes = [
    //     'p_amount' => 'Amount',
    //     'p_first_name' => 'First Name',
    //     'p_last_name' => 'Last Name',
    //     'p_email' => 'Email',
    //     'p_country' => 'Country',
    //     'p_phone_number' => 'Phone Number',

    // ];
    public function processTransaction(Request $request)
    {
        $validator = Validator::make($request->all(), [ 
            'first_name' => 'required|max:255|regex:/^[\pL\s\-]+$/u',
            'last_name' => 'required|max:255|regex:/^[\pL\s\-]+$/u',
            'email' => 'required|regex:/^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/ix',
            'contact' => 'required|regex:/^([0-9\s\-\+\(\)]*)$/|min:12',
            'country' => 'required',
            'city' => 'required|regex:/^[\pL\s\-]+$/u',
            'state' => 'required|regex:/^[\pL\s\-]+$/u',
            'zip' => 'required|numeric',
            'address1' => 'required',
            'address2' => 'required',
            'termsandcondition' => 'required',
    
        ],
        [ 
            'first_name.required' => 'Please provide a FirstName',
            'first_name.regex' => 'FirstName Contain Only Alphabate',
            'first_name.max' => 'FirstName Not More Than 255 Character',
            'last_name.required' => 'Please provide a LastName',
            'last_name.regex' => 'LastName Contain Only Alphabate',
            'last_name.max' => 'LastName Not More Than 255 Character',
            'email.required' => 'Please provide an Email',
            'email.regex' => 'Please Provide Valid Email',
            'country.required' => 'Please Provide Country',
            'contact.required' => 'Please Provide Phone',
            'contact.regex' => 'Please Provide Valid Phone',
            'city.required' => 'Please provide a City',
            'city.regex' => 'City Contain Only Alphabate',
            'state.required' => 'Please provide a State',
            'state.regex' => 'State Contain Only Alphabate',
            'zip.required' => 'Please provide a Zip',
            'zip.numeric' => 'Zip Contain Only Numeric Value',
            'paymethod.required' => 'Payment Method Required',
            'address1.required' => 'Please provide a  Complete Address',
            'address2.required' => 'Please provide a  Complete Address',
            'termsandcondition.required' => 'Terms And Condition is Required',
    
        ]);
                if($validator->fails()){
                    return redirect()->back()->withErrors($validator)->withInput();
                }
                $provider = new PayPalClient;
                $provider->setApiCredentials(config('paypal'));
                $paypalToken = $provider->getAccessToken();
                
                $response = $provider->createOrder([
                    "intent" => "CAPTURE",
                    "application_context" => [
                        "return_url" => route('successTransaction'),
                        "cancel_url" => route('cancelTransaction'),
                    ],
                    "purchase_units" => [
                        0 => [
                            "amount" => [
                                "currency_code" => "USD",
                                "value" => $request->total,
                                // "value" => 1,
                            ],
                            
                            ]
                            ]
                        ]);
         Session::put([

            'first_name'=> $request->first_name,
            'last_name'=> $request->last_name,
            'email'=> $request->email,
            'country'=> $request->country,
            'address'=> $request->address1,
            'address2'=> $request->address2,
            'city'=> $request->city,
            'state'=> $request->state,
            'zip'=> $request->zip,
            'contact'=> $request->contact,
            'total'=> $request->total,
            'subtotal'=> $request->subtotal,
            'shipping_price'=> $request->shipping_price,
            'transactionid'=>$response['id'],


    ]);


        if (isset($response['id']) && $response['id'] != null) {
            // redirect to approve href
            foreach ($response['links'] as $links) {
                if ($links['rel'] == 'approve') {
                    return redirect()->away($links['href']);
                }
            }

            return redirect()
                ->route('createTransaction')
                ->with('error', 'Something went wrong.');

        } else {
            return redirect()
                ->route('createTransaction')
                ->with('error', $response['message'] ?? 'Something went wrong.');
        }
    }

    /**
     * success transaction.
     *
     * @return \Illuminate\Http\Response
     */
    public function successTransaction(Request $request)
    {
        $provider = new PayPalClient;
        $provider->setApiCredentials(config('paypal'));
        $provider->getAccessToken();
        $response = $provider->capturePaymentOrder($request['token']);
        $response2 = $response['purchase_units'];
        $response3 =$response2[0]['payments'];
        $response4=$response3['captures'];
        $transactionid= $response4[0]['id'];
        if (isset($response['status']) && $response['status'] == 'COMPLETED') {

       $session_data=Session::all();
        $cart = \Cart::session(auth()->user()->id)->getContent(auth()->user()->id);
    $order = new Order();
    $order_num = uniqid();
    $order->number = $order_num;
    $order->user_id = auth()->user()->id;
    $order->first_name = $session_data['first_name'];
    $order->last_name = $session_data['last_name'];
    $order->email = $session_data['email'];
    $order->contact = $session_data['contact'];
    $order->country = $session_data['country'];
    $order->city = $session_data['city'];
    $order->zip_code = $session_data['zip'];
    $order->state = $session_data['state'];
    $order->address1 = $session_data['address'];
    $order->address2 = $session_data['address2'];
    $order->total = $session_data['total'];
    $order->subtotal = $session_data['subtotal'];
    $order->shipping_price = $session_data['shipping_price'];
    $order->transaction_id = $session_data['transactionid'];
    $transaction_id = $session_data['transactionid'];
    $order->payment_status = 'Paid';
    $order->save();
    $cart_quantity = 0;
    $shipping_price = 0;
    // $subtotal = 0;
    $cart = \Cart::session(auth()->user()->id)->getContent(auth()->user()->id);

    foreach ($cart as $key => $value) {
        $shipping_price = $value->shipping_price;

        // $subtotal = $value->subtotal;

        $order_detail = new OrderDetails();

        $order_detail->user_id = auth()->user()->id;

        $order_detail->product_name = $value->name;
        $order_detail->quantity =  $value->quantity;
        $order_detail->total_price = $value->price;
        $order_detail->order_id = $order->id;
        $order_detail->save();
        // Update the quantity after purchasing products
        $quantity_db = Product::where('slug',$value->attributes['slug'])->first('quantity');
        $quantity_update = $quantity_db->quantity - $value->quantity;
        Product::where('slug',$value->attributes['slug'])
        ->update([
            'quantity' => $quantity_update,
        ]);
        // end of update quantity

        \Cart::session(auth()->user()->id)->remove($value->id);

        $cart_quantity ++;  

    }

    Order::where('id', $order->id)
        ->update([
            'quantity' => $cart_quantity,
            // 'subtotal' => $subtotal,
        ]);
        \Cart::session(auth()->user()->id)->clear();
        $ord = Order::where('number',$order_num)->first();
        $OrderDetails = OrderDetails::where('order_id',$ord->id)->get();
        $firstname =  $session_data['first_name'];
        $lastname =  $session_data['last_name'];
        $email= $session_data['email'];
        $contact = $session_data['contact'];
        $country= $session_data['country'];
        $city = $session_data['city'];
        $zip = $session_data['zip'];
        $address1 = $session_data['address'];
        $address2 = $session_data['address2'];
        $total = $session_data['total'];
        $data2["name"] = $firstname.$lastname;
        $data2["email"] = $email;
        $data = array('name'=>"$firstname.$lastname",'email'=>"$email",'phone'=>"$contact",'country'=>"$country",'city'=>"$city",'zip'=>"$zip",'address1'=>"$address1",
        'total'=>"$total",'transaction_id'=>"$transaction_id",'order_num'=>"$order_num",'OrderDetails'=>$OrderDetails);
        $data['address2']= ($address2 != null?$address2 : '');
            Mail::send('emails.cartemail', $data,function ($m) use ($data,$data2) {
            $m->from('noreply@demo-customlinks.com', 'Order Booking');
            $m->to($data2["email"],$data2["name"])->subject(' '.$data2["name"].' Your Order Has Been Booked Successfully');
        });
        $data = array('name'=>"$firstname.$lastname",'email'=>"$email",'phone'=>"$contact",'country'=>"$country",'city'=>"$city",'zip'=>"$zip",'address1'=>"$address1",'address2'=>(($address2 != null)?$address2 : ''),'total'=>"$total",'transaction_id'=>"$transaction_id",'order_num'=>"$order_num",'OrderDetails'=>$OrderDetails);
            Mail::send('emails.cartemail', $data,function ($m) use ($data,$data2) {
            $m->from('noreply@demo-customlinks.com', 'Order Booking');
            $m->to('noreply@demo-customlinks.com','Admin')->subject(' '.$data2["email"].' Place a Order');
        });
        Session::flash('message','Your Order Place Succesfully!');
        return redirect('/');





        } else {
            return redirect()
                ->route('createTransaction')
                ->with('error', $response['message'] ?? 'Something went wrong.');
        }
    }

    /**
     * cancel transaction.
     *
     * @return \Illuminate\Http\Response
     */
    public function cancelTransaction(Request $request)
    {
        return redirect()
            ->route('createTransaction')
            ->with('error', $response['message'] ?? 'You have canceled the transaction.');
    }
}