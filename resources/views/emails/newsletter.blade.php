
<html>

<head>

</head>

<body>

    @if($type=='admin')

    <h3>Hello,</h3>
    <p>New Subscriber Email is Registered</p>
    <p>Email: {{$email}}</p>

    @else
    <p>Your Packages Purcahse Successfully</p>
     <p>ID {{$uid}}</p> 
     <p>Username {{$name}}</p> 
     <p>Email {{$email}}</p> 
     <p>Package {{$package}}</p> 
     <p>Unitprice ${{$unitprice}}</p> 
     <p>Quntity {{$qty}}</p> 
     <p>Payment Method {{$currency}}</p> 
     <p>cur_email {{$paypal_account_email}}</p> 
    <p>Thank you for Purchasing</p>
    @endif

</body>

</html>