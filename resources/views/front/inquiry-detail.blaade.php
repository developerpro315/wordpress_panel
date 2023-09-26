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

.layout-head .layout-head__inner {
    padding: 75px 0;
}
.layout-head .layout-head__contents {
    display: block;
    width: 100%;
}
.order-successful-icon {
    display: block;
    width: 205px;
    margin: 0 auto 25px;
}

.layout-head__title {
    display: block;
    margin: 0 0 10px;
    font-size: 37px;
    line-height: 47px;
    font-weight: 500;
    color: #333;
    text-align: center;
    text-shadow: 0 5px 10px rgba(0,0,0,.6);
}
.layout-head__subtitle, .layout-head__title {
    color: #fff;
    text-align: center;
    text-shadow: 0 5px 10px rgba(0,0,0,.6);
}
.layout-head__subtitle {
    display: block;
    margin: 0;
    font-size: 22px;
    line-height: 32px;
    font-weight: 400;
}
.order-support-contact {
    display: block;
    margin: 0;
    padding: 50px 0 0;
    text-align: center;
}
.order-support-contact__button:hover {
    box-shadow: 0 3px 10px 0 rgba(0,0,0,.1), 0 2px 20px 0 rgba(255,215,0,.5), inset 0 1px 2px rgba(255,215,0,.075), 0 0 0 3px rgba(255,215,0,.3);
    background: #ffd800;
    background: linear-gradient(180deg,gold 0,gold);
    color: #111;
}

.order-support-contact__button {
    display: inline-block;
    width: auto;
    border: 0 solid #d6ad00;
    border-radius: 6px;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    padding: 20px 29px;
    font-size: 20px;
    line-height: 22px;
    border-width: 1px;
    color: #111;
    background: #ffd800;
    background: linear-gradient(180deg,gold 0,#ffce00);
    box-shadow: 0 3px 10px 0 rgba(0,0,0,.1), 0 2px 20px 0 rgba(255,215,0,.3);
    text-decoration: none;
    font-family: Poppins,sans-serif;
    outline: 0;
    font-weight: 600;
    text-decoration: none;
    transition: background .25s ease-out,color .25s ease-out,border .25s ease-out,box-shadow .25s ease-out;
    text-align: center;
}

.order-details {
    margin: 65px 0 50px;
    padding: 0;
    display: block;
    background: #fff;
    border: 1px solid #f3f3f3;
    border-radius: 6px;
    box-shadow: 0 15px 30px 0 rgba(0,0,0,.1);
    overflow: hidden;
}
.order-details__rows {
    display: block;
    padding: 35px 50px;
}
.order-details-row {
    display: block;
    padding: 15px 0;
    border-bottom: 1px solid #f3f3f3;
}
.order-details-row__label {
    display: block;
    float: left;
    color: #595959;
    font-size: 18px;
    line-height: 22px;
    font-weight: 400;
}
.order-details-row__value {
    display: block;
    float: right;
    color: #595959;
    font-size: 20px;
    line-height: 22px;
    font-weight: 500;
}
.order-details-row {
    display: block;
    padding: 13px 0 40px;
    border-bottom: 1px solid #f3f3f3;
}

body {
    background: transparent;
}
</style>

<div class="layout-head__inner"><div class="layout-head__contents"><div class="order-successful-icon"><img src="https://www.ezrsgold.com/themes/ezrsgold/assets/img/success-icon.png" alt=""></div> <h1 class="layout-head__title">Order #{{$data->uid}} successful</h1> <span class="layout-head__subtitle">
Please contact our customer support <br>
to complete your order.
</span> <div class="order-support-contact"><a href="javascript:void(main.sellableorder.contactsupport('e5bce4b62e15aa0c9f93dab903b9fcbd'))" class="order-support-contact__button">
Start chat with support <i class="btn-icon"></i></a></div></div></div>

<div class="order-details order-box"><div class="order-details__rows"><div class="order-details-row"><div class="order-details-row__label">
Order ID
</div> <div class="order-details-row__value">
{{$data->uid}}
</div></div> <div class="order-details-row"><div class="order-details-row__label">
Order date
</div> <div class="order-details-row__value">
{{date_format($data->created_at,"Y-m-d")}}
</div></div> <div class="order-details-row"><div class="order-details-row__label">
Runescape username
</div> <div class="order-details-row__value">
{{$data->name}}
</div></div> <div class="order-details-row"><div class="order-details-row__label">
Email address
</div> <div class="order-details-row__value">
{{$data->email}}
</div></div> <div class="order-details-row"><div class="order-details-row__label">
Payment method
</div> <div class="order-details-row__value">
{{$data->currency}}
</div></div> <div class="order-details-row"><div class="order-details-row__label">
Payout details
</div> <div class="order-details-row__value">
{{$data->cur_email}}
</div></div></div></div>


<div class="checkout-cart checkout-box">
        <div class="checkout-cart__items">
            <div class="checkout-cart-item">
                <div class="checkout-cart-item__photo checkout-cart-item__photo--gold"></div>
                <div class="checkout-cart-item__details">
                    <div class="checkout-cart-item__title">{{$data->package}}</div> <span class="checkout-cart-item__qty"></span> {{$data->qty}} x<span class="checkout-cart-item__price"></span> {{number_format($data->unitprice,'2')}}<span class="checkout-cart-item__total"></span></div>
            </div>
        </div>
        <div class="checkout-cart__bottom">
            <div class="checkout-cart-totals">
                <div class="checkout-cart-total">
                    <div class="checkout-cart-total__label">Subtotal</div>
                    <div class="checkout-cart-total__value">{{$data->price}}</div>
                </div>
                <div class="checkout-cart-total checkout-cart-total--final">
                    <div class="checkout-cart-total__label">Order total</div>
                    <div class="checkout-cart-total__value">{{$data->price}}</div>
                </div>
            </div>
        </div>
    </div>

@endsection
@section('js')
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<script>
    var dat = '{{$data}}';
    const decryptedText = encodeURIComponent(dat);
    const Data = decryptedText.split(",");
    var currency = (Data[2])?Data[2]:'';
    var price = (Data[1])?Data[1]:'';
    var qty = (Data[0])?Data[0]:'';
	var staticpri =(price/qty);
	var title = (Data[3])?Data[3]:'';
    $('#price').val(price);
    $('#currency').val(currency);
    $('#qty').val(qty);
    $('#staticpri').val(staticpri);
    $('#title').val(title);
    $('#payment_meth').val((currency == 'paypal')?1:(currency == 'bitcoin')?3:'');
</script>
@endsection