<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<html lang="zh" style="font-size: 20px;">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport"
	content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<title>订单详情</title>
<link rel="shortcut icon" href="http://masr8-26.pospal.cn/favicon.ico">
<link href="../customer/css/app.css" rel="stylesheet">

</head>

<body>
	<div id="app">
		<div data-v-8ced8152="" id="orderDetailView" data-route="orderDetail"
			class="yb-page">
			<div data-v-8ced8152="" class="yb-page-inner">
				<div data-v-8ced8152="" class="yb-myOrder yb-myOrder-details">
					<div data-v-8ced8152="">
						<div data-v-8ced8152="" class="yb-order_contian yb-order__hd">
							<div data-v-3cd90192="" data-v-8ced8152="" class="state-nav-con">
								<div data-v-3cd90192="" class="state-nav-item">
									<div data-v-3cd90192="" class="item-point"></div>
									<div data-v-3cd90192="" class="item-state">等待付款</div>
								</div>
								<div data-v-3cd90192="" class="state-nav-item-separate">
									<svg data-v-21c0a497="" data-v-3cd90192="" aria-hidden="true"
										class="svg-icon">
										<use data-v-21c0a497="" xlink:href="#icon-arrow_right"></use></svg>
								</div>
								<div data-v-3cd90192=""
									class="state-nav-item state-nav-item_active">
									<div data-v-3cd90192="" class="item-point"></div>
									<div data-v-3cd90192="" class="item-state">已接单</div>
								</div>
								<!-- <div data-v-3cd90192="" class="state-nav-item-separate">
									<svg data-v-21c0a497="" data-v-3cd90192="" aria-hidden="true"
										class="svg-icon">
										<use data-v-21c0a497="" xlink:href="#icon-arrow_right"></use></svg>
								</div> -->
								<!-- <div data-v-3cd90192="" class="state-nav-item">
									<div data-v-3cd90192="" class="item-point"></div>
									<div data-v-3cd90192="" class="item-state">配送中</div>
								</div> -->
								<div data-v-3cd90192="" class="state-nav-item-separate">
									<svg data-v-21c0a497="" data-v-3cd90192="" aria-hidden="true"
										class="svg-icon">
										<use data-v-21c0a497="" xlink:href="#icon-arrow_right"></use></svg>
								</div>
								<div data-v-3cd90192="" class="state-nav-item">
									<div data-v-3cd90192="" class="item-point"></div>
									<div data-v-3cd90192="" class="item-state">交易完成</div>
								</div>
							</div>
							<div data-v-8ced8152="" class="yb-order_text"></div>
							<!---->
							<div data-v-8ced8152="">
								<!---->
								<!---->
								<!---->
								<div data-v-8ced8152="" class="yb-order_but">
									<a data-v-8ced8152=""
										href="/page/allcategory/process"
										class="yb-order_buy">再次购买</a>
								</div>
							</div>
						</div>
					</div>
					<div data-v-8ced8152="">
						<div data-v-8ced8152="" class="yb-order_contian">
							<div data-v-8ced8152="" class="yb-order_head">
							   <c:forEach items="${orderDetail}" var ="order" varStatus="status">
								<div data-v-8ced8152="" class="yb-order_items">
									<div data-v-8ced8152="" class="yb-order_item">
										<div data-v-8ced8152="" class="yb-order_item_hd">
											<img data-v-8ced8152=""
												src="${order.goodimg}"
												onerror="this.onerror = null;this.src = &#39;//pospalstoreimg.pospal.cn/productImages/0/default_200x200.png&#39;"
												alt="">
										</div>
										<div data-v-8ced8152="" class="yb-order_item_bd">
											<div data-v-8ced8152="" class="yb-order_name">${order.foodname}</div>
											<!-- <div data-v-8ced8152="" class="yb-order_te">
												<span data-v-8ced8152="" style="display: block;">[中杯][热][全糖100%]</span>
											</div> -->
											<!---->
										</div>
										<div data-v-8ced8152="" class="yb-order_item_num"
											style="padding-right: 1rem; color: rgb(102, 102, 102);">x${order.amount}</div>
										<div data-v-8ced8152="" class="yb-order_item_ft">￥${order.foodprice}
										</div>
									</div>
								</div>
								
									</c:forEach>	
								
								<!---->
								<!---->
							</div>
							<div data-v-8ced8152="" class="yb-order_foot">
								共<span>${order.totalcount}</span>件商品&nbsp;&nbsp;总计:<span>¥${order.totalmoney}</span>元
								<div class="yb-order_payNum">
									实付:<span>¥${order.totalmoney}</span>
								</div>
							</div>
						</div>
					</div>
					<div data-v-8ced8152="" class="yb-order_contian">
						<div data-v-8ced8152="" class="yb-order_notes">
							<div data-v-8ced8152="" class="yb-order_notes_itme clearfix">
								<div data-v-8ced8152="" class="yb-order_notes_title">买家备注</div>
								<div data-v-8ced8152="" class="yb-order_notes_text">${order.remark}</div>
							</div>
							<!---->
							<!-- <div data-v-8ced8152="" class="yb-order_notes_itme clearfix">
								<div data-v-8ced8152="" class="yb-order_notes_title">收货地址</div>
								<div data-v-8ced8152="" class="yb-order_notes_text">
									上海市黄浦区 人民大道200号</div>
							</div> -->
							<!---->
							<div data-v-8ced8152="" class="yb-order_notes_itme clearfix">
								<div data-v-8ced8152="" class="yb-order_notes_title">订单编号</div>
								 <div data-v-8ced8152="" class="yb-order_notes_text">${order.number}</div> 
							</div>
							<div data-v-8ced8152="" class="yb-order_notes_itme clearfix">
								<div data-v-8ced8152="" class="yb-order_notes_title">订单时间</div>
								<div data-v-8ced8152="" class="yb-order_notes_text">
								<fmt:formatDate value="${order.ordertime}" pattern="yyyy-MM-dd HH:mm:ss" />
								</div>
							</div>
							<div data-v-8ced8152="" class="yb-order_notes_itme clearfix">
								<div data-v-8ced8152="" class="yb-order_notes_title">支付方式</div>
								<div data-v-8ced8152="" class="yb-order_notes_text">货到付款</div>
							</div>
							<div data-v-8ced8152="" class="yb-order_notes_itme clearfix">
								<div data-v-8ced8152="" class="yb-order_notes_title">消费门店</div>
								<div data-v-8ced8152="" class="yb-order_notes_text">杰悠披萨旗舰店</div>
							</div>
							<!---->
						</div>
						<div data-v-8ced8152="" class="yb-order_call">
							<div data-v-8ced8152="">售后问题</div>
							<div data-v-8ced8152="">
								<span data-v-8ced8152=""></span> <a data-v-8ced8152=""
									href="tel:18396861925">联系商家</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div data-v-8ced8152="" class="qrcode-cover" style="display: none;">
				<div data-v-8ced8152="" class="qrcode-box">
					<div data-v-8ced8152="" id="qrcode"></div>
					<p data-v-8ced8152="">单击可以退出</p>
				</div>
			</div>
			<div data-v-5894f444="" data-v-8ced8152=""
				class="mint-popup mint-popup-bottom"
				style="display: none; width: 100%;">
				<div data-v-5894f444="" class="paymethod-box">
					<div data-v-5894f444="" class="paymethod-header">
						<div data-v-5894f444="">确认支付</div>
						<div data-v-5894f444="" class="paymethod-total">
							<span data-v-5894f444="" class="totalAmount">￥175.00</span>
						</div>
					</div>
					<div data-v-5894f444="" id="paymethodList"
						class="paymethod-list actionsheet-list">
						<div data-v-5894f444="" class="paymethod-item weui-cells_checkbox balance-item">
							<div data-v-5894f444="" class="paymethod-head">
								<img data-v-5894f444=""src="data:image/png;base64,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"alt="">
							</div>
							<div data-v-5894f444="" class="paymethod-body">
								<div data-v-5894f444="" class="paymethod-name">
									会员余额 <span data-v-5894f444="">（余额0元）</span>
								</div>
								<div data-v-5894f444="" class="paymethod-tip">
									<span data-v-5894f444="">*</span>
									(订单已提交，如要享受会员折扣，请取消重新下单首选余额支付)
								</div>
							</div>
							<div data-v-5894f444="" class="paymethod-foot  actionsheet-origin">
								<span data-v-5894f444="" class=""></span>
							</div>
						</div>
						
						
						<div data-v-5894f444="" class="paymethod-item weui-cells_checkbox balance-item">
							<div data-v-5894f444="" class="paymethod-head">
								<img data-v-5894f444=""src="data:image/png;base64,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"alt="">
							</div>
							<div data-v-5894f444="" class="paymethod-body">
								<div data-v-5894f444="" class="paymethod-name">
									会员余额 <span data-v-5894f444="">（余额0元）</span>
								</div>
								<div data-v-5894f444="" class="paymethod-tip">
									<span data-v-5894f444="">*</span>
									(订单已提交，如要享受会员折扣，请取消重新下单首选余额支付)
								</div>
							</div>
							<div data-v-5894f444="" class="paymethod-foot  actionsheet-origin">
								<span data-v-5894f444="" class=""></span>
							</div>
						</div>
					</div>
					<div data-v-5894f444="" class="paymethod-footer">
						<div data-v-5894f444="" id="payConfirmPay" class="g-bgcolor">确定</div>
					</div>
				</div>
			</div>
		</div>
	</div>





	<div class="mint-indicator mint-indicator-enter-to"
		style="display: none;">
		<div class="mint-indicator-wrapper" style="padding: 15px;">
			<span class="mint-indicator-spin"><div
					class="mint-spinner-snake"
					style="border-top-color: rgb(204, 204, 204); border-left-color: rgb(204, 204, 204); border-bottom-color: rgb(204, 204, 204); height: 32px; width: 32px;"></div></span>
			<span class="mint-indicator-text" style="display: none;"></span>
		</div>
		<div class="mint-indicator-mask"></div>
	</div>
</body>
</html>