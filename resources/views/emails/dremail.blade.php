<!DOCTYPE html>
<html>
<head>
</head>
<body>
    <p>Name: {{$name}}</p>
    <p>Email: {{$email}}</p>
    <p>Puppy:
    @if($puppy != "")
    {{$puppy}}
    @else 
    {{$reptile}} @endif</p>
    <p>Breed: {{$breed}}</p>
    <p>Price: {{$price}}</p>
    <p>transaction_id: {{$transaction_id}}</p>
</body>
</html>