<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- saved from url=(0049)http://masr8-26.pospal.cn/m/order?tmpl=1#/default -->
<html lang="zh"
	class="pixel-ratio-2 retina android android-6 android-6-0">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>下单</title>


<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="description"
	content="网上商城，最经济实惠的网上购物商城，不用排队，方便实惠送上门，为您提供愉悦的网上商城购物体验！">
	
	    <link rel="stylesheet" href="https://cdn.bootcss.com/weui/1.1.3/style/weui.min.css">
<link rel="stylesheet" href="https://cdn.bootcss.com/jquery-weui/1.2.1/css/jquery-weui.min.css">
	
<link rel="stylesheet" href="./css/weui.min.css">
<link rel="stylesheet" href="./css/jquery-weui.min.css">
<link rel="stylesheet" href="./css/checkout.min.css">

 <script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.1/js/jquery-weui.min.js"></script>


<link rel="stylesheet" href="./css/page.css">

 <script src="../allcategory/js/wap.min.js"></script>
<script type="text/javascript">
      /*   window.YB_DEFAULTLANG = "zh";
        window.YB_CURRENCYSYMBOL = "¥";
        window.YB_INDUSTRY = '餐饮行业';
        $('document').ready(function () {
            initApp($, window);
        }); */
    </script>

</head>
<body pagename="shopcar" data-res_id="7727" data-mobile="1" data-iphone="0" data-weixin="0" currency="元" sign="¥" >
<input type="hidden" id="goodslist" value="">
<input type="hidden" id="totalamount" value="">
	<div id="checkoutView" data-route="default" class=" yb-page"
		style="display: block;">
		<div class="yb-page-inner">
			<div class="checkoutResult">
				<div class="yb-checkoutModeList">
					<div class="yb-cell weui-cells_checkbox  yb-takeFood-type ">
						<!-- <span class=" yb-edibleWay yb-raido_r1 " data-mode="1" data-modename="配送">
						<label for="s13" class="weui-check__label">
						<input type="radio" class="weui-check" name="checkbox1" id="s13">
						<i class="weui-icon-checked"></i>
						<span class="yb-ridao_text">配送</span>
						</label>
						</span> -->
						<span class=" yb-edibleWay yb-raido_r1 " data-mode="takeout" data-modename="自取">
						<label for="s14" class="weui-check__label">
						<input type="radio" class="weui-check" name="checkbox1" id="s14" checked="true">
						<i class="weui-icon-checked"></i>
						<span class="yb-ridao_text" >自取</span> <div style="margin: 2px 0px 0px 13px;float: right; color: #FF6D5A; " id="timeDiv"></div>
						</label>
						</span>
					</div>
		<!-- 		 <div class="yb-cell arrows  yb-appointment">
						<div class="yb-cell__hd">
							<div class="yb-appointment-icon"></div>
						</div>
						<div class="yb-cell__bd">
							<input type="text" class="" name="" value="" placeholder="立即自取"
								id="OrderAppointmentTime" readonly=""
								data-picker="[object Object]">
						</div>
						<div class="yb-cell__ft"></div>
						<span style="display: none;" id="OrderTime">2019/10/18
							17:00:00</span>
					</div> -->
						<div class="yb-cell arrows  yb-appointment ">
							<div class="yb-cell__hd">
								<div class="yb-appointment-icon"></div>
							</div>
							<div class="yb-cell__bd">
								<input class="" id="nammm" type="text" value="" placeholder="立即自取">
							</div>
							<div class="yb-cell__ft"></div>
						<span style="display: none;" id="OrderTime">now</span>
						</div>

					

				<!-- 	<div class="weui-cells weui-cells_form ">
						<div class="weui-cell ">
							<div class="weui-cell__hd ">
								<label for="name" class="weui-label">请选择时间：</label>
							</div>
							<div class="weui-cell__bd">
								<input class="weui-input" id="name" type="text" value="立即领取">
							</div>
							<div class="yb-cell__ft"></div>
						</div>

					</div>
 -->
				</div>
				<div
					class="weui-cells yb-checkout_hd yb-cells-noLine yb-address_hide"
					id="addressSection">
					<a class="weui-cell weui-cell_access yb-address"
						href="http://masr8-26.pospal.cn/m/order?tmpl=1#/addresses"><div
							class="weui-cell__hd yb-address-ico"></div>
						<div class="weui-cell__bd yb-address-add">
							<div class="yb-address-name">
								<span id="CustomerName">18396861925</span> <span
									id="CustomerPhoneNum">18396861925</span>
							</div>
							<div yb-address-adr="">
								<span id="CustomerAddress">到店自提</span>
							</div>
						</div>
						<div class="weui-cell__ft"></div></a>
				</div>

				<span style="display: none;" id="OtherComment">自取</span>
			</div>

			<div class="weui-cells yb-checkout_bd yb-cells-noLine"
				id="checkoutBody">
				<div id="checkoutItems">
				
				
					<!-- <div class="weui-cell yb-checkout-cont yb-cell-noDowmLine ">
						<div class="weui-cell__hd ">
							<img class="yb-checkout-img"
								src="./image/cbe7dba5-17a5-4f92-8751-000657fc57c9_200x200.png"
								alt="">
						</div>
						<div class="weui-cell__bd">
							<div>
								<span class="yb-checkout-name">卡布奇诺（热/冷）</span><span
									class="yb-checkout-attrs"> [正常杯] [半糖50%] [去冰]</span>
							</div>
							<div class="yb-checkout-Num">x1</div>
						</div>
						<div class="weui-cell__ft">
							<div class="yb-checkout-price">¥0.00</div>
							<del class="yb-checkout-origin-price">¥0.01</del>
						</div>
					</div> -->
					
					
					
					<!-- 
					<div class="weui-cell yb-checkout-cont yb-cell-noDowmLine ">
						<div class="weui-cell__hd ">
							<img class="yb-checkout-img"
								src="./image/2db718f7-4b7f-4f09-80c2-30fac13581f5_200x200.png"
								alt="">
						</div>
						<div class="weui-cell__bd">
							<div>
								<span class="yb-checkout-name">焦糖玛奇朵（热/冷）</span><span
									class="yb-checkout-attrs">[小杯] [全糖100%] [少冰]</span>
							</div>
							<div class="yb-checkout-Num">x1</div>
						</div>
						<div class="weui-cell__ft">
							<div class="yb-checkout-price">¥0.10</div>
						</div>
					</div> -->
				</div>
				<div class="weui-cell yb-checkout-integral" id="YBCustomerPoint"
					style="display: none;">
					<div class="weui-cell__bd "></div>
					<div class="weui-cell__ft">
						<input type="checkbox" id="appliedPoint"
							class="weui-switch yb-checkout-tog">
					</div>
				</div>
			<!-- 	<div id="showCouponSelects"
					class="weui-cell weui-cell_access yb-checkout-list">
					<div class="weui-cell__hd">店铺优惠</div>
					<div class="weui-cell__bd">
						<div class="yb-checkout-discount">
							<span>有 0 张可用券 </span>
						</div>
					</div>
					<div class="weui-cell__ft"></div>
				</div> -->
				<input id="CouponUId" type="hidden" value=""><input
					id="CouponCode" type="hidden" value="">
				<div class="weui-cell yb-checkout-list">
					<div class="weui-cell__hd">备注</div>
					<div class="weui-cell__bd"></div>
					<div class="weui-cell__ft">
						<input type="text" class="yb-checkout-say" id="Comment"
							placeholder="如需备注，请输入(选填)">
					</div>
				</div>
				<div style="display: none;"
					class="weui-cell yb-checkout-list minAmountDiv">
					<div class="weui-cell__hd">起送价</div>
					<div class="weui-cell__bd"></div>
					<div class="weui-cell__ft minAmount">¥NaN</div>
				</div>
				<div class="weui-cell  yb-total ">
					<div class="weui-cell__hd" style="margin-right: 0.4rem">
						共<span class="yb-total-Num totalCount">2</span>件商品
					</div>
					<div class="weui-cell__ft yb-total_ft">
						<div class="yb-total-totalSell">
							小计:<span class="yb-total-price totalSellPrice">¥0.10</span>
						</div>
						<div>
							实付:<span class="yb-total-price totalAmount"
								data-totalamount="0.1">¥0.10</span><span
								class="yb-total-postage"></span>
						</div>
					</div>
				</div>
			</div>

			<div class="yb-paymethod-list yb-actionsheet-list" id="paymethodList">
				<label class="yb-paymethod-item weui-cells_checkbox " for="pay1">
					<div class="yb-paymethod-head">
						<img src="./image/bank_pay@2x.png" alt="">
					</div>
					<div class="yb-paymethod-body">
						<div class="yb-paymethod-name">当面付款</div>

					</div>
					<div class="yb-paymethod-foot  yb-actionsheet-origin">
						<input type="radio" name="paymethodName" data-code="1"
							data-name="当面付款" id="pay1" class="weui-check" checked="checked">
						<i class="weui-icon-checked"></i>
					</div>
				</label> <label class="yb-paymethod-item weui-cells_checkbox " for="pay2">
					<div class="yb-paymethod-head">
						<img src="./image/balance_pay@2x.png" alt="">
					</div>
					<div class="yb-paymethod-body">
						<div class="yb-paymethod-name">
							会员余额<span class="yb-paymethod-cb">（会员余额：0元）</span>
						</div>

					</div>
					<div class="yb-paymethod-foot  yb-actionsheet-origin">
						<input type="radio" name="paymethodName" data-code="2"
							data-name="会员余额" id="pay2" class="weui-check"> <i
							class="weui-icon-checked"></i>
					</div>
				</label>
			</div>

			<div class="yb-checkout_ft">
				<div class="yb-foot-left">
					<span class="yb-foot-totalNum">共 <span class="totalCount">2</span>
						件
					</span> 总计：<span class="yb-foot-price totalAmount" data-totalamount="0.1">¥0.10</span>
				</div>
				<a class="yb-foot-right" href="javascript:plaorder(1)" id="confirmPay">
					确定付款 </a>
			</div>

			<div>
				<div class="weui-mask yb-actionsheet-black yb-page-mask"
					id="actionMask" style="opacity: 0; display: none;"></div>
				<div class=" yb-actionsheet-contant weui-actionsheet"
					id="couponSelects">
					<div
						class="weui-actionsheet__title yb-actionsheet-contant yb-coupons-head">
						<p class="weui-actionsheet__title-text">选择优惠券</p>
						<div class="yb-coupon-addnew">
							<span></span> 兑换优惠券
						</div>
						<d class="yb-coupon-close"></d>
					</div>
					<div
						class=" yb-actionsheet-list weui-actionsheet__menu weui-cells weui-cells_checkbox">
						<div class="yb-couponWarning">
							<img src="./image/coupon_null.png"
								class="yb-searchWarning_img">
							<p class="yb-searchWarning_title">无可用优惠券</p>
						</div>
					</div>
					<div class="weui-actionsheet__action yb-actionsheet-close">
						<div class="weui-actionsheet__cell actionsheetConfirm">确定</div>
					</div>

					<div class="yb-coupon-addinpunt">
						<div class="yb-coupon-useTitle">
							<div class="">兑换优惠券</div>
							<div class="yb-coupon-useCancel">取消</div>
						</div>
						<div class="yb-coupon-usebody">
							<div class="yb-coupon-input">
								<input type="number" placeholder="请输入优惠券码">
							</div>
							<div class="yb-coupon-confirm">兑换</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<div id="addressesView" data-route="addresses" class="yb-page"
		style="display: none;">
		<div class="yb-page-inner">
			<div class="weui-cells yb-checkout_hd yb-cells-noLine">
				<a class="weui-cell weui-cell_access yb-address"
					href="http://masr8-26.pospal.cn/m/order?tmpl=1#/address/0">
					<div class="weui-cell__hd yb-address-ico"></div>
					<div class="weui-cell__bd yb-address-add">
						<div class="yb-address-name">新增收货地址</div>
					</div>
					<div class="weui-cell__ft"></div>
				</a>
			</div>
			<div class="yb-address-content">
				<div id="yb-address-list"
					class="weui-cells yb-address-list weui-cells_checkbox"></div>
			</div>
			<div class="ybShippingRemark"></div>
			<a class="yb-address-ft" href="javascript:" id="confirmAddrSel">
				确定 </a>
		</div>
	</div>


	<div id="addressView" data-route="address" class="yb-page"
		style="display: none;">
		<div class="yb-page-inner">
			<div class="ybShippingRemark"></div>
			<div class="yb-newAddres">
				<div class="yb-newAddres-hd weui-cells ">
					<div class="weui-cell">
						<div class="weui-cell__hd">收货人</div>
						<div class="weui-cell__bd">
							<input id="txtRecipient" required=""
								class="weui-input yb-newAddres-name" type="text"
								placeholder="请填入有效姓名">
						</div>
					</div>
					<div class="weui-cell">
						<div class="weui-cell__hd">联系电话</div>
						<div class="weui-cell__bd">
							<input id="txtPhone" class="weui-input  yb-newAddres-tell"
								type="tel" pattern="\d{11}" placeholder="请填入有效联系号码">
						</div>
					</div>
					<div class="weui-cell weui-cell_access">
						<div class="weui-cell__hd">所在地区</div>
						<div class="weui-cell__bd yb-newAddres-add_hd ">
							<input id="txtDistrict" class="weui-input " type="text"
								placeholder="请选择">
						</div>
						<div class="weui-cell__ft"></div>
					</div>
					<div class="weui-cell ">
						<div class="weui-cell__hd yb-newAddres-add_text">详细地址</div>
						<div class="weui-cell__bd yb-newAddres-add_ft">
							<textarea id="txtAddress1" class="weui-textarea"
								placeholder="请详细填写收货地址" rows="3"></textarea>
						</div>
					</div>
				</div>
				<div class="yb-newAddres-bd weui-cells ">
					<div class="weui-cell yb-checkout-integral">
						<div class="weui-cell__hd">设为默认</div>
						<div class="weui-cell__bd"></div>
						<div class="weui-cell__ft ">
							<input id="chkDefault" type="checkbox"
								class="weui-switch yb-checkout-tog">
						</div>
					</div>
				</div>
				<div class="yb-newAddres-del" id="btnDelete">删除收货地址</div>
				<div class="yb-newAddres-ft" id="btnConfirm">确定</div>
			</div>
		</div>
	</div>

	<div id="addressAutoListview" data-route="addressMap" class="yb-page"
		style="display: none;"></div>

	<div id="recommendView"
		class="weui-popup__container_noClose popup-bottom">
		<div class="weui-popup__overlay_noClose"></div>
		<div class="weui-popup__modal">
			<a href="javascript:;" class="yb-close-popup">&nbsp;</a>
			<div class="yb-page-inner">
				<div class="yb-recommend-wrapper"></div>
				<div class="yb-recommendAttr-wrapper"></div>
			</div>
		</div>
	</div>



	<script type="text/javascript">
 
    $("#nammm").picker({
        title: "请选择时间",
        cols: [
          {
            textAlign: 'center',
            values: [ '今天']
          },
          {
            textAlign: 'center',
            values: ['8点', '9点', '10点', '11点', '12点', '13点', '14点','15点','16点','17点','18点','19点','20点','21点']
          },
          {
              textAlign: 'center',
              values: ['10分', '20分', '30分', '40分', '50分']
            }
        ],
        onChange: function(p, v, dv) {
           $('#OrderTime').html(v);
          },
        
       
      });
    
   
    
    function check(val) {
		if (val < 10) {
			return ("0" + val);
		} 
		else {
			return (val);
		}
	}
	function displayTime() {
		//获取div元素
		var timeDiv=document.getElementById("timeDiv");
		//获取系统当前的年、月、日、小时、分钟、毫秒
		var date = new Date();
		//var year = date.getFullYear();
		//var month = date.getMonth() + 1;
		//var day = date.getDate();
		var hour = date.getHours();
		var minutes = date.getMinutes();
		var second = date.getSeconds();
		var timestr ="当前&nbsp"+check(hour)+ ":" + check(minutes) + ":" + check(second);
		//将系统时间设置到div元素中
		timeDiv.innerHTML = timestr;
	}
	//每隔1秒调用一次displayTime函数
	function start(){
        window.setInterval("displayTime()",1000)//单位是毫秒
        }
	$(document).ready(function(){ 
		　 start();
		}); 
		/*  var $circle = $("#circle")
	      $(document.body).pullToRefresh({
	        distance: 80,
	        onRefresh: function() {
	          setTimeout(function() {
	            $("#time").text(new Date);
	            $(document.body).pullToRefreshDone();
	          }, 2000);
	        },
	        onPull: function (percent) {
	          if (percent > 100) percent = 100
	          $circle.html(percent);
	          $circle.css('background-image', 'linear-gradient(0deg, #3cc51f ' + percent + '%, #3cc51f ' + percent + '%, transparent 50%, transparent 100%)')
	        }
	      }); */
		

</script>
</body>
<script src="./js/order.js"></script>
</html>