<!DOCTYPE html>
<html>
<head>
</head>
<body>
    <div>
    @if($status == 'dispatched')
        @if($sendto =='user')
        <p>{{$name}} Your Order Has Been Dispatched Successfully</p>
        <p>Your Order No# {{$order_num}}</p>
        @else
        <p>Order No# {{$order_num}} Update Status Pending To Dispatched.</p>
        @endif
    @else
        @if($sendto =='user')
        <p>{{$name}} Your Order Has Been Dispatched Successfully</p>
        <p>Your Order No# {{$order_num}}</p>
        @else
        <p>Order No# {{$order_num}} Update Status Dispatched To Delivered.</p>
        @endif
    @endif
    </div>
</body>
</html>