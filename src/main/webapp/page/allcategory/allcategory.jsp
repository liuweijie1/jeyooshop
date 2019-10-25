<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html class="pixel-ratio-2 retina android android-6 android-6-0">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>全部分类</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="description" content="网上商城，最经济实惠的网上购物商城，不用排队，方便实惠送上门，为您提供愉悦的网上商城购物体验！">



    <meta charset="utf-8">
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"> -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Expires" content="0">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-control" content="no-cache">
    <meta http-equiv="Cache" content="no-cache">

<link rel="stylesheet" href="./css/weui.min.css">
<link rel="stylesheet" href="./css/jquery-weui.min.css">
<link rel="stylesheet" href="./css/main.v14.min.css">
<script src="./js/jweixin-1.2.0.js"></script>
<script src="./js/zepto.min.js"></script>

<link rel="stylesheet" href="./css/page.css">
<script type="text/javascript">
         window.DefaultRoute = '/categories';
        window.YB_DEFAULTLANG = "zh";
        window.YB_CURRENCYSYMBOL = "¥";
        window.YB_SHOPPINGPAGE =  "/wxapi/store/pageShopping";
        window.YB_ORDERPAGEURL = '/m/order?tmpl=1';
        window.YB_CONTACTPAGE = '/wxapi/store/pageContact';
        window.YB_INDUSTRY = '餐饮行业';
        window.YB_FOOTERPAGE = "/wxapi/store/pageFooter";
        
       /*  $('document').ready(function () {
            initApp($, window);
        });  */ 
    </script>

</head>
<body ontouchstart="" class="yb-tpl2">
	<div id="homeView" data-route="home"
		class="yb-page yb-search-off yb-category-off" style="display: none;">
		<div class="yb-page-inner">
			<div class="yb-header-home yb-header-tpl weui-flex">
				<img class="yb-logo" src="./image/store.png"
					onerror="this.onerror = null; this.src = &#39;//imgw.pospal.cn/we/weidian/img/iconsV2/store.png&#39;"
					alt=""> <span class="yb-store-name">demo1099</span> <span
					class="yb-filler"></span> <a
					href="http://masr8-26.pospal.cn/m/account" class="yb-person-lnk"><img
					src="./image/person@2x.png" alt=""></a>
			</div>
			<div class="yb-shopping"></div>
			<div class="yb-search">
				<div class="weui-search-bar yb-header">
					<form class="weui-search-bar__form">
						<div class="weui-search-bar__box">
							<i class="weui-icon-search"></i> <input type="search"
								class="weui-search-bar__input yb-search-input" placeholder="搜索"
								autocapitalize="none" autocomplete="off" required=""> <a
								href="javascript:" class="weui-icon-clear yb-search-clear"></a>
						</div>
						<label class="weui-search-bar__label"> <i
							class="weui-icon-search"></i> <span>搜索</span>
						</label>
					</form>
					<a href="javascript:"
						class="weui-search-bar__cancel-btn yb-search-cancel">取消</a>
				</div>
				<div class="yb-search-result"></div>
			</div>
			<div class="yb-category">
				<div class="yb-category-name yb-border_bottom"></div>
				<div class="yb-category-result"></div>
			</div>
			<div class="yb-cart-movescbox">
				<span class="yb-cart-movesc">&nbsp;</span>
			</div>
		</div>
		<div class="yb-footer"></div>

		<div class="yb-service weui-popup__container">
			<div class="weui-popup__overlay"></div>
			<div class="yb-service__modal">
				<div class="yb-service-inner">
					<a href="javascript:;" class="yb-close-popup">&nbsp;</a>
					<div class="yb-service__bd"></div>
				</div>
			</div>
		</div>

	</div>
	<div id="attrView" class="weui-popup__container popup-bottom">
		<div class="weui-popup__overlay"></div>
		<div class="weui-popup__modal">
			<a href="javascript:;" class="yb-close-popup">&nbsp;</a>
			<div class="yb-page-inner">
				<div class="yb-attr-wrapper"></div>
			</div>
			<div class="yb-footer yb-footer-attrs yb-border_top">
				<div class="yb-attr-add">
					<a class="yb-btn yb-btn_secondary" href="javascript:">增加口味</a>
				</div>
				<div class="yb-attr-confirm">
					<a class="yb-btn yb-btn_primary" href="javascript:">确定</a>
				</div>
			</div>
		</div>
	</div>
	<div id="detailsView" data-route="details" class="yb-page"
		style="display: none;">
		<div class="yb-page-inner">
			<div class="yb-header-home yb-header-tpl weui-flex">
				<img class="yb-logo" src="./image/store.png"
					onerror="this.onerror = null; this.src = &#39;//imgw.pospal.cn/we/weidian/img/iconsV2/store.png&#39;"
					alt=""> <span class="yb-store-name">demo1099</span> <span
					class="yb-filler"></span> <a
					href="http://masr8-26.pospal.cn/m#/search" class="yb-search-lnk"><img
					src="./image/searchBlack@2x.png" alt=""></a>
			</div>
			<div class="yb-details-wrapper"></div>
		</div>

		<div class="yb-service weui-popup__container">
			<div class="weui-popup__overlay"></div>
			<div class="yb-service__modal">
				<div class="yb-service-inner">
					<a href="javascript:;" class="yb-close-popup">&nbsp;</a>
					<div class="yb-service__bd"></div>
				</div>
			</div>
		</div>

		<div class="yb-footer yb-footer-details yb-border_top">
			<div class="weui-flex yb-cart-view yb-cart-empty">
				<a href="javascript: _yb.services.cart.goto()"
					class="yb-cart-mini yb-border_right_half"> <span class="cart">购物车</span>
					<span class="weui-badge yb-cart-qty"
					style="position: absolute; top: -0.5rem; right: -0.5rem;"></span>
				</a> <a href="javascript:" class="yb-contact">客服</a>
			</div>
			<div class="yb-cart-add">
				<a class="yb-btn yb-btn_secondary" href="javascript:">加入购物车</a>
			</div>
			<div class="yb-cart-order">
				<a class="yb-btn yb-btn_primary" href="javascript:">立即购买</a>
			</div>
		</div>
	</div>
	<div id="cartView" data-route="cart" class="yb-page"
		style="display: none;">
		<div class="yb-page-inner">
			<div class="yb-header-cart">
				<span>购物车列表</span> <span class="yb-cart-clear">清空</span>
			</div>
			<div class="yb-cart-content"></div>
		</div>

		<div class="yb-footer yb-footer-cart yb-border_top" style="">
			<div class="yb-cart-summary">
				<div class="yb-cart-money"></div>
			</div>
			<div class="yb-filler"></div>
			<div class="yb-cart-order">
				<a class="yb-btn yb-btn_primary" href="javascript:">结算</a>
			</div>
		</div>
	</div>
	<div id="categoriesView" data-route="categories"
		class="yb-page yb-categories_tpl" style="display: block;">
		<div class="ybRemindMssage"></div>
		<div class="yb-header-home yb-header-tpl weui-flex">
			<img class="yb-logo" src="./image/store.png"
				onerror="this.onerror = null; this.src = &#39;//imgw.pospal.cn/we/weidian/img/iconsV2/store.png&#39;"
				alt=""> <span class="yb-store-name">demo1099</span> <span
				class="yb-filler"></span> <a
				href="http://masr8-26.pospal.cn/m#/search" class="yb-search-lnk">
				<img src="./image/searchBlack@2x.png" alt="">
			</a> <a href="http://masr8-26.pospal.cn/m/account" class="yb-person-lnk ">
				<img src="./image/person@2x.png" alt="">
			</a>
		</div>
		<div id="categoriesContianer"
			class="yb-deals  yb-deals_tpl_4  yb-deals_homeLoad ">
			<div class="yb-deals_left">
				<div class="yb-items">
					<div class="yb-item yb-act yb-act-color"
						data-cuid="1502940390832685305" data-category="手工调制浓缩咖啡">
						<img class="yb-category-image"
							onerror="javasrcipt:this.src=&#39;//imgw.pospal.cn/we/weidian/img/icons/categorynull.png&#39;;this.onerror=null;"
							src="./image/9ff10470-4e77-4aba-b317-a6a4ed98dcd8.png">
						<p class="yb-spw-showName">手工调制浓缩咖啡</p>
					</div>
					<div class="yb-item " data-cuid="1502940403004727341"
						data-category="星冰乐®">
						<img class="yb-category-image"
							onerror="javasrcipt:this.src=&#39;//imgw.pospal.cn/we/weidian/img/icons/categorynull.png&#39;;this.onerror=null;"
							src="./image/7e92fb41-d707-47f2-93f2-7e133df77a00.png">
						<p class="yb-spw-showName">星冰乐®</p>
					</div>
					<div class="yb-item " data-cuid="1502947758910999939"
						data-category="茶瓦纳™">
						<img class="yb-category-image"
							onerror="javasrcipt:this.src=&#39;//imgw.pospal.cn/we/weidian/img/icons/categorynull.png&#39;;this.onerror=null;"
							src="./image/8dfd543e-d8a8-47c0-91b8-6ff4ce2c098c.png">
						<p class="yb-spw-showName">茶瓦纳™</p>
					</div>
					<div class="yb-item " data-cuid="1502948688879949271"
						data-category="经典巧克力饮品">
						<img class="yb-category-image"
							onerror="javasrcipt:this.src=&#39;//imgw.pospal.cn/we/weidian/img/icons/categorynull.png&#39;;this.onerror=null;"
							src="./image/6584d584-fc1c-408f-ae87-f4f390cd12ef.png">
						<p class="yb-spw-showName">经典巧克力饮品</p>
					</div>
					<div class="yb-item " data-cuid="1502949814879150263"
						data-category="烘焙">
						<img class="yb-category-image"
							onerror="javasrcipt:this.src=&#39;//imgw.pospal.cn/we/weidian/img/icons/categorynull.png&#39;;this.onerror=null;"
							src="./image/b593d786-32d5-4466-9098-99705cac094a.png">
						<p class="yb-spw-showName">烘焙</p>
					</div>
					<div class="yb-item " data-cuid="1538029037930980073"
						data-category="蛋糕&amp;甜品">
						<img class="yb-category-image"
							onerror="javasrcipt:this.src=&#39;//imgw.pospal.cn/we/weidian/img/icons/categorynull.png&#39;;this.onerror=null;"
							src="./image/fa94d001-c2de-48b2-b702-584e9f83137b.png">
						<p class="yb-spw-showName">蛋糕&amp;甜品</p>
					</div>
					<div class="yb-item " data-cuid="1538029045321203142"
						data-category="三明治、帕尼尼、卷">
						<img class="yb-category-image"
							onerror="javasrcipt:this.src=&#39;//imgw.pospal.cn/we/weidian/img/icons/categorynull.png&#39;;this.onerror=null;"
							src="./image/42dfde7b-19a3-4c0d-a464-8ee78d701da0.png">
						<p class="yb-spw-showName">三明治、帕尼尼、卷</p>
					</div>
					<div class="yb-item " data-cuid="1538029057149719665"
						data-category="酸奶">
						<img class="yb-category-image"
							onerror="javasrcipt:this.src=&#39;//imgw.pospal.cn/we/weidian/img/icons/categorynull.png&#39;;this.onerror=null;"
							src="./image/a5b83cee-650a-483c-978a-46e501eda12b.png">
						<p class="yb-spw-showName">酸奶</p>
					</div>
				</div>
			</div>
			<div class="yb-deals_righ">
				<div class="yb-scrollable">
					<div class="yb-category-swiper">
						<div
							class="yb-swiper swiper-container swiper-container-horizontal swiper-container-android"
							data-swiper="[object Object]">
							<div class="swiper-wrapper"
								style="transform: translate3d(-556px, 0px, 0px); transition-duration: 0ms;">
								<div
									class="swiper-slide swiper-slide-duplicate swiper-slide-next"
									data-swiper-slide-index="0" style="width: 278px;">
									<img src="./image/2bacc7c7-90d3-403c-a788-a716febac527.png"
										alt="">
								</div>
								<div class="swiper-slide swiper-slide-prev"
									data-swiper-slide-index="0" style="width: 278px;">
									<img src="./image/2bacc7c7-90d3-403c-a788-a716febac527.png"
										alt="">
								</div>
								<div
									class="swiper-slide swiper-slide-duplicate swiper-slide-active"
									data-swiper-slide-index="0" style="width: 278px;">
									<img src="./image/2bacc7c7-90d3-403c-a788-a716febac527.png"
										alt="">
								</div>
							</div>
							<div class="swiper-pagination swiper-pagination-bullets">
								<span
									class="swiper-pagination-bullet swiper-pagination-bullet-active"></span>
							</div>
						</div>
					</div>
					<div class="yb-items">
						<div class="c1502940390832685305" data-cuid="1502940390832685305">
							<div class="yb-category_name">手工调制浓缩咖啡</div>
							<div class="yb-item " p_uid="17041">
								<div class="yb-item__hd">
									<a class="yb-item-img"
										href="http://masr8-26.pospal.cn/m#/details/17041"><img
										src="./image/631c1b4c-6d4c-4bf6-95c4-c0a49a13c8aa_640x640.png"
										alt="" onerror="_yb.errProdImg(this)"></a>
								</div>
								<div class="yb-item__bd">
									<div class="yb-product-title">榛果风味拿铁（热/冷）</div>
									<div class="yb-product-decs">榛果风味与醇厚的浓缩咖啡相得益彰，融合在蒸煮牛奶中，带给你特别温暖的醇香。</div>
									<div class="yb-product-price">¥0.01</div>
									<div class="yb-product-length">(共4款)</div>
								</div>
								<div class="yb-item__ft">
									<div class="yb-cart-operate" data-uid="17041"
										data-price="0.01 " data-isseries="true">
										<span class="yb-series-btn">选规格</span>
									</div>
								</div>
							</div>
							<div class="yb-item " p_uid="17045">
								<div class="yb-item__hd">
									<a class="yb-item-img"
										href="http://masr8-26.pospal.cn/m#/details/17045"><img
										src="./image/8b779e1e-c233-48fa-870a-59c7a9d1f445_640x640.png"
										alt="" onerror="_yb.errProdImg(this)"></a>
								</div>
								<div class="yb-item__bd">
									<div class="yb-product-title">香草风味拿铁（热/冷）</div>
									<div class="yb-product-decs">清雅香甜的香草风味糖浆让浓缩咖啡变得浪漫起来，开启拿铁的香草浪漫之旅。</div>
									<div class="yb-product-price">¥0.02</div>
									<div class="yb-product-length">(共2款)</div>
								</div>
								<div class="yb-item__ft">
									<div class="yb-cart-operate" data-uid="17045"
										data-price="0.02 " data-isseries="true">
										<span class="yb-series-btn">选规格</span>
									</div>
								</div>
							</div>
							<div class="yb-item " p_uid="17047">
								<div class="yb-item__hd">
									<a class="yb-item-img"
										href="http://masr8-26.pospal.cn/m#/details/17047"><img
										src="./image/126d15a9-4c46-4b06-bdad-c9dd53691b7b_640x640.png"
										alt="" onerror="_yb.errProdImg(this)"></a>
								</div>
								<div class="yb-item__bd">
									<div class="yb-product-title">馥芮白™</div>
									<div class="yb-product-decs">选用星巴克精萃浓缩咖啡制成，融合绵密奶泡，风味更浓郁和甘甜。</div>
									<div class="yb-product-price">¥0.03</div>
									<div class="yb-product-length">(共2款)</div>
								</div>
								<div class="yb-item__ft">
									<div class="yb-cart-operate" data-uid="17047"
										data-price="0.03 " data-isseries="true">
										<span class="yb-series-btn">选规格</span>
									</div>
								</div>
							</div>
							<div class="yb-item " p_uid="17049">
								<div class="yb-item__hd">
									<a class="yb-item-img"
										href="http://masr8-26.pospal.cn/m#/details/17049"><img
										src="./image/fec77bf9-f77b-46f8-b2da-73592e7b36c1_640x640.png"
										alt="" onerror="_yb.errProdImg(this)"></a>
								</div>
								<div class="yb-item__bd">
									<div class="yb-product-title">浓郁咖啡摩卡（热/冷）</div>
									<div class="yb-product-decs">多一份浓缩咖啡融合于蒸煮牛奶和摩卡酱中，交织出馥郁又平衡的风味，激活生活的精彩瞬间。</div>
									<div class="yb-product-price">¥0.10</div>
								</div>
								<div class="yb-item__ft">
									<div class="yb-cart-operate" data-uid="17049" data-price="0.1">
										<span class="yb-cart-remove_home ">&nbsp;</span><input
											type="text" class="yb-item-qtys" pattern="[0-9]*"
											maxlength="3" value="1" disabled=""><span
											class="yb-cart-add">&nbsp;</span>
									</div>
								</div>
							</div>
							<div class="yb-item yb-item-has" p_uid="17050">
								<div class="yb-item__hd">
									<a class="yb-item-img"
										href="http://masr8-26.pospal.cn/m#/details/17050"><img
										src="./image/2db718f7-4b7f-4f09-80c2-30fac13581f5_640x640.png"
										alt="" onerror="_yb.errProdImg(this)"></a>
								</div>
								<div class="yb-item__bd">
									<div class="yb-product-title">焦糖玛奇朵（热/冷）</div>
									<div class="yb-product-decs">玛奇朵在意大利语中的意思是“印记”。从蒸煮牛奶和添加风味糖浆开始，再倒入醇厚的浓缩咖啡，留下属于玛奇朵的独有印记。</div>
									<div class="yb-product-price">¥0.10</div>
								</div>
								<div class="yb-item__ft">
									<div class="yb-cart-operate" data-uid="17050" data-price="0.1">
										<span class="yb-cart-remove_home ">&nbsp;</span><input
											type="text" class="yb-item-qtys" pattern="[0-9]*"
											maxlength="3" value="1" disabled=""><span onclick="initApp(o, t)"
											class="yb-cart-add">&nbsp;</span>
									</div>
								</div>
							</div>
							<div class="yb-item yb-item-has" p_uid="17051">
								<div class="yb-item__hd">
									<a class="yb-item-img"
										href="http://masr8-26.pospal.cn/m#/details/17051"><img
										src="./image/cbe7dba5-17a5-4f92-8751-000657fc57c9_640x640.png"
										alt="" onerror="_yb.errProdImg(this)"></a>
								</div>
								<div class="yb-item__bd">
									<div class="yb-product-title">卡布奇诺（热/冷）</div>
									<div class="yb-product-decs">蒸煮牛奶与浓缩咖啡相融合，用丰厚绵密的奶泡覆顶，再撒上肉桂粉或可可粉。

										温馨提示：在奶泡消融前，请尽快享用。</div>
									<div class="yb-product-price">
										¥0.00
										<del>
											¥0.01
											<del></del>
										</del>
									</div>
									<div class="yb-product-length">(共2款)</div>
								</div>
								<div class="yb-item__ft">
									<div class="yb-cart-operate" data-uid="17051" data-price="0 "
										data-isseries="true">
										<span class="yb-series-btn">选规格</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="weui-loadmore yb-loadingData" style="display: none;">
						<i class="weui-loading"></i> <span class="weui-loadmore__tips">正在加载</span>
					</div>
				</div>
			</div>
		</div>
		<div class="yb-footer yb-footer-home">
			<a href="http://masr8-26.pospal.cn/m#/cart"
				class="yb-footer__item yb-cart-view yb-cart-has"> <span
				class="yb-footer-bag"></span>
				<div class="yb-cart-mini">
					<img src="./image/shoppingCart@2x.png" alt=""> <span
						class="weui-badge yb-cart-qty"
						style="position: absolute; top: -0.1rem; right: -0.3rem;">2</span>
					<div class="yb-cart-priceText">
						共计 <span class="yb-cart-money">¥0.10</span>元
					</div>
				</div> <span class="yb-cart-tet">购物车是空的</span>
			</a> <a href="javascript:"
				class="yb-footer__item yb-order-link yb-cart-view yb-cart-has">
				<p class="yb-footer-label yb-footer-separator_left">结算</p>
			</a>
		</div>
	</div>

	<div id="packagesView" data-route="packages" class="yb-page"
		style="display: none;">
		<div class="yb-page-inner">
			<div class="yb-package-wrapper">
				<div class="yb-package-select">已选：</div>
				<div class="yb-package-container"></div>
			</div>
			<div class="yb-footer yb-footer-package" style="position: fixed;">
				<div class="yb-package-summary">
					合计： <span class="yb-package-money">¥88.80</span>
				</div>
				<div class="yb-filler"></div>
				<div class="yb-package-sure">
					<a class="yb-btn " href="javascript:">确定</a>
				</div>
			</div>
		</div>

	</div>

	<div id="tasteView" class="weui-popup__container popup-bottom">
		<div class="weui-popup__overlay"></div>
		<div class="weui-popup__modal">
			<div class="yb-page-inner">
				<a href="javascript:;" class="yb-close-popup">&nbsp;</a>
				<div class="yb-taste-wrapper"></div>

			</div>
			<div class="yb-footer yb-footer-attrs yb-border_top">
				<div class="yb-attr-add">
					<a class="yb-btn yb-btn_secondary" href="javascript:">取消</a>
				</div>
				<div class="yb-attr-confirm">
					<a class="yb-btn yb-btn_primary" href="javascript:">确定</a>
				</div>
			</div>
		</div>

	</div>


	<!--<script src="../lib/fastclick.js"></script>-->
	<script src="./js/jquery-weui.min.js"></script>
	<script src="./js/director.min.js"></script>
	<script src="./js/core.min.js"></script>
	<script src="./js/swiper.min.js"></script>
<!-- <script src="./js/main.v14.min.js"></script> -->
	<script src="./js/page.js"></script>


</body>
</html>