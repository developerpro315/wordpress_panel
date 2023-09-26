@extends('layouts.front.app')

@section('title', 'Form Inquiry')

@section('content')
<style>
.checkout-box {
    display: block;
    margin: 0 0 50px;
    background: #fff;
    border: 1px solid #f3f3f3;
    border-radius: 6px;
    box-shadow: 0 15px 30px 0 rgba(0,0,0,.1);
}

.checkout-form.form {
    width: 70%;
    margin: -115px auto 50px;
}

.checkout-cart__items {
    display: block;
    padding: 30px 50px;
    background: #fcfcfc;
    border-bottom: 1px solid #ececec;
}
.checkout-cart-item:last-child {
    border: 0;
}
.checkout-cart-item {
    display: block;
    padding: 20px 0;
    border-bottom: 1px solid #f3f3f3;
}
.checkout-cart-item__photo--gold {
    background-image: url(https://demolinksphp8.com/ezrsgold/v1/wp-content/uploads/2023/09/products-sprite.png);
    background-position: -65px 0;
    width: 60px;
    height: 60px;
}
.checkout-cart-item__photo {
    display: block;
    margin: 0 30px 0 0;
    float: left;
    box-shadow: 0 5px 20px 0 rgba(0,0,0,.1);
}
.checkout-cart-item__details {
    display: block;
}
.checkout-cart-item__title {
    display: block;
    font-size: 18px;
    line-height: 30px;
    font-weight: 500;
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
    color:#2e2e2e;
}
.checkout-cart-item__qty {
    font-size: 18px;
    line-height: 30px;
    vertical-align: top;
    color:#2e2e2e;
}
.checkout-cart-item__price {
    font-size: 18px;
    line-height: 30px;
    vertical-align: top;
    color:#2e2e2e;
}
.checkout-cart-item__total {
    float: right;
    font-size: 20px;
    line-height: 30px;
    font-weight: 500;
    vertical-align: top;
    color:#2e2e2e;
}
.checkout-cart__bottom {
    padding: 50px;
}
.checkout-cart-totals {
    position: relative;
    left: calc(119.9% * 1/2 - 10px + 20px);
    top: -35px;
}
.checkout-cart-total {
    display: flex;
    margin: 0 0 10px;
    align-items: center;
    justify-content: space-between;
}
.checkout-cart-total__label {
    float: left;
    font-size: 18px;
    line-height: 30px;
    color: #000;
}
.checkout-cart-total__value {
    float: right;
    font-size: 18px;
    line-height: 30px;
    font-weight: 500;
    color: #000;
}
.checkout-cart-total--final .checkout-cart-total__label {
    font-size: 20px;
    line-height: 32px;
    font-weight: 600;
    color: #000;
    float: left;
}
.checkout-cart-total--final .checkout-cart-total__value {
    font-size: 24px;
    line-height: 32px;
    color: #20bf55;
    float: right;
}
.checkout-cart-coupon, .checkout-cart-totals {
    width: calc(99.9% * 1/2 - 12.5px);
}
.checkout-cart-totals {
    width: calc(79.9% * 1/2 - 15.5px);
}
.checkout-cart-totals:nth-child(1n) {
    float: left;
    margin-right: 0;
    clear: none;
}


.checkout-box-section {
    position: relative;
    display: block;
    padding: 50px;
    border-bottom: 1px solid #ececec;
}
.checkout-box-section__top {
    display: block;
    margin: 0 0 25px;
}
.checkout-box-section__title {
    display: block;
    margin: 0;
    color: #0b4f6c;
    font-size: 25px;
    line-height: 35px;
    font-weight: 500;
}
.form-row {
    margin: 0 0 25px;
    display: block;
}

 .checkout--sellable .checkout-box-section--details .form-group--game-username:nth-child(1n) {
    float: left;
    margin-right: 25px;
    clear: none;
}

.checkout-box-section__content .form-row {
    display: flex;
    align-items: center;
    gap: 40px;
}

.checkout-box-section__content .form-group label {
    display: block;
    margin: 0 0 15px;
    color: #595959;
    font-size: 18px;
    line-height: 22px;
    font-weight: 400;
}

.checkout-box-section__content .form-group input {
    border: 1px solid #000;
    height: 45px;
    color: #000;
   
}

.form-group.form-group--paypal-account-email input {
    width: 100%;
}

.checkout-box-section__content .form-group {
    width: 100%;
}

.form-group--payment-method select {
    border: 1px solid #000;
    appearance: auto;
    color: #000;
    width: 100%;
    height: 50px;
}

.form-group--payment-method select option {
    color: #000;
}

.checkout-action-buttons__right:nth-child(1n) {
    float: left;
    margin-right: 25px;
    clear: none;
}

.checkout-action-buttons__right {
    width: calc(99.9% * 1/2 - 12.5px);
    position: relative;
    left: calc(59.9% * 1/2 - 12.5px + 25px);
}
.checkout-action__go-back {
    display: inline-block;
    width: auto;
    background: 0 0;
    border: 0;
    border-radius: 6px;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    padding: 8px 0;
    font-size: 16px;
    color: #adadad;
    text-align: center;
    margin: 13px 0;
}

.checkout-action-buttons {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 50px;
}

.checkout-action-buttons .checkout-action-buttons__left a {
    color: #000;
    font-weight: 600;
}

.checkout-action-buttons .checkout-action-buttons__right button {
    color: #fff;
    border-radius: 5px;
    background: linear-gradient(180deg,#20bf55 0,#1dc854);
    color: #fff;
    padding: 10px 20px;
    font-weight: 600;
}
.form-group--game-username input {
    width: 100%;
}

.form-group.form-group--email input {
    width: 100%;
}

.form-group--newsletter input {
    float: left;
    margin-right: 20px;
}

</style>
<form action="{{route('forminquiry')}}" method="POST" class="">
<div class="checkoutss">
<div class="checkout-box">
        <div class="checkout-box-section checkout-box-section--details">
            <div class="checkout-box-section__inner">
                <div class="checkout-box-section__top">
                    <h2 class="checkout-box-section__title">Personal information</h2>
                </div>
                <input type="text" name="price" id="price" hidden>
                <input type="text" name="currency" id="currency" hidden>
                <input type="text" name="qty" id="qty" hidden>
                <input type="text" name="staticpri" id="staticpri" hidden>
                <input type="text" name="title" id="title" hidden>
                <div class="checkout-box-section__content">
                    <div class="form-row">
                        <div class="form-group form-group--game-username"><label for="username">Runescape username</label> <input type="text" name="username" id="username">
                        </div>
                        <div class="form-group form-group--email"><label for="email">Email address</label> <input type="text" name="email" id="email">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group form-group--newsletter"><label for="newsletter"><input type="checkbox" id="newsletter" name="newsletter">
I agree to receive EzRsGold.com newsletter with <strong>special offers</strong> &amp; <strong>gold discount codes</strong> and know that I can easily unsubscribe at any time.
</label></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="checkout-box-section checkout-box-section--payment">
            <div class="checkout-box-section__inner">
                <div class="checkout-box-section__top">
                    <h2 class="checkout-box-section__title">Payout details</h2>
                </div>
                <div class="checkout-box-section__content">
                    <div class="form-row">
                        <div class="form-group form-group--payment-method"><label for="payment_method">Choose payment method</label> <select name="payment_method" id="payment_meth"><option value="1">PayPal</option><option value="3">Bitcoin</option></select></div>
                    </div>
                    <div class="form-row">
                        <div class="form-group form-group--paypal-account-email"><label for="paypal_account_email">PayPal account email</label> <input type="text" name="paypal_account_email" id="paypal_account_email">
                        </div>
                    </div>
                    <!-- <div class="form-row">
                        <div class="form-group form-group--paypal-account-email">
                            <label for="paypal_account_email">PayPal account email</label>
                            <button type="submit">Confirm Order</button>
                        </div>
                    </div> -->
                </div>
            </div>
        </div>
    </div>
    </div>
    <div class="checkout-action checkout-box">
        <div class="checkout-action-buttons">
           
            <div class="checkout-action-buttons__left"><a href="https://www.ezrsgold.com/sell-rs-gold" class="checkout-action__go-back"><i class="btn-icon"></i> Continue shopping
</a></div>
 <div class="checkout-action-buttons__right"><button type="submit" class="nocolr">
            Confirm order <i class="btn-icon"></i></button></div>
        </div>
    </div>
    </form>
@endsection
@section('js')

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
    @if(Session::has('message'))
    window.top.location.href = '{{ session('message') }}';
    @endif
</script>
<script>
    var Qty = '{{$request->qty}}';
    var Currency = '{{$request->currency}}';
    var Price = '{{$request->price}}';
    var Title = '{{$request->title}}';
    var currency = (Currency)?Currency:'';
    var price = (Price)?Price:'';
    var qty = (Qty)?Qty:'';
	var staticpri =(price/qty);
	var title = (Title)?Title:'';
    $('#price').val(price);
    $('#currency').val(currency);
    $('#qty').val(qty);
    $('#staticpri').val(staticpri);
    $('#title').val(title);
    $('#payment_meth').val((currency == 'paypal')?1:(currency == 'bitcoin')?3:'');
</script>
@endsection