<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html >
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Description" content="三餐美食网，您身边的美食专家。各色餐厅，精彩呈送，外卖订餐，手机微信点单，快捷享受！">
<meta name="Keywords" content="美食,餐厅,订餐,外卖,送餐,订餐网,微信订餐,手机点餐">
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0,viewport-fit=cover"> -->


<title>杰悠意大利披萨</title>
 <script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
<!--   <script src="../allcategory/js/jquery-1.8.3.min.js"></script> -->
  <link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">  
  <link rel="stylesheet" type="text/css" href="./css/wap.min.css">
  <link rel="stylesheet" type="text/css" href="./css/wap_menu.css">
  
   <link rel="stylesheet" href="https://cdn.bootcss.com/weui/1.1.3/style/weui.min.css">
<!-- <link rel="stylesheet" href="https://cdn.bootcss.com/jquery-weui/1.2.1/css/jquery-weui.min.css">   -->

  <script src="https://cdn.bootcss.com/jquery-weui/1.2.1/js/swiper.min.js"></script> 

<script src="https://cdn.bootcss.com/jquery-weui/1.2.1/js/jquery-weui.min.js"></script>
  <link rel="shortcut icon" type="image/x-icon" href="https://ali-s.0xiao.cn/3cfood/Public/2018-10-30-1126/static/img/favicon.ico">
	
  
  <style>
   .img_state {
	width: auto;
	padding: 0 2px;
    }

   .swiper-container{
    width:268px;
    height: 130px;
        }
        
   .swiper-container{
   /*  swiper-theme-color: #f9f9f9; */
    --swiper-pagination-color: #f9f9f9;
  }
  
  .box{ 
        overflow:scroll; 
        -webkit-overflow-scrolling: touch; 
       


}





.imgContainer {
 background: url("../allcategory/image/tempimg.jpg") no-repeat;
  background-size: 100% 100%;
  height: 100%; 
   /*  min-height: 100%; */
  position: fixed;
  width: 100%;
   /*  -webkit-background-size: 100% 100%; */
 -moz-background-size: 100% 100%; 
 /*  -o-background-size: 100% 100%; */
 


}

.img1 {
	/* display: block;
	background-size:contain|cover;

    width:100%;

    height:auto ;
	
	position: absolute; */
	
	  /* display: inline-block; */
	/*   max-height:100%;
	  width:auto; */
  /*  height: auto;
  max-width: 100%; */
}


</style>
<!-- <script>


  //读取cookies
    function gCookie(name)
    {
        var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
        if(arr=document.cookie.match(reg)) {
            return unescape(arr[2]);
        }else {
            return null;
        }
    }

    //设置cookie
    function sCookie(name,value,time){
        var Days = 30;
        var exp = new Date();
        if(time){
            exp.setTime(exp.getTime() + time);
        }else{
            exp.setTime(exp.getTime() + Days*24*60*60*1000);
        }
        document.cookie = name + "="+ escape (value) + ";domain=.3cfood.com;path=/;expires=" + exp.toGMTString();
    }

    var cdnGetResult = new Array();
    function checkCdn()
    {
        if(!window.sessionStorage.getItem('checked_cdn')) {
            var gCdn = "ali,up";
            var gCdnArray = gCdn.split(",");
            var url = "https://prefix-s.0xiao.cn/test.html?v=" + parseInt(Math.random()*10000);
            for(var i in gCdnArray) {
                  var prefix = gCdnArray[i];
                  var newurl = url;
                  newurl = newurl.replace('prefix',prefix);
                  ajaxCheck(newurl,prefix);
            }

            function ajaxCheck(url,prefix){
                 var obj=new XMLHttpRequest();  // XMLHttpRequest对象用于在后台与服务器交换数据          
                 obj.open('GET',url,true);
                 obj.onreadystatechange=function(){
                     if (obj.readyState == 4 ) { // readyState==4说明请求已完成
                         if(obj.status == 200 || obj.status == 304) {
                             console.log(url, obj.responseText);
                             console.log("get url: "+url+",success");
                             var tmp = {};
                             tmp['prefix'] = prefix;
                             tmp['rs'] = true;
                             cdnGetResult.push(tmp);
                         } else {
                             console.log("get cdn:"+ url +",fail :".text);
                            var tmp = {};
                             tmp['prefix'] = prefix;
                             tmp['rs'] = false;
                             cdnGetResult.push(tmp);
                         }
                     }
                 };
                obj.send(null);
            }
            setTimeout(function(){getCdnRs();},3000);
        } 
    }
    checkCdn();
    function getCdnRs(){
        console.log('enter get cdn callback ');
      if(cdnGetResult.length >= 1 ) {
          console.log("cdn rs length," + cdnGetResult.length);
          var cookieV = "";
          for(var i in cdnGetResult) {
              var result = cdnGetResult[i].rs;
              if(result === true) {
                 cookieV = cookieV + cdnGetResult[i].prefix+ "|";
              }
          }
          sCookie("cdn",cookieV);
          console.log("cookie value:" + cookieV);
          window.sessionStorage.setItem("checked_cdn",true);
          if (cdnGetResult.length < 2) {
              console.log("because cdn success less than 2 ,so reload page");
              window.location.reload();
          }
      } else {
        console.log('no get cdn length,next timeout ');
        setTimeout(function(){getCdnRs();},3000);  
      }
    } 
</script> -->

</head>



<body pagename="res" data-res_id="7727" data-res_token="m3c4tx"
	data-min_price="0" data-state="0" data-mobile="1" data-iphone="0"
	data-weixin="0" data-currency="¥"  id="bodys">

 	<div id="temppage">
		<div class="imgContainer">
			<div class="weui-toast weui_loading_toast weui-toast--visible">
				<div class="weui_loading">
					<i class="weui-loading weui-icon_toast"></i>
				</div>
				<p class="weui-toast_content">正在加载</p>
			</div>
			
		</div>
	</div>
	<div id="shoppage" style="display: none">
	<div id="rebate_shade" class="rebate_shade" style="display: none"
		onclick="$(&#39;#rebate_shade&#39;).hide()">
		<p class="mb10 font16">【优惠信息】</p>
		<p class="mb10 font16">满10减3(满10减3元)</p>
		<p class="font16" style="padding: 30px 0 10px;">【店铺公告】</p>
		<p>全场首单立减5元！</p>
	</div>
	<div class="center clof shop_name">
	
		<!-- <a class="nou head_back" href="javascript:history.back();">&nbsp;</a> -->
		<a class="nou head_back" href="/page/index/process">&nbsp;</a>
		<a class="nou head_title" href="/page/index/process;"> 杰悠披萨®</a>
			<a href="/page/customer/process" class="right" id="food_user"></a>
		<a class="right" id="food_search"></a>
     <!-- 	
	   <ul id="restype_ul">
			<li onclick="onlyType(this)" rel="1" id="type1">预定到店</li>
			<li onclick="onlyType(this)" rel="2" id="type2" class="hover">外卖送达</li>
		</ul>  -->
	</div>
	
	<!--   ------------------------------------------------   ------------------------------------------------------------               -->
	<div class="food_list_body ovh">
		<div id="scroll_sort" class="left"
			style="width: 22%; overflow: auto; height: 100%;">
			<ul id="food_sort"
				style="padding-bottom: 70px; transition-timing-function: cubic-bezier(0.1, 0.57, 0.1, 1); transition-duration: 0ms; transform: translate(0px, 0px) translateZ(0px);">
				<li id="sort_rush" data-sortid="_rush" class="foodsort"
					style="display: none;">限时限量特价 <span class="res_sort_num">0</span></li>
				<!-- <li id="sort_198044" data-sortid="198044" rel="1" class="foodsort">面、米线<span
					class="res_sort_num" style="display: inline-block;">7</span></li>
				<li id="sort_50635" data-sortid="50635" rel="2" class="foodsort">炒菜<span
					class="res_sort_num">0</span></li> -->
				<li id="sort_50634" data-sortid="50634" rel="3" class="foodsort hover">
				 
				     <div class="yb-item" data-cuid="1502940403004727341" data-category="星冰乐®">
				     <img class="yb-category-image" onerror="javasrcipt:this.src='//imgw.pospal.cn/we/weidian/img/icons/categorynull.png';this.onerror=null;" src=" //img.pospal.cn/EShopCategoryImage/7e92fb41-d707-47f2-93f2-7e133df77a00.png">
				     <p class="yb-spw-showName">火爆披萨</p>
				     </div>
				   <span class="res_sort_num" ></span>
				</li>
				<li id="sort_50632" data-sortid="50632" rel="4" class="foodsort">
				<div class="yb-item" data-cuid="1502940403004727341" data-category="星冰乐®">
				     <img class="yb-category-image" onerror="javasrcipt:this.src='//imgw.pospal.cn/we/weidian/img/icons/categorynull.png';this.onerror=null;" src=" //img.pospal.cn/EShopCategoryImage/6584d584-fc1c-408f-ae87-f4f390cd12ef.png">
				     <p class="yb-spw-showName">超值特惠</p>
				     </div>
				<span class="res_sort_num">0</span>
				</li>
			</ul>
		</div>
		
		
		<div id="scroll_food" class="right" style="width: 78%; overflow: auto;height: auto;background: #fff;">
	
	
	      <!-- 
			 	 <div class="swiper-container">
						<div class="swiper-wrapper" >
							<div class="swiper-slide" style="width: 288px;"> 
								<img src="http://pospalstoreimg.area26.pospal.cn/shopBanner/3492009/2bacc7c7-90d3-403c-a788-a716febac527.png" alt="">
						 	</div>
							<div class="swiper-slide" style="width: 288px;">
								<img src="http://pospalstoreimg.area26.pospal.cn/shopBanner/3492009/2bacc7c7-90d3-403c-a788-a716febac527.png" alt="">
							</div>
							<div class="swiper-slide" style="width: 288px;">
								<img src="http://pospalstoreimg.area26.pospal.cn/shopBanner/3492009/2bacc7c7-90d3-403c-a788-a716febac527.png" alt="">
							</div>
						</div>
	
		        </div>    -->
	          
			<div id="food_img_list" class="bgf" style="padding-bottom: 70px; transition-timing-function: cubic-bezier(0.1, 0.57, 0.1, 1); transition-duration: 0ms; transform: translate(0px, -995px) translateZ(0px);">
				<div id="foodlist_rush" style="display: none;">
					<h3 class="font14 red rush_tit">限时限量特价商品</h3>
					<ul id="special_list" class="ovh"></ul>
				</div>
			
				<div id="foodlist50634" data-tagid="50634" class="foodlist_box">
					
					<ul>
					
					
			 	<li class="food_rest_50634 food_847666 swiperli" data-pack="0.00">
					<div class="paddinggd">
					<div class="swiper-container">
					<div class="swiper-wrapper" >
						<div class="swiper-slide" >
							<img src="./shopimg/2bacc7c7-90d3-403c-a788-a716febac527(1).png" alt="">
						</div>
						<div class="swiper-slide " >
							<img src="./shopimg/2bacc7c7-90d3-403c-a788-a716febac527(2).png" alt="">
						</div>
						<div class="swiper-slide  ">
							<img src="./shopimg/2bacc7c7-90d3-403c-a788-a716febac527.png" alt="">
						</div>
					</div>
					<div class="swiper-pagination"></div>
					</div>
						</div>
				</li>
					
					<h3 class="foodlist_label">火爆披萨</h3>
					
					
					
						<li class="food_rest_50634 food_847666" data-pack="0.00"><div
								class="img_list_box">
								<!-- <img class="img_list_img" data-food="847666"
									data-src="../allcategory/shopimg/182_92293.jpg"
									des="选泰国进口金枕榴莲，搭配香浓芝士，烘烤后的大块榴莲和芝士美妙融合，香气扑鼻" src="../allcategory/shopimg/182_92293.jpg"
									style="width: 90px; height: 75px;" alt="榴莲皇后披萨"
									onclick="food_img(this);"> -->
									<img class="img_list_img" data-food="847666"
									data-src="../allcategory/shopimg/liulian.jpg"
									des="选泰国进口金枕榴莲，搭配香浓芝士，烘烤后的大块榴莲和芝士美妙融合，香气扑鼻" src="../allcategory/shopimg/liulian.jpg"
									style="width: 80px; height: 64px;" alt="榴莲皇后披萨"
									onclick="food_img(this);">
							</div>
							<div>
								<span class="food_img_name">榴莲皇后披萨</span>
								<p class="font12 clo9">选泰国进口金枕榴莲，搭配香浓芝士，烘烤后的大块榴莲和芝士美妙融合，香气扑鼻</p>
								<!--无大小份-->
								<div class="relative food_box" id="food_847666">
									<div class="img_list_price">
										<div id="addcart_btn_847666" class="right img_plus"
											data-foodid="847666" data-foodname="榴莲皇后披萨"
											data-foodprice="29.00"
											data-foodimg="/page/allcategory/shopimg/liulian.jpg"
											data-foodsort="50634" 
											data-foodpack="0.00"
											data-foodtype="1"
											>+</div>
										<div class="right hide isnum" id="847666_amount_imglist">
											<div id="cutcart_btn_847666" class="left img_cut"
												data-foodid="847666" data-foodname="榴莲皇后披萨"
												data-foodprice="29.00"
												data-foodimg="/page/allcategory/shopimg/liulian.jpg"
												data-foodsort="50634" data-foodpack="0.00">-</div>
											<div class="left order_count_imglist"
												id="847666_amount_num_imglist">0</div>
										</div>
									</div>
									<span class="clofe line25">¥<span
										id="food_price_num_847666">29</span><del class="yb-checkout-origin-price">¥88</del></span>
								</div>
							</div>
							</li>
							
							
							
							
						<li class="food_rest_50634 food_402798" data-pack="0.00"><div
								class="img_list_box">
								<img class="img_list_img" data-food="402798"
									data-src="../allcategory/shopimg/shuiguo.jpg"
									des="选泰国进口金枕榴莲，搭配香浓芝士，烘烤后的大块榴莲和芝士美妙融合，香气扑鼻" src="../allcategory/shopimg/shuiguo.jpg"
									style="width: 80px; height: 64px;" alt="缤纷水果披萨"
									onclick="food_img(this);">
								<div class="img_state img_jian">荐</div>
							</div>
							<div>
								<h3 class="food_img_name">缤纷水果披萨</h3>
								<p class="font12 clo9">选泰国进口金枕榴莲，搭配香浓芝士，烘烤后的大块榴莲和芝士美妙融合，香气扑鼻</p>
								<!--无大小份-->
								<div class="relative food_box" id="food_402798">
									<div class="img_list_price">
										<div id="addcart_btn_402798" class="right img_plus"
											data-foodid="402798" data-foodname="缤纷水果披萨"
											data-foodprice="18.00"
											data-foodimg="/page/allcategory/shopimg/shuiguo.jpg"
											data-foodsort="50634" data-foodpack="0.00"
											data-foodtype="1"
											>+</div>
										<div class="right hide isnum" id="402798_amount_imglist">
											<div id="cutcart_btn_402798" class="left img_cut"
												data-foodid="402798" data-foodname="缤纷水果披萨"
												data-foodprice="18.00"
												data-foodimg="/page/allcategory/shopimg/shuiguo.jpg"
												data-foodsort="50634" data-foodpack="0.00">-</div>
											<div class="left order_count_imglist"
												id="402798_amount_num_imglist">0</div>
										</div>
									</div>
									<span class="clofe line25">¥<span
										id="food_price_num_402798">18</span><del class="yb-checkout-origin-price">¥48</del></span>
								</div>
							</div>
							
							</li>
							
							
							
						<li class="food_rest_50634 food_402807" data-pack="0.00"><div
								class="img_list_box">
								<img class="img_list_img" data-food="402807"
									data-src="../allcategory/shopimg/niurou.jpg"
									des="选泰国进口金枕榴莲，搭配香浓芝士，烘烤后的大块榴莲和芝士美妙融合，香气扑鼻" src="../allcategory/shopimg/niurou.jpg"
									style="width: 80px; height: 64px;" alt="炭烤牛肉披萨"
									onclick="food_img(this);">
							</div>
							
							<div>
								<h3 class="food_img_name">炭烤牛肉披萨</h3>
								<p class="font12 clo9">就是好吃，买就完了，别犹豫。选泰国进口金枕榴莲，搭配香浓芝士，烘烤后的大块榴莲和芝士美妙融合，香气扑鼻</p>
								<!--无大小份-->
								<div class="relative food_box" id="food_402807">
									<div class="img_list_price">
										<div id="addcart_btn_402807" class="right img_plus"
											data-foodid="402807" data-foodname="炭烤牛肉披萨"
											data-foodprice="25.00" 
											data-foodimg="/page/allcategory/shopimg/niurou.jpg"
											data-foodsort="50634" data-foodpack="0.00"
											data-foodtype="1">+</div>
										<div class="right hide isnum" id="402807_amount_imglist"
											>
											<div id="cutcart_btn_402807" class="left img_cut"
												data-foodid="402807" data-foodname="炭烤牛肉披萨"
												data-foodprice="25.00"
												data-foodimg="/page/allcategory/shopimg/niurou.jpg"
												data-foodsort="50634" data-foodpack="0.00">-</div>
											<div class="left order_count_imglist"
												id="402807_amount_num_imglist">0</div>
										</div>
									</div>
									<span class="clofe line25">¥<span
										id="food_price_num_402807">25</span><del class="yb-checkout-origin-price">¥68</del></span>
								</div>
							</div></li>
							
							
							
							
						<li class="food_rest_50634 food_402808" data-pack="0.00"><div
								class="img_list_box">
								<img class="img_list_img" data-food="402808"
									data-src="../allcategory/shopimg/jirou.jpg"
									des="就是好吃，买就完了，别犹豫。选泰国进口金枕榴莲，搭配香浓芝士，烘烤后的大块榴莲和芝士美妙融合，香气扑鼻" src="../allcategory/shopimg/jirou.jpg"
									style="width: 80px; height: 64px;" alt="新奥尔良鸡肉披萨"
									onclick="food_img(this);">
								<div class="img_state img_jian">荐</div>
							</div>
							<div>
								<h3 class="food_img_name">新奥尔良鸡肉披萨</h3>
								<p class="font12 clo9">就是好吃，买就完了，别犹豫。选泰国进口金枕榴莲，搭配香浓芝士，烘烤后的大块榴莲和芝士美妙融合，香气扑鼻</p>
								<!--无大小份-->
								<div class="relative food_box" id="food_402808">
									<div class="img_list_price">
										<div id="addcart_btn_402808" class="right img_plus"
											data-foodid="402808" data-foodname="新奥尔良鸡肉披萨"
											data-foodprice="22.00"
											data-foodimg="/page/allcategory/shopimg/jirou.jpg"
											data-foodsort="50634" data-foodpack="0.00"
											data-foodtype="1">+</div>
										<div class="right hide isnum" id="402808_amount_imglist"
											>
											<div id="cutcart_btn_402808" class="left img_cut"
												data-foodid="402808" data-foodname="新奥尔良鸡肉披萨"
												data-foodprice="22.00"
												data-foodimg="/page/allcategory/shopimg/jirou.jpg"
												data-foodsort="50634" data-foodpack="0.00">-</div>
											<div class="left order_count_imglist"
												id="402808_amount_num_imglist">0</div>
										</div>
									</div>
									<span class="clofe line25">¥<span
										id="food_price_num_402808">22</span><del class="yb-checkout-origin-price">¥55</del></span>
								</div>
							</div></li>
							
							
							
							<li class="food_rest_50634 food_402809" data-pack="0.00"><div
								class="img_list_box">
								<img class="img_list_img" data-food="402809"
									data-src="../allcategory/shopimg/haixian.jpg"
									des="就是好吃，买就完了，别犹豫。选泰国进口金枕榴莲，搭配香浓芝士，烘烤后的大块榴莲和芝士美妙融合，香气扑鼻" src="../allcategory/shopimg/haixian.jpg"
									style="width: 80px; height: 64px;" alt="新奥尔良鸡肉披萨"
									onclick="food_img(this);">
								<div class="img_state img_jian">荐</div>
							</div>
							<div>
								<h3 class="food_img_name">豪华海鲜披萨</h3>
								<p class="font12 clo9">就是好吃，买就完了，别犹豫。选泰国进口金枕榴莲，搭配香浓芝士，烘烤后的大块榴莲和芝士美妙融合，香气扑鼻</p>
								<!--无大小份-->
								<div class="relative food_box" id="food_402809">
									<div class="img_list_price">
										<div id="addcart_btn_402809" class="right img_plus"
											data-foodid="402809" data-foodname="豪华海鲜披萨"
											data-foodprice="27.00"
											data-foodimg="/page/allcategory/shopimg/haixian.jpg"
											data-foodsort="50634" data-foodpack="0.00"
											data-foodtype="1">+</div>
										<div class="right hide isnum" id="402809_amount_imglist"
											>
											<div id="cutcart_btn_402809" class="left img_cut"
												data-foodid="402809" data-foodname="豪华海鲜披萨"
												data-foodprice="27.00"
												data-foodimg="/page/allcategory/shopimg/haixian.jpg"
												data-foodsort="50634" data-foodpack="0.00">-</div>
											<div class="left order_count_imglist"
												id="402809_amount_num_imglist">0</div>
										</div>
									</div>
									<span class="clofe line25">¥<span
										id="food_price_num_402809">27</span><del class="yb-checkout-origin-price">¥78</del></span>
								</div>
							</div></li>
							
							
							
							
							
							<li class="food_rest_50634 food_402818" data-pack="0.00"><div
								class="img_list_box">
								<img class="img_list_img" data-food="402818"
									data-src="../allcategory/shopimg/zishu.jpg"
									des="就是好吃，买就完了，别犹豫。选泰国进口金枕榴莲，搭配香浓芝士，烘烤后的大块榴莲和芝士美妙融合，香气扑鼻" src="../allcategory/shopimg/zishu.jpg"
									style="width: 80px; height: 64px;" alt="夏威夷风情披萨"
									onclick="food_img(this);">
								<div class="img_state img_jian">荐</div>
							</div>
							<div>
								<h3 class="food_img_name">夏威夷风情披萨</h3>
								<p class="font12 clo9">就是好吃，买就完了，别犹豫。选泰国进口金枕榴莲，搭配香浓芝士，烘烤后的大块榴莲和芝士美妙融合，香气扑鼻</p>
								<!--无大小份-->
								<div class="relative food_box" id="food_402818">
									<div class="img_list_price">
										<div id="addcart_btn_402818" class="right img_plus"
											data-foodid="402818" data-foodname="夏威夷风情披萨"
											data-foodprice="23.00"
											data-foodimg="/page/allcategory/shopimg/zishu.jpg"
											data-foodsort="50634" data-foodpack="0.00"
											data-foodtype="1">+</div>
										<div class="right hide isnum" id="402818_amount_imglist"
											>
											<div id="cutcart_btn_402818" class="left img_cut"
												data-foodid="402818" data-foodname="夏威夷风情披萨"
												data-foodprice="23.00"
												data-foodimg="/page/allcategory/shopimg/zishu.jpg"
												data-foodsort="50634" data-foodpack="0.00">-</div>
											<div class="left order_count_imglist"
												id="402818_amount_num_imglist">0</div>
										</div>
									</div>
									<span class="clofe line25">¥<span
										id="food_price_num_402818">23</span><del class="yb-checkout-origin-price">¥49</del></span>
								</div>
							</div></li>
							
							
					</ul>
				</div>
				<div id="foodlist50632" data-tagid="50632" class="foodlist_box">
					<h3 class="foodlist_label">超值特惠</h3>
					<ul>
					
					
						<li class="food_rest_50632 food_402799" data-pack="0.00"><div
								class="img_list_box">
								<img class="img_list_img" data-food="402799"
									data-src="../allcategory/shopimg/danta.jpg"
									des="香甜酥脆" src="../allcategory/shopimg/danta.jpg"
									style="width: 80px; height: 64px;" alt="蛋挞"
									onclick="food_img(this);">
								<div class="img_state img_jian">荐</div>
							</div>
							<div>
								<h3 class="food_img_name">蛋挞</h3>
								<p class="font12 clo9">销量：30</p>
								<!--无大小份-->
								<div class="relative food_box" id="food_402799">
									<div class="img_list_price">
										<div id="addcart_btn_402799" class="right img_plus"
											data-foodid="402799" data-foodname="蛋挞"
											data-foodprice="1.00"
											data-foodimg="/page/allcategory/shopimg/danta.jpg"
											data-foodsort="50632" data-foodpack="0.00"
											data-foodtype="3">+</div>
										<div class="right hide isnum" id="402799_amount_imglist">
											<div id="cutcart_btn_402799" class="left img_cut"
												data-foodid="402799" data-foodname="蛋挞"
												data-foodprice="1.00"
												data-foodimg="/page/allcategory/shopimg/danta.jpg"
												data-foodsort="50632" data-foodpack="0.00">-</div>
											<div class="left order_count_imglist"
												id="402799_amount_num_imglist">0</div>
										</div>
									</div>
									<span class="clofe line25">¥<span
										id="food_price_num_402799">1</span></span>
								</div>
							</div></li>
							
							
							
						<li class="food_rest_50632 food_402800" data-pack="5.00"><div
								class="img_list_box">
								<img class="img_list_img" data-food="402800"
									data-src="../allcategory/shopimg/naicha.jpg"
									
									des="浓郁香甜" src="../allcategory/shopimg/naicha.jpg"
									style="width: 80px; height: 64px;" alt="奶茶"
									onclick="food_img(this);">
								<div class="img_state img_jian">荐</div>
							</div>
							<div>
								<h3 class="food_img_name">奶茶</h3>
								<p class="font12 clo9">销量：89</p>
								<!-- 无大小份 -->
								<div class="relative food_box" id="food_402800">
									<div class="img_list_price">
										<div id="addcart_btn_402800" class="right img_plus"
											data-foodid="402800" data-foodname="奶茶" data-foodprice="5.00"
											data-foodimg="/page/allcategory/shopimg/naicha.jpg"
											data-foodsort="50632" data-foodpack="1.00"
											data-foodtype="2">+</div>
										<div class="right hide isnum" id="402800_amount_imglist">
											<div id="cutcart_btn_402800" class="left img_cut"
												data-foodid="402800" data-foodname="奶茶"
												data-foodprice="5.00"
												data-foodimg="/page/allcategory/shopimg/naicha.jpg"
												data-foodsort="50632" data-foodpack="1.00">-</div>
											<div class="left order_count_imglist"
												id="402800_amount_num_imglist">0</div>
										</div>
									</div>
									<span class="clofe line25">¥<span
										id="food_price_num_402800">5</span></span>
								</div>
							</div></li>
							
							<!-- 
						<li class="food_rest_50632 food_402809" data-pack="0.00"><div
								class="img_list_box">
								<img class="img_list_img" data-food="402809"
									data-src="https://ali-img.0xiao.cn/3cfood/client/code/image/20150522/555ece2f4f571.jpg"
									des="" src="https://ali-img.0xiao.cn/3cfood/client/code/image/20150522/555ece2f4f571.jpg"
									style="width: 80px; height: 64px;" alt="薯条"
									onclick="food_img(this);">
							</div>
							<div>
								<h3 class="food_img_name">薯条</h3>
								<p class="font12 clo9">销量：99</p>
								无大小份
								<div class="relative food_box" id="food_402809">
									<div class="img_list_price">
										<div id="addcart_btn_402809" class="right img_plus"
											data-foodid="402809" data-foodname="薯条" data-foodprice="8.00"
											data-foodimg="/3cfood/client/code/image/20150522/555ece2f4f571.jpg"
											data-foodsort="50632" data-foodpack="0.00">+</div>
										<div class="right hide isnum" id="402809_amount_imglist">
											<div id="cutcart_btn_402809" class="left img_cut"
												data-foodid="402809" data-foodname="薯条"
												data-foodprice="8.00"
												data-foodimg="/3cfood/client/code/image/20150522/555ece2f4f571.jpg"
												data-foodsort="50632" data-foodpack="0.00">-</div>
											<div class="left order_count_imglist"
												id="402809_amount_num_imglist">0</div>
										</div>
									</div>
									<span class="clofe line25">¥<span
										id="food_price_num_402809">8</span></span>
								</div>
							</div></li> -->
					</ul>
				</div>
				<!--没有搜到相关商品-->
				<div id="nogood" class="clo9 center"
					style="height: 50px; padding-top: 20%; display: none;">没有搜到相关商品</div>
			</div>
		</div>
	</div>
	
	
	<!--弹出商品图片-->
	
	
	<div id="food_img" style="display: none">
		<div id="fullbg" class="fullbg"
			onclick="$(&#39;#food_img .close&#39;).hide()"></div>
		<i class="close" onclick="$(&#39;#food_img&#39;).hide()"></i>
		<div class="food_img_box pop">
			
			<p class="food_img_see">
				<img src="" id="food_img_path"
					onclick="popclose(&#39;#food_img&#39;)" >
			</p>
			<div id="cainame" class="ovh font15 cainame"></div>
			<div id="img_list_price_box"></div>
			<p id="food_desc"></p>
			<!--  <div id="ckepop" class="center"><a href="javascript:void(0);" onclick="shareQQ()" class="font14 clo3 nou share_sdk_button qq_sdk_button">QQ空间</a><a href="javascript:void(0);" onclick="shareSina()" class="font14 clo3 nou share_sdk_button sina_sdk_button">新浪微博</a></div> -->
		<div id="ckepop" class="center">
		<span class="clofe line25 food_price_dilog"></span><del class="yb-checkout-origin-price left">¥0.01</del>
		</div>
		</div>
	</div>
	
	
	<!--搜索框-->
	
	
	<div id="foot_search_box" class="font16"
		onclick="$(&#39;#foot_search_box&#39;).hide()" style="display: none">
		<div class="center bgf" style="padding: 20px 0 30px 0">
			<span class="center pointer font24 red"
				onclick="$(&#39;#foot_search_box&#39;).hide()">×</span><input
				type="text" id="foot_search_input" placeholder="按商品名搜索" class="ml10"
				style="width: 54%" onclick="event.stopPropagation();"
				onkeydown="if(event.keyCode==13){findGood()}"><input
				type="button" resid="7727" page="1" id="foot_search_btn"
				class="ml10 clof font15"
				style="width: 20%; height: 32px; line-height: 32px; background: #ff5556; border: none; border-radius: 3px;"
				value="搜索" onclick="findGood()">
		</div>
	</div>
	
	
	<!--购物车-->
	
	
	<div id="food_car" class="center clof pointer"
		style="position: fixed; bottom: 0px; height: 50px;display: none;">
		<div class="food_car_more" onclick="carItemShow()" style="z-index: 1">
			<span class="font12" id="all_count"></span>
		</div>
		<p class="clof left car_all font20"
			style="margin-left: 82px; text-align: left; display: inline-block; line-height: 50px;">
			<span class="orange fontb">¥<span id="price_count"></span></span><br>
			<!--<span class="font12 clo9">另需配送费¥<span id="need_delivery"></span></span>-->
		</p>
		<!--<p class="font12 left car_copies"><span id="sort_count"></span>样<span id="all_count"></span>份</p>-->
		<span id="car_btn" class="car_btn left" style="line-height: 50px">选好了</span><span
			class="right clofqingkong font16" onclick="emptyCars()"
			style="margin-right: 15px; line-height: 50px">清空</span>
			
			
			
		<!--购物车详情-->
		
		
		<div id="car_item" class="clof" style="display: none;">
			<table style="width: 96%; margin: 8px auto 5px; line-height: 26px;">
				<tbody id="car_item_tr"></tbody>
				<tbody>
					<tr id="car_item_tmp" data-id="" data-pack="" style="display: none">
						<td class="car_item_name"></td>
						<td width="120" align="center"><div class="right plus"
								style="margin-right: 20px;">+</div>
							<div class="right isnum">
								<div class="left cut clo0">-</div>
								<div class="left order_count_imglist"
									style="color: #fff; background-color: transparent;">0</div>
							</div></td>
						<td width="60" align="right">¥<span class="car_item_price"></span></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<!-- 多级属性选择框 -->
	<div id="food_attr_box" style="display: none">
		<div class="fullbg" onclick="$(this).parent().hide();"></div>
		<div id="attr_choose_box" class="pop" style="padding: 0"></div>
	</div>
	<!-- <footer>
		<table border="0" cellpadding="0" cellspacing="0" id="foot_menu">
			<tbody>
				<tr>
					<td id="foot_back" width="1" style="display: none;"><span
						class="footback" style="color: #b9b9b9"><div
								class="foot_ico foot_back"></div>返回</span></td>
					<td id="foot_home" width="1" data-name="foot_home"><a
						href="https://www.3cfood.com/homem3c4tx.html"><div
								class="foot_ico foot_home"></div>店铺</a></td>
					<td id="foot_goods" width="1" data-name="foot_goods"><span
						href="javascrpt:;" onclick="goFood()" class="hover"><div
								class="foot_ico foot_goods"></div>商品</span></td>
					<td id="foot_order" width="1" data-name="foot_order"><a
						href="https://www.3cfood.com/shopcarm3c4tx.html"><div
								class="foot_ico foot_order"></div>订单</a></td>
					<td id="foot_user" width="1" data-name="foot_user"><a
						href="https://www.3cfood.com/index/ucenter.html?wxt="><div
								class="foot_ico foot_user"></div>我的</a></td>
				</tr>
			</tbody>
		</table>
	</footer> -->
	<footer>
		<table border="0" cellpadding="0" cellspacing="0" id="foot_menu">
			<tbody>
				<tr>
					<td id="foot_back" width="1" style="display: none;"><span
						class="footback" style="color: #b9b9b9"><div
								class="foot_ico foot_back"></div>返回</span></td>
					<!-- <td id="foot_home" width="1" data-name="foot_home"><a
						href="https://www.3cfood.com/homem3c4tx.html"><div
								class="foot_ico foot_home"></div>店铺</a></td> -->
					<td id="foot_goods" width="1" data-name="foot_goods"><a
						href="/page/allcategory/process" class="hover"><div
								class="foot_ico foot_goods"></div>商品</a></td>
					<td id="foot_order" width="1" data-name="foot_order"><a
						href="/page/order/orderlist"><div
								class="foot_ico foot_order"></div>订单</a></td>
					<td id="foot_user" width="1" data-name="foot_user"><a
						href="/page/customer/process"><div
								class="foot_ico foot_user"></div>我的</a></td>
				</tr>
			</tbody>
		</table>
	</footer>
	<div id="toastok" style="display: none;" class="weui-toast  weui-toast--visible"><i class="weui-icon-success-no-circle weui-icon_toast"></i><p class="weui-toast_content">添加成功</p></div>
	
	
    
	<script type="text/javascript"> 	
	/* $(document.body).pullToRefresh(function () {
		 location.reload() ;
		// 下拉刷新触发时执行的操作放这里。
		// 从 v1.1.2 版本才支持回调函数，之前的版本只能通过事件监听
		}); */
		 
	 var GROUP = "/wap";
	var APP = ""; 
    var mySwiper = new Swiper ('.swiper-container', {
      // 滚动方向 horizontal/vertical
    direction: 'horizontal',
    // 自动播放
    autoplay:3000,
    // 是否循环播放
    loop: true,
    // 如果需要分页器（小圆点）
    // 是否需要分页器
    pagination: '.swiper-pagination',
    // 点击分页器是否切换到对应的图片 是 true 否 false
    paginationClickable:true,

    // 如果需要前进后退按钮
    nextButton: '.swiper-button-next',
    prevButton: '.swiper-button-prev',

     // 用户操作swiper之后，是否禁止autoplay。默认为true：停止。
    // 如果设置为false，用户操作swiper之后自动切换不会停止，每次都会重新启动autoplay。
    // 操作包括触碰，拖动，点击pagination等。
    autoplayDisableOnInteraction:false,
  })  

/* 

	 
        var has_si = "",
            si = "",
            foodUrl = "/resm3c4tx.html",
            actionName = "res";
        if(typeof(actionName) != "undefined" && actionName == "res"){
            if(typeof(has_si) != "undefined" && (has_si == 1 || has_si == "1")){
                if(typeof(si) != "undefined" && si != "undefined" && si != null && si != ''){
                    localStorage.setItem("si",si);
                    localStorage.removeItem("myfoodArr");
                }else{
                    localStorage.removeItem("si");
                }
            }else{
                localStorage.removeItem("si");
            }
            $("#foot_goods").find("span").addClass("hover");
        }else{

            $("#foot_goods").find("span").removeClass("hover");
        }
        function goFood(event){
            console.log(123);
            var si = localStorage.getItem("si"),
                url = "";
            if(typeof(si) == undefined || si == null || si == '' || si <= 0){
                url = foodUrl +"?param_t="+10000*Math.random();
            }else{
                url = foodUrl + "?si=" +si +"&param_t="+10000*Math.random();
            }
            window.location.href = "http://www.3cfood.com" + url;
            event.preventDefault();
        }
        // 平台返回
        function initPlatReturn(){
            // 初始化平台返回
            var getspread = $.parseJSON(getCookie("from_spread")),
                from_where=null;
            $("span.footback").removeClass("hover");
            if(getspread && getspread.hasOwnProperty("from_where")) {
                from_where = getspread['from_where'];
            }
            if (getspread && from_where){
                $("span.footback").click(function () {
                    try{
                        from_where += from_where.indexOf('position')>-1?'?id='+getspread['spread_token']+'&':'?';
                        location.href = from_where+Math.random();
                    }
                    catch (e){}
                    return false;
                });
                $('#foot_back').show();
                $('#foot_menu a').each(function () {
                    var href = $(this).prop('href');
                    $(this).prop('href', [href,href.indexOf('?')>-1?'&':'?','t=',getspread.spread_token,'&rnd=',Math.random()].join(""));
                })
            }
            // 初始化底部菜单的选中
            var urlstr = location.href;
            $("#foot_menu a").each(function () {
                if ((urlstr + '/').indexOf($(this).attr('href')) > -1 && $(this).attr('href')!='') {
                    $(this).addClass("hover");
                }
            });
        }
        initPlatReturn();  */
    </script>
 </div>
</body>
 <script src="./js/wap.min.js"></script> 
    <script src="./js/template.js"></script>
	<script src="./js/wap_menu.js"></script>
</html>