<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<!-- saved from url=(0049)http://masr8-26.pospal.cn/m/order?tmpl=1#/default -->
<html >
<head>
<title>我的订单列表</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<link rel="shortcut icon" type="image/x-icon"
	href="https://ali-s.0xiao.cn/3cfood/Public/2018-10-30-1126/static/img/favicon.ico">
	<script src="https://cdn.bootcss.com/jquery-weui/1.2.1/js/jquery-weui.min.js"></script>
	
	<script src="./js/order.js"></script>
<script>
	
</script>
<link rel="stylesheet" type="text/css" href="../allcategory/css/wap.min.css">
<!-- <link rel="stylesheet" type="text/css" href="./css/app.css"> -->
<script
	src="https://ali-s.0xiao.cn/3cfood/Public/2018-10-30-1126/static/js/flexible.min.js"></script>
</head>
<body style="min-height: min-content" data-mobile="1" data-iphone="0" data-weixin="0"
	data-pagename="myorder" currency="元" sign="¥" style="font-size: 12px;">
	<div class="center shop_name_order"
		style="height: 1.2rem; line-height: 1.2rem; font-size: .43rem;">
		<a class="left nou head_back_order" href="javascript:history.back();"
			style="line-height: 1.2rem; width: 1.2rem; height: 1.2rem">&nbsp;</a><a
			class="right nou head_right" href="javascript:;"
			style="line-height: 1.2rem; width: 1.2rem; height: 1.2rem">&nbsp;</a>
		<p class="clof pointer"
			style="line-height: 1.2rem; font-size: .43rem;">我的订单列表</p>
	</div>
	
	<div id="myorderWrap"  style="overflow: hidden;">
	
		<div class="relative" style="/*  height: auto; */ overflow: hidden;padding-bottom: 65px; /* transition-timing-function: cubic-bezier(0.1, 0.57, 0.1, 1); transition-duration: 0ms; transform: translate(0px, 0px) translateZ(0px); */">
			<c:if test="${fn:length(order) <= 0}">
			<div class="yb-myCouponNull" >
				<div class="yb-null_img"></div>
				<div class="yb-null_text">
					<div class="yb-null_title">没有订单</div>
					可以去看看哪些可以买的
				</div>
				<div class="yb-null_buttom">
					<a href="/page/allcategory/process">我要购买</a>
				</div>
			</div>

             </c:if>

			<ul  id="myorder_ul" style="padding-top: 10px" page="1">
				   
				   
				   <c:forEach items="${order}" var ="li" varStatus="status">
					<li>

					<a class="clo6 nou myorder_tit" href="javascript:showdetails('${li.number}')">
					   <span class="fontb">下单时间：<fmt:formatDate value="${li.ordertime}" pattern="yyyy-MM-dd HH:mm:ss" /> </span>
					</a>
					<span class="order_state"> <!--在线支付--> 
					<c:if test="${li.state==2}">
					   <span>待付款</span>
					 </c:if>
					 <c:if test="${li.state==1}">
					   <span>已接单</span>
					 </c:if>
					</span>
					<div id="order_imgbox">
					<div>
					   <c:forEach items="${orderimg}" var ="img" varStatus="status">
					    <c:if test="${li.number==img.number}">
					       <img class="order_pic_img" src="https://ali-img.0xiao.cn/3cfood/food/res/image/t_003c75780c58e31c.png">
					    </c:if>
					</c:forEach>	
					
					
					</div>
					</div>
				
					<div class="clo0 nou myorder_titbott">
					<c:if test="${li.state==2}">
					   <button class="myorder_state_btn_ok" onclick="showOrderPhone('18105264512')">取消订单</button>
					   <button class="myorder_state_btn" onclick="showOrderPhone('18105264512')">马上付款</button>
					   
					   </c:if>
					   <c:if test="${li.state==1}">
					   <button class="myorder_state_btn" onclick="showOrderPhone('18105264512')">再来一单</button>
					   
					   </c:if>
					   
					  <p id="total_money">
							总计：<span class="red">¥ ${li.totalmoney}</span>
						</p>
					</div>
					
				</li>
				</c:forEach>	
					
			</ul>
			<!-- <div id="load_more" class="center clo9" style="">加载更多...</div> -->
		</div>
	</div>
	
	

	
	
	
	
	<div id="order_phone" style="display: none">
		<div class="fullbg" onclick="$(this).parent().hide();"></div>
		<div class="pop font18" id="order_phone_pop" style="top: 25vh">
			<p style="padding: 15px 15px 5px;">商家电话：</p>
		</div>
	</div>
	<script
		src="https://ali-s.0xiao.cn/3cfood/Public/2018-10-30-1126/static/js/page/wap.min.js"></script>
	<script>
		var GROUP = "/wap";
		var APP = "";
	</script>
	<link rel="stylesheet"
		href="https://ali-s.0xiao.cn/3cfood/Public/2018-10-30-1126/static/css/home_iconfont.css">
	<footer>
		<table border="0" cellpadding="0" cellspacing="0" id="foot_menu">
			<tbody>
				<tr>
					<td id="foot_back" width="1" class="spread_theme_color"
						style="display: none"><a id="home"
						class="spread_theme_color  "><div class="iconfont icon-home "
								style="font-size: 25px; padding: 14px 5px 5px;"></div>首页</a></td>
							<td id="foot_goods" width="1" data-name="foot_goods"><a
						href="/page/allcategory/process" ><div
								class="foot_ico foot_goods"></div>商品</a></td>	
								
					<td id="foot_home" width="1" data-name="foot_home"><a
						href="/page/order/orderlist" id="foot_order" class="hover"><div
								class="foot_ico foot_from"></div>订单</a></td>
					<td id="foot_user" width="1" data-name="foot_user"><a
						href="/page/customer/process"><div class="foot_ico foot_user"></div>我的</a></td>
				</tr>
			</tbody>
		</table>
	</footer>
	
</body>
</html>