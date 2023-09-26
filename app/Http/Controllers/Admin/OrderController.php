<?php

namespace App\Http\Controllers\Admin;

use App\model\Order;
use App\model\OrderDetails;
use App\User;
use Auth;
use App\Product;
use App\Category;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Session;
use LaravelDaily\Invoices\Invoice;
use LaravelDaily\Invoices\Classes\Party;
use LaravelDaily\Invoices\Classes\InvoiceItem;
use Illuminate\Support\Facades\Mail;
class OrderController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        if(Auth::check()){
        $orders = Order::all();
        return view('admin.order.index', compact('orders'));
    }
    }

    public function create() {
        return view('admin.testimonial.create');
    }

    public function store(Request $request) {
        $team =  new Testimonial();
        $team->name = $request->input('name');
        $team->review = $request->input('review');
        $team->save();
        Session::flash('success','New Testimonial Detail Has Been Added!');
        return redirect()->route('admin.testimonial.index');
    }

    public function show($id)
    {
        $order = Order::findorFail($id);
        $OrderDetails = OrderDetails::where('order_id',$order->id)->get();
        return view('admin.order.view', compact('order','OrderDetails'));
    }

    public function update(Request $request, Order $order)
    {
        if ($request->order_status == 2) {
            Order::where('id', $request->order_id)
                ->update([
                    'order_status' => $request->order_status,
                    'payment_status' => 'Paid',
                ]);
            $ord = Order::where('id',$request->order_id)->first();
            $data2["email"] = $ord->email;
            $data2["name"] = $ord->first_name.' '.$ord->last_name; 
                $data = array(
             'name'=>"$ord->first_name.$ord->last_name",
             'email'=>"$request->email",
             'order_num'=>"$ord->number",
             'sendto'=>"user",
             'status'=>"delivered",
             );
            Mail::send('emails.ordupemail', $data,function ($m) use ($data,$data2) {
                $m->from('noreply@demo-customlinks.com', 'Your Order Status');
                $m->to('$data["email"]','$data["name"]')->subject('Order Status');
            });
            $data = array(
             'name'=>"$ord->first_name $ord->last_name",
             'email'=>"$request->email",
             'order_num'=>"$ord->number",
             'sendto'=>"admin",
             'status'=>"delivered",
             );
            Mail::send('emails.ordupemail', $data,function ($m) use ($data,$data2) {
                $m->from('noreply@demo-customlinks.com', 'Order Status Update Succsessfully"');
                $m->to('noreply@demo-customlinks.com','Admin')->subject('Order Status Update');
            });	
            }
            else{
                Order::where('id', $request->order_id)
                ->update([
                    'order_status' => $request->order_status,
                    'payment_status' => 'Unpaid',
                ]);
                $ord = Order::where('id',$request->order_id)->first();
                $data2["email"] = $ord->email;
                // $data["email"] = $ord->email;
                // dd($ord);
            $data2["name"] = $ord->first_name.' '.$ord->last_name; 
                $data = array(
             'name'=>"$ord->first_name.$ord->last_name",
             'email'=>"$ord->email",
             'order_num'=>"$ord->number",
             'sendto'=>"user",
             'status'=>"dispatched",
             );
            Mail::send('emails.ordupemail', $data,function ($m) use ($data,$data2) {
                $m->from('noreply@demo-customlinks.com', 'Your Order Status');
                $m->to($data["email"],$data["name"])->subject('Order Status');
            });
            $data = array(
             'name'=>"$ord->first_name $ord->last_name",
             'email'=>"$ord->email",
             'order_num'=>"$ord->number",
             'sendto'=>"admin",
             'status'=>"dispatched",
             );
            Mail::send('emails.ordupemail', $data,function ($m) use ($data,$data2) {
                $m->from('noreply@demo-customlinks.com', 'Order Status Update Succsessfully"');
                $m->to('noreply@demo-customlinks.com','Admin')->subject('Order Status Update');
            });	
            }
        return redirect('panel/admin/order')->with('message', 'Order Status Has Been Updated Successfully!');
    }

    public function destroy($id) {
        $order = Order::findorFail( $id );
        $order->delete();
        Session::flash('message', "Order Has Been deleted Successfully!");
        return redirect()->back();
    }

    public function Invoice($id)
    {
        $logo = getConfig('logo');
        $orders = Order::findOrFail($id);
        $orderdescription = OrderDetails::where('order_id',$orders->id)->get();        
        $user_detail = User::where('id',$orders->user_id)->first();

        foreach ($orderdescription as $index => $description) {
            $name = '';
            $product_price = '';
            $product_quantity = '';
            if ($description->name != null) {
                $name = $description->name;
            }
            if ($description->price != null) {
                $product_price = 'Product Price : $'.$description->price.'<br>';
            }
            if ($description->quantity != null) {
                $product_quantity = 'Product Quantity : '.$description->quantity.'<br>';
            }

        $customer = new Party([
            'name'          => $orders->billing_first_name.' '.$orders->billing_last_name,
            // 'address'       => $user_detail->billing_address_1.' , '.$user_detail->billing_address_2,
            'phone'          => $orders->billing_contact,
            // 'custom_fields' => [
            //     'city' => $user_detail->billing_city,
            //     'state' => $user_detail->billing_state,
            //     'Zip code' => $user_detail->billing_zip_code,
            // ],
        ]);
        
        $subTotal  = $description->price * $description->quantity;
        $product = Product::where('name',$name)->first();

        $category = Category::where('id',$product->category_id)->first();

        $items[$index] =
            (new InvoiceItem())
                ->title($name)
                ->pricePerUnit($description->price)
                ->subTotalPrice($subTotal)
                // ->discount($orders->discount)
                ->Quantity($description->quantity)
                ->description($category->name);

        $notes = [
            'Invoice Digitaly Signed By',
            '- Daly Look Solution',
        ];
        $notes = implode("<br>", $notes);

        $invoice = Invoice::make('Reciept For Order # '.$orders->order_number)
            ->sequence(667)
            ->buyer($customer)
            ->date(now()->subWeeks(3))
            ->dateFormat('m/d/Y')
            ->currencySymbol('$')
            ->currencyCode('USD')
            ->currencyFormat('{SYMBOL}{VALUE}')
            ->currencyThousandsSeparator('.')
            ->currencyDecimalPoint(',')
            ->filename($customer->name)
            ->totalAmount($orders->total)
            ->addItems($items)
            ->notes($notes)
            ->setCustomData([
                'discount'=>$orders->discount
            ])
            ->myData('<p><strong>Name</strong> : '.$orders->billing_first_name.' '.$orders->billing_last_name.'<br><strong>Address</strong> : '.$orders->billing_address1.' , '.$orders->billing_address2.' , '.$orders->billing_city.' , '.$orders->billing_state.'<br><strong>Contact</strong> : '.$orders->billing_contact.'</p>')
            // ->logo(public_path($logo->img_path))
            ->logo($logo)
            // ->shipping($orders->shipping_price)
            ->save('public');
        }
        $link = $invoice->url();
        return $invoice->stream();
    }
}
