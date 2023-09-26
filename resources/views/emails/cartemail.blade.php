<!DOCTYPE html>
<html>
<head>
    <style>
        table { 
	width: 750px; 
	border-collapse: collapse; 
	margin:50px auto;
	}

/* Zebra striping */
tr:nth-of-type(odd) { 
	background: #eee; 
	}

th { 
	background: #3498db; 
	color: white; 
	font-weight: bold; 
	}

td, th { 
	padding: 10px; 
	border: 1px solid #ccc; 
	text-align: left; 
	font-size: 18px;
	}

/* 
Max width before this PARTICULAR table gets nasty
This query will take effect for any screen smaller than 760px
and also iPads specifically.
*/
@media 
only screen and (max-width: 760px),
(min-device-width: 768px) and (max-device-width: 1024px)  {

	table { 
	  	width: 100%; 
	}

	/* Force table to not be like tables anymore */
	table, thead, tbody, th, td, tr { 
		display: block; 
	}
	
	/* Hide table headers (but not display: none;, for accessibility) */
	thead tr { 
		position: absolute;
		top: -9999px;
		left: -9999px;
	}
	
	tr { border: 1px solid #ccc; }
	
	td { 
		/* Behave  like a "row" */
		border: none;
		border-bottom: 1px solid #eee; 
		position: relative;
		padding-left: 50%; 
	}

	td:before { 
		/* Now like a table header */
		position: absolute;
		/* Top/left values mimic padding */
		top: 6px;
		left: 6px;
		width: 45%; 
		padding-right: 10px; 
		white-space: nowrap;
		/* Label the data */
		content: attr(data-column);

		color: #000;
		font-weight: bold;
	}

}
    </style>
</head>
<body>
    <p>Name: {{$name}}</p>
    <p>Email: {{$email}}</p>
    <p>Phone: {{$phone}}</p>
    <p>Country: {{$country}}</p>
    <p>City: {{$city}}</p>
    <p>Zip: {{$zip}}</p>
    <p>Permanent Address: {{$address1}} @if($address2) , {{$address2}}@endif</p>
	
    <p>Total: {{$total}}</p>
    <p>Transaction Id: {{$transaction_id}}</p>
    <p>Order Number: {{$order_num}}</p>
    <p>Order Status: Pending</p>
<table style="">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>Product Details</th>
                                            <th>Quantity</th>
                                            <th>Price</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    @foreach($OrderDetails as $index => $item)
                                        <tr class="get_order_number">
                                            <td>{{ $index+1 }}</td>
                                            <td>{{ $item->product_name }}<br>
                                            @if($item->size)
                                            Size : {{ $item->size }}  
                                            @endif
                                            <br>
                                            @if($item->color)
                                            Color : {{ $item->color }}  
                                            @endif
                                            <br>
                                            @if($item->name)
                                            Name Written : {{ $item->name }}  
                                            @endif

                                        </td>
                                            <td>{{ $item->quantity }}</td>
                                            <td>${{ $item->total_price }}</td>
                                        </tr>
                                    @endforeach
                                    </tbody>
                                </table>
    <p>Thankyou For Booking</p>
</body>
</html>