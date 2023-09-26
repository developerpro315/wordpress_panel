<?php
namespace App\Http\Controllers\cart;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Mail;
use Illuminate\Http\Request;
use Alert;
use Illuminate\Support\Facades\Validator;
use App\model\Slider;
use App\model\Product;
use App\model\Order;
use App\User;
use App\model\Country;
use App\model\Banner;
use App\model\OrderDetails;
use Session;
use Auth;
class CartController extends Controller

{
    private $messages=[

     'first_name.required' =>'Provide Your :attribute',

     'last_name.required' =>'Provide Your :attribute',

     'email.required' =>'Provide Your :attribute',

     'contact.required' =>'Provide Your :attribute',

     'country.required' =>'Country is Required',

     'city.required' =>'Provide Your :attribute',

     'address1.required' =>'Provide Your :attribute',

     'address2.required' =>'Provide Your :attribute',
    ];

    private $attributes=[

     'first_name' =>'First Name',

     'last_name' =>'Last Name',

     'email' =>'Email Address',

     'contact' =>'Contact',

    //  'country' =>'Country',

     'city' =>'City',

     'address1' =>'Address One',

     'address2' =>'Address Two',

    ];

    public function index(Request $request){
        if($request->method() == 'POST'){
            if (Auth::check()) {
                $product = Product::where('id',$request->hiddenId)->first();
                
                if($product->quantity == null){
                    return redirect()->back()->with('error','Product Is Not Available');
                }
                
                $cart = \Cart::session(auth()->user()->id)->getContent(auth()->user()->id);
                $product_check = '';
                foreach ($cart as $key => $value) {
                    if ($product->slug == $value->attributes['slug']) {
                        return redirect('cart')->with('error','This Product Is Already In Cart');
                    }
                }
                
                $quantity = (isset($request->quant)) ? $request->quant : 1;
                $cartData = \Cart::session(auth()->user()->id)->add(array(
                    'id' => uniqid(),
                    'name' => $product->title,
                    'price' => $product->price,
                    'quantity' => $quantity,
                    'attributes' => array(
                        'slug' => $product->slug,
                        'image' => $product->image1,
                    ),
                    'associatedModel' => $product,
                ));

                    if($cartData)
                    {
                        return redirect()->route('AddToCart');
                    }
                // }
            

            }
        }
        if (Auth::check()) {
            $cart = \Cart::session(auth()->user()->id)->getContent(auth()->user()->id);
            // $products_details=Product::where('status',1)->first();
            $banner=Banner::where('page_name','Cart')->first();
            $lastIndex = 0;
            foreach ($cart as $key => $value) {
                $lastIndex = $value->id;
            }
            if (count($cart) > 0) {
                return view('front.cart',compact('banner','cart','lastIndex'));
            }
            else{
                return redirect()->route('index')->with('error','Your Cart Is Empty');   
            }

        }
            return redirect()->route('login')->with('error','Login Before Proceed');
    }

     public function updateCart(Request $request){

        if($request->quantity > 0){

            \Cart::session(auth()->user()->id)->update($request->id,
            array(

                    'quantity' => array(

                    'relative' => false,

                    'value' => $request->quantity,

                )

            ));

            return json_encode(1);
        }

    }

    public function remove($id){
        \Cart::session(auth()->user()->id)->remove($id);

        return redirect()->back()->with('message','Product Has Been Removed From Cart');

    }

    public function checkout(Request $request){

        if($request->method() == 'POST'){
            dd($request->all());
            $FileAddedToCart = \Cart::session(auth()->user()->id)->update($request->last_index, array(
                'subtotal' => $request->sub_total,
                'total' => $request->total,
            ));

            if ($FileAddedToCart) {

                return redirect()->route('webCheckoutPage');

            }

        }
        $banner = Banner::where('page_name','Checkout')->first();
        $cart = \Cart::session(auth()->user()->id)->getContent(auth()->user()->id);
        $countries = Country::all();

        if (count($cart) > 0) {

            return view('front.checkout',compact('banner','cart','countries'));

        }

        else{

            return redirect()->route('index')->with('message','Your Order Has Been Placed Successfully');

        }

    }



    public function __construct()
    {
        $accessToken = env('SQUARE_ACCESS_TOKEN', 'EAAAFE7MKx6L_r0jd3nhQ9YM8wtIZo77LisTYfh9_3a36dZxxyCn93g9RAdyHGCL');
        $this->locationId = env('SQUARE_LOCATION_ID', 'V4V46PEK0N4Z1');
        $defaultApiConfig = new \SquareConnect\Configuration();
        $defaultApiConfig->setHost("https://connect.squareup.com");
        $defaultApiConfig->setAccessToken($accessToken);
        $this->defaultApiClient = new \SquareConnect\ApiClient($defaultApiConfig);
    }
    public function addCustomer() {

        $name = "dannysfamilypets";
        $email = "dannysfamilypets@yahoo.com";

        $customer = new \SquareConnect\Model\CreateCustomerRequest();
        $customer->setGivenName($name);
        $customer->setEmailAddress($email);



        $customersApi = new \SquareConnect\Api\CustomersApi($this->defaultApiClient);

        try {
            $result = $customersApi->createCustomer($customer);
            $id = $result->getCustomer()->getId();
            return $id;

        } catch (Exception $e) {
            return "";
            Log::info($e->getMessage());
            //echo 'Exception when calling CustomersApi->createCustomer: ', $e->getMessage(), PHP_EOL;
        }

        return "";
    }
    public function chargeorder($customerId, $cardId, $request,$order_num)
    {
        $user_id = auth()->user()->id;
        $username = User::where('id',$user_id)->first();

        $payments_api = new \SquareConnect\Api\PaymentsApi($this->defaultApiClient);
        $payment_body = new \SquareConnect\Model\CreatePaymentRequest();

        $amountMoney = new \SquareConnect\Model\Money();

        # Monetary amounts are specified in the smallest unit of the applicable currency.
        # This amount is in cents. It's also hard-coded for $1.00, which isn't very useful.
        $amountMoney->setAmount($request->total*100);
        $amountMoney->setCurrency("USD");
        $payment_body->setCustomerId($customerId);
        $payment_body->setSourceId($cardId);
        $payment_body->setAmountMoney($amountMoney);
        $payment_body->setLocationId($this->locationId);
        $payment_body->setReferenceId($order_num);
        $payment_body->setNote('Product Purchase, User Name: '.$username->first_name.' '.$username->last_name.', Order ID: '.$order_num);

        # Every payment you process with the SDK must have a unique idempotency key.
        # If you're unsure whether a particular payment succeeded, you can reattempt
        # it with the same idempotency key without worrying about double charging
        # the buyer.
        $payment_body->setIdempotencyKey(uniqid());

        try {
            $result = $payments_api->createPayment($payment_body);
            if($result->getPayment()->getStatus() == 'COMPLETED'){
                $transaction_id = $result->getPayment()->getId();
                $this->ordersubmit($request, $transaction_id,$order_num);
            }else{
                return response()->json(['error' => 'Transaction Not Complete']);
            }

        } catch (\SquareConnect\ApiException $e) {
            echo "Exception when calling PaymentsApi->createPayment:";
            var_dump($e->getResponseBody());
        }

    }

    public function placeOrder(Request $request){
        // dd($request->all());
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
                // return response()->json(['errors' => $validator->errors()]);
            }
            else{
                $order_num = uniqid();
                // $cardNonce = $request->nonce;
                // $customersApi = new \SquareConnect\Api\CustomersApi($this->defaultApiClient);
                // $customerId = $this->addCustomer();
                // $body = new \SquareConnect\Model\CreateCustomerCardRequest();
                // $body->setCardNonce($cardNonce);
                //             try {
                //     $result = $customersApi->createCustomerCard($customerId, $body);
                // } catch(\SquareConnect\ApiException $e) {
                //     return response()->json(['error' => $e->getResponseBody()->errors[0]->detail]);
                // }
                // $card_id = $result->getCard()->getId();
                // $card_brand = $result->getCard()->getCardBrand();
                // $card_last_four = $result->getCard()->getLast4();
                // $card_exp_month = $result->getCard()->getExpMonth();
                // $card_exp_year = $result->getCard()->getExpYear();
                // $this->chargeorder($customerId, $card_id, $request,$order_num);   
                $this->ordersubmit($request,$order_num);
            }
        }
        public function ordersubmit($request,$order_num){
            $cart = \Cart::session(auth()->user()->id)->getContent(auth()->user()->id);
            // dd($request->all());

        $order = new Order();
        $order->number = $order_num;
        $order->user_id = auth()->user()->id;
        $order->first_name = $request->first_name;
        $order->last_name = $request->last_name;
        $order->email = $request->email;
        $order->contact = $request->contact;
        $order->country = $request->country;
        $order->city = $request->city;
        $order->zip_code = $request->zip;
        $order->address1 = $request->address1;
        $order->address2 = (($request->address2 != null)?$request->address2 : '');
        $order->total = $request->total;
        $order->subtotal = $request->subtotal;
        // $order->transaction_id = $transaction_id;
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
            $firstname = $request->first_name;
            $lastname = $request->last_name;
            $data2["email"] = $request->email;
            $data2["name"] = $firstname.$lastname;
            $data = array('name'=>"$firstname.$lastname",'email'=>"$request->email",'phone'=>"$request->contact",'country'=>"$request->country",'city'=>"$request->city",'zip'=>"$request->zip",'address1'=>"$request->address1",'address2'=>"(($request->address2 != null)?$request->address2 : '')",'total'=>"$request->total",
            // 'transaction_id'=>"$transaction_id,"
            'order_num'=>"$order_num",'OrderDetails'=>$OrderDetails);
                Mail::send('emails.cartemail', $data,function ($m) use ($data,$data2) {
                $m->from('info@dannysfamilypets.com', 'Order Booking');
                $m->to($data2["email"],$data2["name"])->subject(' '.$data2["name"].' Your Order Has Been Booked Successfully');
            });
            $data = array('name'=>"$firstname.$lastname",'email'=>"$request->email",'phone'=>"$request->contact",'country'=>"$request->country",'city'=>"$request->city",'zip'=>"$request->zip",'address1'=>"$request->address1",'address2'=>"(($request->address2 != null)?$request->address2 : '')",'total'=>"$request->total",
            // 'transaction_id'=>"$transaction_id",
            'order_num'=>"$order_num",'OrderDetails'=>$OrderDetails);
                Mail::send('emails.cartemail', $data,function ($m) use ($data,$data2) {
                $m->from('info@dannysfamilypets.com', 'Order Booking');
                $m->to('info@dannysfamilypets.com','Admin')->subject(' '.$data2["email"].' Place a Order');
            });
            Session::flash('message','Your Order Place Succesfully!');
            return redirect('/');
        }

}
