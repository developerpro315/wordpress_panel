<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    @include('layouts.front.includes.links')
  <title>@yield('title') | {{ config('app.name') }}</title>
</head>
<body>
  @include('layouts.front.includes.templates.header')
  @yield('content')
  @include('layouts.front.includes.templates.footer')
  @include('layouts.front.includes.scripts')
</body>
</html>

