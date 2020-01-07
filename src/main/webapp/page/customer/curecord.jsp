<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- saved from url=(0044)http://masr8-26.pospal.cn/m/accountv4#/index -->
<html lang="zh">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport"
	content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<title>会员中心</title>
<link rel="shortcut icon" href="http://masr8-26.pospal.cn/favicon.ico">
<link href="./css/app.css" rel="stylesheet">

<script type="text/javascript">
	window.YB_RETURNURL = "";
	window.YB_INDUSTRY = "餐饮行业";
	window.YB_CURRENCYSYMBOL = "¥";
</script>
</head>

<body>

	<div id="app">
		<div data-v-bebda20a="" data-v-542e69d5="" id="accountIndex"
			data-route="default" class="yb-page yb-new-account">
			<div data-v-547ab184="" class="yb-page-inner">
				<div data-v-547ab184="" class="yb-integral">
					<div data-v-547ab184="" class="scroll-box">
					
					<c:choose> 

                      <c:when test="${fn:length(recordMap) <= 0}">   

 
                      

						 <div class="yb-myCouponNull">
							<div class="yb-null_img"></div>
							<div class="yb-null_text">
								<div class="yb-null_title">暂无消费记录</div>
								
							</div>
							<!-- <div class="yb-null_buttom">
								<a href="/page/allcategory/process">去储值</a>
							</div> -->
						</div>
						
						
						 
						 </c:when>      

                         <c:otherwise> 
					   <c:forEach items="${recordMap}" var="record">
					       
					  
                        <c:if test="${record.type eq '1'}">
						<div data-v-547ab184="" class="yb-interal_items"
							style="overflow-y: scroll;">
							<a data-v-547ab184="" href="#/balanceLogDetail" class=""><div
									data-v-547ab184="" class="yb-interal_item yb-itmes_access">
									<div data-v-547ab184="" class="yb-interal_item_hd">
										<svg data-v-21c0a497="" data-v-547ab184="" aria-hidden="true"
											class="svg-icon balance-svg">
											<img data-v-d6f17a64=""
										src="./img/in.png"
										class="topIcon">
											
											</svg>
									</div>
									<div data-v-547ab184="" class="yb-interal_item_bd">
										<div data-v-547ab184="">${record.title}</div>
										<div data-v-547ab184="" class="yb-interal_time"><fmt:formatDate value="${record.creattime}" pattern="yyyy-MM-dd HH:mm:ss" /> </div>
									</div>
									<div data-v-547ab184="" class="yb-interal_item_ft">
										<span data-v-547ab184="">+</span>${record.amount}
									</div>
								</div></a>
						</div>
						</c:if>
						 <c:if test="${record.type eq '-1'}">
						<div data-v-547ab184="" class="yb-interal_items"
							style="overflow-y: scroll;">
							<a data-v-547ab184="" href="/page/order/showdetails?number=${record.number}" class=""><div
									data-v-547ab184="" class="yb-interal_item yb-itmes_access">
									<div data-v-547ab184="" class="yb-interal_item_hd">
										<svg data-v-21c0a497="" data-v-547ab184="" aria-hidden="true"
											class="svg-icon balance-svg">
											<img data-v-d6f17a64=""
										src="./img/out.png"
										class="topIcon">
											
											</svg>
									</div>
									<div data-v-547ab184="" class="yb-interal_item_bd">
										<div data-v-547ab184="">${record.title}</div>
										<div data-v-547ab184="" class="yb-interal_time"><fmt:formatDate value="${record.creattime}" pattern="yyyy-MM-dd HH:mm:ss" /> </div>
									</div>
									<div data-v-547ab184="" class="yb-interal_item_ft">
										<span data-v-547ab184="">-</span>${record.amount}
									</div>
								</div></a>
						</div>
						
						</c:if>
						 </c:forEach>
					</c:otherwise> 

                   </c:choose>
						
						
					</div>
					
					
					
				</div>
			</div>
			<div data-v-1c47b319="" data-v-bebda20a="">
				<!-- <div data-v-1c47b319="" id="dragePay" class="yb-balance-pay">
					<a data-v-1c47b319="" href="http://masr8-26.pospal.cn/m/accountv4"><svg
							data-v-21c0a497="" data-v-1c47b319="" aria-hidden="true"
							class="svg-icon balance-svg">
							<use data-v-21c0a497="" xlink:href="#icon-qrcode"></use></svg>
						<div data-v-1c47b319="" class="balance-text">余额支付</div></a>
				</div> 
				 -->

				<div data-v-1c47b319="" class="yb-account-nav">
					<!-- <div data-v-1c47b319="" class="account-nav-item">
						<a data-v-1c47b319="" href="http://masr8-26.pospal.cn/m"><div
								data-v-1c47b319="" class="icon">
								<img data-v-1c47b319=""
									src="data:image/png;base64,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"
									alt="">
							</div>
							<p data-v-1c47b319="">首页</p></a>
					</div> -->
					<div data-v-1c47b319="" class="account-nav-item item-left"
						style="margin: 0px 0px 0px 13px;">
						<a data-v-1c47b319="" href="/page/allcategory/process"><div
								data-v-1c47b319="" class="icon">
								<img data-v-1c47b319=""
									src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHAAAABqCAYAAABkrdW2AAAD2ElEQVR42u2dy43bMBCGXUJKcAlbQkpICS4hJagEd2B14IWf8ClbggvIQSXkknOi2UiAQwxF06LEh74fIBY21jbJjxy+hqPVCiGEEEIIIYQQQihH7ff79eVyqdv0IX/l9eIq4Xg8fj2fz9VDRfik991u9yVGvuV3r9frr9vt9qdP8tqVn7asG1e5pD5Op9P3pBtEV5DmsQJeSe333GNAlArW8iPvD5XZt3wCtAX5lgw4qWzJ1Fhwj+lwOHyL0AArS4OqBj5zH9FQN0nAG1OIlAomvULLjwwJU5U/OkQZsxQT0XT2/m2VmUwzOmQ+fRq5NAKZE/g2kMknKwq8OvdJWF/hU4zD0qjNHisNPoneJ69ZiDy3VDFnuzHG/JXvdBvZTfXslss0nyWYzrnNtLm0iApwaKqNrEPQf2tmAOYH8AOAAAQgAAEIQAACEIAABCACIAABCEAAAhAtA6C4FMhne6+tHI6kukPZqk+vepplDdDmSyLniim7YrSVvg3l25I1QM2XJvXDYZcLoa9vS7YAxeS4vLVCOBNNAPDu8Pd8XwRAzRnKxxczllx5FssBwIwBSg9dBEDtDkIKntljxu1X/IKynsTY7iFEcfDxWD7YGl43e14vBmAPsS34bwPez5TXgpr7vZjOV5Y+RSzkFfe6JuVFvJh2I78/Fr+VZk7PE1/I16Eup5QEsDJa9TZVgOYYOObCZjEAzYW973oq1k6M77KhWICaGU3i8qOjwsfmsTSAm5QnM2Z5Q+zXFnceaN4VSGk/VOl9VejvzB6g2QtTOZUwNx1C5avIE3mzF8beldF2XwKWtTyA2kZ3rI1t7dA55NhcrE+Mduo996zU5jEQcpOhWIC2yptrUjPX7xftldYFD2q0U+8pJzZdOJBmjugbxbsV2o5v5L3QJrUPchfinA+AT5izx4BCY3qkNBIbuKn3ZRfj2NuZ09rlziB5kOMem3dYH8CnC8pXDwXmk14+tVfA4jyzbeNT6CRw59hAWKxrfaiwltoEac64ZYu/GyEmTnqLy0HKZXpjBWLlcosxGenvWUhPGoieu5X/mSqYHQAXJAACEIAABCAAAQhAAAIQgAAEIAABCEAAAhABEIAABCAAAYgACEAAAhCAAEQABCAAAQhAACIAFgMwnSd48gRrP0V/hq5IuT++Bs1zUuLD1TFMAM+Rf0HazeMoEYq1kCBz3a0rCd7YoHlje+FWu/os7wtg0r/UX4UL8byJ4IOx63kKpMH7iZskZlSuiO6k6SNtjFZnJhoAue/gJz1jl4Fari0/PuGL9Jk2TPAQQgghhBBCCCGEEIqmv1Qc2Exy81HwAAAAAElFTkSuQmCC"
									alt="">
							</div>
							<p data-v-1c47b319="" class="butttitle">商品</p></a>
					</div>
					<div data-v-1c47b319="" class="account-nav-item">
						<a data-v-1c47b319="" href="/page/order/orderlist"><div
								data-v-1c47b319="" class="icon">
								<img data-v-1c47b319=""
									src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHAAAAByCAYAAACLKFVAAAAB8ElEQVR42u3c4U2DQBiA4Y7gCI7gCI7gCI7iCN0AN8BAgPCvIziCI7iB8sWa0AZISKhw+LwJiTFoCY/F0+M4HCRJkiRJkiRJs6qq6qVpms+2bb9s41td16eyLB83hZfn+T2ceYibAoyfKDDzNoAAbwe4uUvEBgIIECBAgAABAgQIECBAgAABAgQIECBAgAABAgQIECBAgAABAgQIEGBCgFmW3cWNwfF1CW2vcdwAu+Jk7P0G3b0DnvZ+f+euAYuieEr0HXgEeC7P84f4PiltBjFGoQABAgQIECBAgAABAgQIECBAgP8EMB6PEv/CA5gYYMzj9WdAuo8/bg25a8A4eUs/5amqqvexCdeYRbjeP15/aN+YKRk7tu41ngH+nNC3W0z3jJ3gwB3af2iGYWqucgwd4EqAQ5fRKcC49AI8DyaWnJWPd8bUZGvcfzN0yR27vA+Bx+fm/N40iFm4/tMV4wow5wYlgxh/BwIECBAgQIAAAQIECBAgQIAAAa4IaG1EwoBWJyUOaH1g+oBW6KYMaI28UahRKECAAAECBAgQIECAAAECBAgQoAACBAgQIECAAAECBAgQIECAAAECBAgQIECACxQ3uPafJxZrHZBddvVwvePmDjAQ4534V49vTK3f8zN3VZMkSZIkSZIkSdJ6fQOMgvRliUzKMQAAAABJRU5ErkJggg=="
									alt="">
							</div>
							<p data-v-1c47b319="" class="butttitle">订单</p></a>
					</div>
					<div data-v-1c47b319="" class="account-nav-item account-nav-active"
						style="margin: 0px 13px 0px 0px;">
						<a data-v-1c47b319="" href="/page/customer/process"><div
								data-v-1c47b319="" class="icon">
								<!-- <img data-v-1c47b319=""
									src="data:image/png;base64,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"
									alt=""> -->
								<img data-v-1c47b319=""
									src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHEAAABpCAYAAAAN+8wmAAADpElEQVR42u2dPWsUQRjH8xEOJOeWfgQra8EvoK2FpBH0biP2Nqm1SWNhpWXKWAlWAcFOtNE2gsLl0qhBTVTMOs/gybrskt152Z2Z/f1giiQkgfnneZ+ZrK0BAAAAAAAAAAB45ePNycXl7XNXl3eyrbq1yLPL+7eyC+xUQLzemEwWs2xjMZ/uFpvXi7ZrmWfvD2fr2yI6uzigeGJZXYRrWgf59I38IbCrPeJKvFoxlbtlhz3HO9loHwKWl7hZdtuH9alkxbd4VasUl83OO0LiVZ8CImQiAiKkwxg4pIBlIVHDtIRQtVwIIpLsGHI4z56EIuBqUX50iYNqs0ITELfa1QrzbC9EEbU10tmJ1wrLPVdUijAWVhdN8zMIXUAy1chdKS61TX/U03TCx2KwHGFWSs3Ykj7GTM5cqvIaKBZpUoOIiIiIiIiIiNhLiRHQ6AkRx1Bi0AhvEHG2vh2LiPRPm9puA5+n6bJQqwFpZUXhSufTXdSKvGtDPEzApXKE8Qxkg5glplAvBjySYgQVeeFPgd81NgY25ee4YgLFP8W9jUV2vMZNSRFotjpk7YiADoUcwiIRMPIYSQz0nLX6LD/E4unIRNoQkFkmxxCHipUqbtkkPnL3A/ECQdphIqjEzaYTAiK2fG31PBi7BgAASSY4Unr8fQ5T4l7jUomMjonyMiNxcfisVAvioGbUCY9KiBC1j0Lf4F1T07KDjo1jqxtq0q8bAPRP4xSv7no3rtbAbQZ5SEpZJmdsWnRdYriPwVmbBlw8Svv18Y3i+Pn94tf+S73KnH76oD/349VO8W1ns/i8dcnaKpl2lAW0iH0i3M93zwoTfi/eFt+f3mPuaIvpC1JiTWJdLjg9OdIWzAkAg+zTJP6JG6y6yrLLPHnxSAt89PDaf98nH8taudsmMcWyEbIlJjNAbX1qo6tInPvy4ErnjRdXWmfN8vMQ0oMLFQHrNts2QfknZuWPQ+KlUeaqErT0BTQ97OTI7XVx0zphItlxWEaULMSF9TUt7UotRZQOT5Llh+0t4FVi0kcxL+5VEiCb35fkbeKYXsZw1tlJKT4ezM/fHZuASd0qDv3mbx+zyVG31FJZUU8+YnnSBGvECtO1xrHHwiSsMaYnvshUHTa4U19RNchJaBLo4oy5uE/GpYbw4gWtOEsQK/K34UL5P8DBiphne2nPDEey6NKQ3IR5fmZ0pUbo9zrGOPxFxDGWGaHf5UBEREREAAAAAAAAAAAACIE/AisouRA1V5EAAAAASUVORK5CYII="
									alt="">
							</div>
							<p data-v-1c47b319="" class="butttitle">我的</p></a>
					</div>
				</div>

			</div>

		</div>
	</div>
	<!-- <script type="text/javascript" src="./js/manifest.js"></script>

	<script type="text/javascript" src="./js/app.js"></script> -->




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
</html>