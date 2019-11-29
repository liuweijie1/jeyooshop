<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="zh">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport"
	content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<title>余额充值</title>
<link rel="shortcut icon" href="http://wxpay.pospal.cn/favicon.ico">
<link href="./css/app.css" rel="stylesheet">

</head>

<body>
	
	<div id="app">
		<div data-v-0aa61ae0="" class="yb-page">
			<div data-v-0aa61ae0="" class="yb-page-inner">
				<div data-v-0aa61ae0="" class="new-recharges">
					<div data-v-0aa61ae0="" class="recharges-header">
						<a data-v-0aa61ae0=""
							href="/page/customer/record"
							class="header-con"><div data-v-0aa61ae0=""
								class="header-balance">
								<div data-v-0aa61ae0="" class="header-balance-tip">会员余额
									(元)</div>
								<div data-v-0aa61ae0="" class="header-balance-num">0.10</div>
							</div>
							<div data-v-0aa61ae0="" class="header-navigate">交易明细</div></a> 
					</div>
					<div data-v-0aa61ae0="" class="recharges-con">
						<div data-v-0aa61ae0="" class="recharges-tab">
							<div data-v-0aa61ae0=""
								class="rechargestab-item rechargestab-item-active">充值活动：充值满100及以上金额，赠送全场任意披萨一份！奶茶一杯！另立赠相应余额！！</div>
							<!-- <div data-v-0aa61ae0="" class="rechargestab-item">自定义金额充值</div> -->
						</div>
						<div data-v-0aa61ae0="" class="recharges-tabcon">
							<div data-v-0aa61ae0="" class="fixed-con">
								<div data-v-0aa61ae0="" class="fixed-tip">请选择充值金额</div>
								<div data-v-0aa61ae0="" class="fixed-list">
									<div data-v-0aa61ae0="" class="fixed-item borde-red" onclick="Amoptions(this)">
									    <input type="hidden" value='100'>
										<div data-v-0aa61ae0="" class="fixed-num">100元</div>
										<div data-v-0aa61ae0="" class="fixed-gift">立赠0元余额</div>
										<!---->
									</div>
									<div data-v-0aa61ae0="" class="fixed-item" onclick="Amoptions(this)">
									    <input type="hidden" value='200'>
										<div data-v-0aa61ae0="" class="fixed-num">200元</div>
										<div data-v-0aa61ae0="" class="fixed-gift">立赠15元余额</div>
										<!---->
									</div>
									<div data-v-0aa61ae0="" class="fixed-item"  onclick="Amoptions(this)">
									    <input type="hidden" value='300'>
										<div data-v-0aa61ae0="" class="fixed-num">300元</div>
										<div data-v-0aa61ae0="" class="fixed-gift">立赠30元余额</div>
										<!---->
									</div>
									<div data-v-0aa61ae0="" class="fixed-item" onclick="Amoptions(this)">
									    <input type="hidden" value='500'>
										<div data-v-0aa61ae0="" class="fixed-num">500元</div>
										<div data-v-0aa61ae0="" class="fixed-gift">立赠50元余额</div>
										<!---->
									</div>
									<div data-v-0aa61ae0="" class="fixed-item" onclick="Amoptions(this)">
									    <input type="hidden" value='1000'>
										<div data-v-0aa61ae0="" class="fixed-num">1000元</div>
										<div data-v-0aa61ae0="" class="fixed-gift">立赠120元余额</div>
										<!---->
									</div>
									<div data-v-0aa61ae0="" class="fixed-item"
										style="visibility: hidden;">
										<div data-v-0aa61ae0="" class="fixed-num">元</div>
										<!---->
										<!---->
									</div>
								</div>
							</div>
							<!---->
						</div>
					</div>
				</div>
				
				
				<div data-v-201b00fc="" class="new-couponBtn" onclick="recharge(obj)">立即支付 | ¥100</div>
			</div>
		</div>
	</div>




	<div class="mint-msgbox-wrapper"
		style="position: absolute; z-index: 2009;">
		<div class="mint-msgbox" style="display: none;">
			<div class="mint-msgbox-header">
				<div class="mint-msgbox-title">提示</div>
			</div>
			<div class="mint-msgbox-content">
				<div class="mint-msgbox-message">支付方式配置错误</div>
				<div class="mint-msgbox-input" style="display: none;">
					<input placeholder="" type="text">
					<div class="mint-msgbox-errormsg" style="visibility: hidden;"></div>
				</div>
			</div>
			<div class="mint-msgbox-btns">
				<button class="mint-msgbox-btn mint-msgbox-cancel "
					style="display: none;">取消</button>
				<button class="mint-msgbox-btn mint-msgbox-confirm ">确定</button>
			</div>
		</div>
	</div>
	<div class="mint-indicator" style="display: none;">
		<div class="mint-indicator-wrapper" style="padding: 15px;">
			<span class="mint-indicator-spin"><div
					class="mint-spinner-snake"
					style="border-top-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-color: rgb(204, 204, 204); height: 32px; width: 32px;"></div></span>
			<span class="mint-indicator-text" style="display: none;"></span>
		</div>
		<div class="mint-indicator-mask"></div>
	</div>
</body>
 <script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
  <script src="./js/member.js"></script>
</html>