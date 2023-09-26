<!DOCTYPE html>
<html>
<head>
</head>
<body>
    <p>Name: {{$name}}</p>
    <p>Email: {{$email}}</p>
    <p>Phone: {{$phone}}</p>
    <p>Country: {{$country}}</p>
    <p>City: {{$city}}</p>
    <p>State: {{$state}}</p>
    <p>Zip: {{$zip}}</p>
    <p>Address: {{$address}}</p>
    @if($chap != '')
    <p>Chaperone: {{$chap}}</p>
    @else
    @endif
    @if($location != '')
    <p>Location: {{$location}}</p>
    @else
    @endif
    @if($puppack != '')
    <p>Pup Pack: {{$puppack}}</p>
    @else
    @endif
    <p>Total: {{$book_total}}</p>
    <p>Transaction_id: {{$transaction_id}}</p>
    <p>Booking Num: {{$booknum}}</p>
    <p>Puppy Name: {{$petname}} </p>
    <img src="{{$petimg}}"  width="200" height="200">
    <p>Thankyou For Booking</p>
</body>
</html>