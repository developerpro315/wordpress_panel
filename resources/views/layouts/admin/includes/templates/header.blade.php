<header class="topbar" style="background: #fff;">
    

    <div Class="container">
@if(auth()->user()->hasRole('admin'))
@php
$role = "admin"
@endphp
@elseif(auth()->user()->hasRole('user'))
@php
$role = "User"
@endphp
@endif
        <nav class="navbar top-navbar navbar-expand-md navbar-light">
            <div class="navbar-header">
                <a class="navbar-brand" href="{{url('panel/'.$role.'/dashboard')}}"><img src="{{asset(getImage())}}" style=" width: 120px; height:120px;  " alt="{{env('APP_NAME')}}" class="dark-logo"/></a>
            </div>
            <div class="top-bar-main">
                <div class="float-left">
                    <ul class="navbar-nav">
                        <li class="nav-item ">
                            <a class="nav-link navbar-toggler sidebartoggler waves-effect waves-dark float-right" href="javascript:void(0)"><span class="navbar-toggler-icon"></span></a>
                        </li>
                    </ul>
                </div>
                
                @if(auth()->check())
                <div class="float-right pr-3">
                    <ul class="navbar-nav my-lg-0 float-right">
                        <li class="nav-item dropdown u-pro">
                            <a class="nav-link dropdown-toggle waves-effect waves-dark profile-pic" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                @if(auth()->check())
                                @if(empty(auth()->user()->profile->pic))
                                <img src="{{asset('storage/uploads/users/no_avatar.jpg')}}" alt="user-img" >

                                @else
                                <img src="{{asset('storage/uploads/users/'.auth()->user()->profile->pic)}}" alt="user-img">
                                @endif
                                @endif
                                <span class="circle-status"></span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right animated fadeIn">
                                <ul class="dropdown-user">
                                    <li class="text-center">
                                        <div class="dw-user-box">
                                            <div class="u-img">
                                                @if(empty(auth()->user()->profile->pic))
                                                <img src="{{asset('storage/uploads/users/18BUxNzxmG.jpg')}}"
                                                     alt="user-img"
                                                >
                                                @else
                                                <img src="{{asset('storage/uploads/users/'.auth()->user()->profile->pic)}}" alt="user-img">
                                                @endif

                                                <div class="clearfix"></div>
                                                <div class="u-text">
                                                    <h4>{{auth()->user()->first_name}}</h4>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    @auth
                                    @if(auth()->user()->hasRole('admin'))
                                    <li><a href="{{url('panel/admin/account/profile')}}"><i class="fas fa-user mr-1"></i> My Profile</a>
                                    </li>
                                    @elseif(auth()->user()->hasRole('user'))
                                    <li><a href="{{url('panel/User/account/profile')}}"><i class="fas fa-user mr-1"></i> My Profile</a>
                                    </li>
                                    @endif
                                    @endauth
                                    <li role="separator" class="divider"></li>

                                    <li>
                                        <a href="{{ route('logout') }}">
                                            <i class="fas fa-sign-in-alt mr-1"></i>Logout
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div>
               
                @else
                <div class="float-right pr-3">
                    <ul class="navbar-nav my-lg-0 float-right">
                        <li class="nav-item">
                            <a class="nav-link " href="{{url('login')}}"><i class="fa fa-user"></i> Login</a>
                        </li>
                    </ul>
                </div>
                @endif
                <div class="clearfix"></div>
            </div>
        </nav>
    </div>
</header>


