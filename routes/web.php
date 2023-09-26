<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

//mail-test
// Route::get('/mail-test', 'FrontController@mailTest')->name('mail-test');

// For Site
Route::get('/', 'FrontController@index')->name('index');
Route::any('/form-inquiry/{data?}', 'FrontController@forminquiry')->name('forminquiry');
Route::get('/form-inquiry-detail/{data?}', 'FrontController@forminquirydeatil')->name('forminquirydetail');
Route::get('logout','Auth\LoginController@logout')->name('logout');

// paypal 



// For Panel
Auth::routes();
Route::group(['prefix'=>'panel'], function(){
    Route::group(['middleware' => ['auth', 'roles'],'roles' => 'admin','prefix'=>'admin'],function (){
    Route::get('/dashboard','Admin\HomeController@dashboard');
    Route::any('config','Admin\ConfigController@update')->name('config_settings_update');
    Route::any('favicon','Admin\HomeController@faviconUpload')->name('favicon');
    Route::any('logo', 'Admin\HomeController@updateLogo')->name('StoreWebLogo');
    Route::any('account/profile','Admin\HomeController@profile')->name('profile');
    Route::resource('banner', 'Admin\BannerController');
    Route::resource('inquiry','Admin\InquiryController');
    Route::get('/users','Admin\HomeController@userDisplay');
    Route::get('/user-edit/{id}','Admin\HomeController@UserEdit');
    Route::post('/user/delete/{id}','Admin\HomeController@UserDelete');
    Route::post('/notification','Buyer\ApplyjobController@notification')->name('notification');
    Route::put('/user-update/{id}','Admin\HomeController@UserUpdate');
    Route::get('/user/{id}','Admin\HomeController@ShowUser');
    Route::resource('order', 'Admin\OrderController');
    Route::any('deposit-status/{id}','Admin\DepositController@status');
});
Route::group(['middleware' => ['auth', 'roles'],'roles' => 'user','prefix'=>'User'],function (){
    Route::get('/dashboard','User\HomeController@dashboard');
    // Route::resource('booking','Admin\BookingController');
    // Route::resource('orders', 'User\OrderController');
    Route::any('account/profile','User\HomeController@profile')->name('profile');
});



});
