<!DOCTYPE html>
<html>
<head>
</head>
<body>
    @if($type=='admin')
    <h3>Dear Admin,</h3>
    <p>New User Registered</p>
    <p>Name: {{$name}}</p>
    <p>Email: {{$email}}</p>
    @else
    <h3>Dear {{$name}},</h3>
    <p>Your Email Has Been Registered</p>
    <p>Your Login Email is {{$email}}</p>
    <p>Thank you {{$name}}</p>
    @endif
</body>
</html>