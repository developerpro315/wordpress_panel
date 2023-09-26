<style type="text/css">
span.counts {
    background: #1c3e7f;
    color: #fff;
    margin-left: 8px;
    padding: 1px 8px;
    border-radius: 7px;
    float: right;
}
</style>
<?php
// $Terms_count = App\model\CMS::where('page_name', 'Terms & Condition')->count();
?>
<aside class="left-sidebar">
    <ul class="nav-bar  @if (!auth()->check()) d-none @endif navbar-inverse hidden-xs-down">
    </ul>
    <div class="scroll-sidebar">
        @if (auth()->check())
        <nav class="sidebar-nav ">
            <ul id="sidebarnav">
                @if (auth()->user()->hasRole('admin'))
                <li class="clearfix"></li>
                <li><a href="{{ url('panel/admin/dashboard') }}" class=""><i class="fa fa-tachometer" aria-hidden="true"></i>Dashboard</a></li>

                <hr>
                <li><a href="{{ url('panel/admin/inquiry') }}"><i class="fa fa-first-order" aria-hidden="true"></i><span
                class="hide-menu">Form
                Inquiries</span></a></li>
                <hr>
                <li><a href="{{ url('/panel/admin/account/profile') }}"><i class="fa fa-cog"></i><span
                            class="hide-menu">Account Settings</span></a>
                </li>
                @endif


                @if (auth()->user()->hasRole('user'))
                <hr>
                <li><a href="{{ url('/') }}" target="_blank" class="hide-menu">Go Back to Website</a></li>
                <hr>
                <li><a href="{{ url('/panel/User/account/profile') }}"><i class="fa fa-cog"></i><span
                            class="hide-menu">Account Settings</span></a>
                </li>
                @endif
            </ul>
        </nav>
        @endif
    </div>
</aside>