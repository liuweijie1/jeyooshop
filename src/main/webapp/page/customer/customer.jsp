<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<div data-v-bebda20a="" class="yb-page-inner">
			
				<div data-v-bebda20a="" class="page">
					<div data-v-5a777799="" data-v-bebda20a=""
						class="weui-cells yb-menber ">
						<div data-v-5a777799="" class="weui-cell">
							<div data-v-5a777799="" class="weui-cell__hd yb-menber_headImg">
								<img data-v-5a777799=""
									src="data:image/png;base64,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"
									onerror="this.src=&quot;data:image/png;base64,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&quot;"
									alt="" class="weui-media-box__thumb">
							</div>
							<div data-v-5a777799="" id="CustomerName"
								class="weui-cell__bd yb-menber_name">18396861925</div>
							<a data-v-5a777799=""
								href="http://masr8-26.pospal.cn/m/accountv4#/setting"
								class="weui-cell__ft yb-menber_set"> 设置 </a>
						</div>
					</div>
					<div data-v-9d601076="" data-v-bebda20a="" class="yb-mian my-main">
						<div data-v-9d601076="" class="ppl_row">
							<div data-v-9d601076="" class="yb-card_img">
								<img data-v-9d601076="" src="./img/vip.png"
									onerror="this.src=&#39;//imgw.pospal.cn/account/accountV4/img/newcardbackground.png&#39;"
									alt="会员卡">
								<!---->
								 <button class="myorder_state_btn" onclick="getmember()">领取会员</button>
							</div>
						</div>
					</div>
					<div data-v-d6f17a64="" data-v-bebda20a="" class="yb-account_hd">
						<div data-v-d6f17a64="" class="yb-bounceInLeft">
							<a data-v-d6f17a64=""
								href="/page/customer/record"
								class="yb-mypromotion"><div data-v-d6f17a64=""
									class="yb-fontGray">
									<img data-v-d6f17a64=""
										src="data:image/png;base64,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"
										class="topIcon">
								</div>
								<div data-v-d6f17a64="" class="yb-fontGray">余额</div>
								<div data-v-d6f17a64="" class="yb-fontRed">
									<span data-v-d6f17a64="" id="cM">0</span>
								</div>
								<div data-v-d6f17a64="" class="Segmentingline"></div></a> <a
								data-v-d6f17a64=""
								href="http://masr8-26.pospal.cn/m/accountv4#/myCoupon"
								class="yb-mypromotion"><div data-v-d6f17a64=""
									class="yb-fontGray">
									<img data-v-d6f17a64=""
										src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAFpOLgnAAAAAXNSR0IArs4c6QAAAv1JREFUaAXtWs1u00AQrivDIXcOiEtRJF6m4hV6q/ICTXIDlwMiCS8QoV54hQIPgxLRE0hwzwGkhG+szGo9Wa+z8azjWLUU7c/sfvM/6657duZ7hsPhRtJ5LuGOXJCPy4g0f+7cUTVZhli1z0NPiBYBl1l6oZP5fP5ksVj85dWe9uNsNhvmdC+khVBYVxhYi8q6tD5lYuhm3rdXS+CHhcNe8NaiZDQa/d5sNs+sOWcXps7jwklUnTws/EL8EWzacJFgUn8lECY7T5Jkp6aINYXhXjrsGGVnooB5EgME7I/xePxaS1iXSVK472I6nd5rMXHh7OVB18agOVs9ux8E4llMmKYo8roYjHaYaFckEroRn6TI9dsYJmLzU5sifDO09Kt9mEth2fSNmKtw7CD7PyA5x6SV1gN3TLSwjo9Dx84MYtxoiALT/On3+y8Gg8E/G4+S8YajwCYc0qdqvlwuv2PvS3u/anRNJpN7quo2A+qrMpHgPO4OE1OFNRPRLi+UjIYJZbpWlLEvqCWGjfjEaMJcbSm0+gUmj+aqMmt3zJWHsJ08VarXosdiRLgFn9SSEpuloJwS6hlPwAzOQqtqQqBSG5ozr0Sowj9RMa9xun0lgsaD4/gShfeTYZJl2dPVavWAyecaDAgDQv/q9XoXWniPOCdlAbp2yhBPb9ssNWL0dvtXVKmYdFOQK4GFwXc4pahKBMhGhl5vZcx8sKY4QuugiygfqBYtRCajiBbzY+F0RhHnkbg9VN7BuleIT7WDpY63nEctDipgfsZh9capiHUyXuJl4FsdAWLupWN9vV5/gbxXztBiL7RZCTIQv+uQvE5FYloxFrYztJiZKy6Z1rbWq4h8WW6b8CQPG9urCC9qowJSJq8ip+SRziQ7vSg+kJs0v2NJtzcxTnE3/Aof69+jFt8hJyq/Ijch1CE80u0FN/03Af3ypw1JXiWDzF9vsrNix2ylwGUKtl6RMsGlcVuriPSEFFyOzX2QTdD8DGDjxuqj8nboW18sKzWN+x+o2jSL2OsXFAAAAABJRU5ErkJggg=="
										class="topIcon">
								</div>
								<div data-v-d6f17a64="" class="yb-fontGray"><del class="del-font">卡券</del></div>
								<div data-v-d6f17a64="" class="yb-fontRed">0</div>
								<div data-v-d6f17a64="" class="Segmentingline"></div></a> <a
								data-v-d6f17a64=""
								href="http://masr8-26.pospal.cn/m/accountv4#/integral"
								class="yb-mypromotion"><div data-v-d6f17a64=""
									class="yb-mypromotion">
									<div data-v-d6f17a64="" class="yb-fontGray">
										<img data-v-d6f17a64=""
											src="data:image/png;base64,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"
											class="topIcon">
									</div>
									<div data-v-d6f17a64="" class="yb-fontGray"><del class="del-font">积分</del></div>
									<div data-v-d6f17a64="" id="cP" class="yb-fontRed">0</div>
								</div></a>
						</div>
					</div>
					<div data-v-29e47ff9="" data-v-bebda20a="">
						<!---->
						<div data-v-29e47ff9="" class="weui-cells yb-listBlock">
							<a data-v-29e47ff9=""
								href="/page/order/orderlist"
								class="weui-cell weui-cell_access yb-itemContent"><div
									data-v-29e47ff9="" class="weui-cell__hd">
									<img data-v-29e47ff9=""
										src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACoAAAAoCAYAAACIC2hQAAAAAXNSR0IArs4c6QAAAfJJREFUWAntWD1LA0EQvTuTJmATbAK21oK2KdKJWtrZJ4WVFjm0u065FFpZnKT1F/jRpskPsBZsDNilEJJG4fJGdmHv2D0nuYM0s7DZ3dk3b+besgNZz5NWrQJ+EV0YhtvYj9E7aZq2ctibwWBwlbMVLvv9/jUAlybI9/0vrEfoYRzHE3PPnDsTpSSR3BvATdPBnCPIA9a3jUbjPYqiX3NPz2GvzefzHawvwNfVdss4Bd+uK9maxUGbSMkmnF8x9kwCfMQZgt6pwN3ZbOZBLe2XGWnPaD/gOwfXvbapU0vAdQgbxTzVe+YYmIvcvKPWmSTJRoGCINhH0CH6B7pVTcLSnsIM6/X6npmk4qLj7tEcrfP3u8wPFEqpL+NTBvtfvCJFy8St3FcSrVpSUbRqRYvqaCYW6t0zat1RxlhygbL1gnJ1zKFZ99Gzyx9bUe6Xc9RZBbNuRdk5S6JsqZhAUZQpFBvGvvVSR5mashWVOspUVG49Uyg2TBRlS8UEsm+91NGqFZU6ylRUbj1TKDbMqSj+IdK7pade29iEqwB1DB3TxuFMFOCRckg0kY2grE1xJ4pn5OIrqqMhnA7Uu+Wn6/3TRcy1g19Dp5hQTGvbsFphHI/H3+12+xHH0ULfgmnThS1jp+NGf0I/QQmclOES32UUWAAmm5yRlVbcbwAAAABJRU5ErkJggg=="
										alt="">
								</div>
								<div data-v-29e47ff9=""
									class="weui-cell__bd weui-cell_primary yb-item">
									<p data-v-29e47ff9="">我的订单</p>
								</div> <span data-v-29e47ff9="" class="weui-cell__ft"></span></a>
						
					<!-- 		<a data-v-29e47ff9=""
								href="http://masr8-26.pospal.cn/m/accountv4#/coupon"
								class="weui-cell weui-cell_access yb-itemContent"><div
									data-v-29e47ff9="" class="weui-cell__hd">
									<img data-v-29e47ff9=""
										src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACoAAAAoCAYAAACIC2hQAAAAAXNSR0IArs4c6QAAAupJREFUWAntmD2LE1EUhjeJhEAU0UKwcFv1J4iNFhos1sZKEGIhFmuaLfKBAQlCJB/FNlEQFHZBsNpashZrI/gP1HaFLSy02A2EQBKfM95zzWZmw2Rmkl0wC8O9c+ae8z73vXMnM7u0tPhbOLBw4P9yIKbTrVQqFzqdzqtYLJYZDoenNX4cLQwHMLTT6fQqXD+F4ZSCAPmG/goDNHRsrTHqHkxJIO4KiAVlFrcEMplMLler1R9BKAuFwh41LjabTbtSQeqUy+VLvV5vV5g0P64dBFLSDwqpdaJolUGZpKYFjUJgljXs0kck8o7lOhtRrUNlIgVtNBqFQ9UjPIl06fP5/FM2VC1CPlvKBVoqlW7Yq1N2WPYcG6A4ZZpruBeDa+n7/f4OrmzG4/G1Wq3221VlhgEAzw0Gg3UYsuMy1tFEIpEB7jmu7ONKloT3tKGeh+Nik85Fy2hmhUFYhElzrKO4t01wu1gsvqX9QmKGGa7Sf6mDZ9mKlmgCucdxrV6v747qWUc1KAOYzRM5J9Fp9dosW9zMSX20c+OQTtxLPJVKfSTeB/QKLwXye+vrDyeuslznfQ0eGWQ0LhPqG+2Rq3+7LkddI05IwBO02+3Ky0ACh74x255fVlbgKzv2l9/xOs5ofBdNo62XbOsCZTMtc7/oBmrZkTPucG86Wmi3hGFczj5+2HW3ceQ6xxrHGdxsc1PfofX9ghrmNQ/NGIAfaGXn73Osc3w2T6N/b08sWZvZPDOQ8sC/Pw3kuAPTnouW0dwUBmERJq1jn6MaYNfeZBaf9HyerfklfMjqbgC5M6rtukfDQOJEC2fqowJB+l4MLkeDFNYcPkFeaD/q1uVoGAE2U4PjdZgaR+VGCorIA5b/8VFiYeJRg4ZhmZhrQdkEXRkpn6oTM+ZwURmUSSTtZmLJ5EVkRb6n+aQIhEMNJ4983z8SXkIwOGHD5PSto/z75BGRLWZx4JU8z5hh2DJM85ReaC0cWDhwYhz4AwXXNKVcB6ycAAAAAElFTkSuQmCC"
										alt="">
								</div>
								<div data-v-29e47ff9=""
									class="weui-cell__bd weui-cell_primary yb-item">
									<p data-v-29e47ff9="">卡券中心</p>
								</div> <span data-v-29e47ff9="" class="weui-cell__ft"></span></a> -->
							<!---->
							<!---->
						</div>
					<!-- 	<div data-v-29e47ff9="" class="weui-cells yb-listBlock" style="">
							<a data-v-29e47ff9="" href="javascript:;"
								class="weui-cell weui-cell_access yb-itemContent action-weui-cell"><div
									data-v-29e47ff9="" class="weui-cell__hd">
									<img data-v-29e47ff9=""
										src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACoAAAAoCAYAAACIC2hQAAAAAXNSR0IArs4c6QAAAzJJREFUWAntl81LVFEYxr3zYSoZmBIYYxANSUFUBkEw/4AEtiiiVrqIpI2LQR2HkXKhOeO0GihKaFvgQoKiWgjmwggEMUKCNmIMucqo0GGYr36vei5i9+ZxxqGke+D1nPu8X895zpmLt6LCGf+pAsZO9x2JRJqy2eyZQqGwVFNTMzswMJDXqUFcVSqVaiG2zuVyvRseHv6qk6ditInSaP/q6uooBK+byYYxaxhGRywW+6AwqzkUCrWS9xA7In5y8tjd6urqO7obdVkVtsIUSRp8x/8cW6BxC/aSZoescgTr6emRmHFMSM5hr7FsPp/vR+Fu1lpDi2hfX5+fRtcg+bOysvJsPB5v8/v9zTxPgfvYRNSqGz5CDDmFKuYH5EluK0d/UeIhG2GTWhy0gmjUTF25JpODg4ML0qSzszPj9XrbWabxd4hygm8e4XC4Hd85sEWfzxdUvmg0OiEYdiCTyTQq/E+zFlHU+CJFaHoqkUjsUwWHhoYW8SV4lk3cVrjMY2Nj7lwu1y9rYiJdXV1pWcvo7e09zCSWrq+vXxZsu6FFlF/oHM3mKXY0mUxOoNQFVdjtdsdZp7A28JMKn5mZucr6GHmfeDs8FVyOmR/WJZaTmBffeDAYlNxthxZRChYgdIV5CVUDvJ7ectTzKBNGtQbwx3QywEOqI9jamvked/g88bGVlZXP3Mtn1DhOnGz+lorfbtZ+PUkhiNVSvJtGNzA5urUB9o3nOh7SHo+nCTInsClxbvKp2I9g93k1PULh7Bqo8cckuvGuk1+oTyOv7CFsJond5B39SpqZRw/Bf4akEBPBhJOsZXjWp3WHrHnPmSor305m7mJht+psPl1T0Z2Q+RuxDtHdVt28j+pu7XaDUuup38yeOXrbDYvCxahcrrw9o6hD1PZOFelwFC1SONs0R1FbaYp0OIoWKZxtmqOorTRFOhxFixTONs1WUb4AlySLT+Syf5WqHqqnFVtbogS/2UgYVYWsCpSKbdRWX5uq529lzf/wt3qkAF+B78EPbvWV6XkZRU+PjIwkreq7rUDBpqenfwQCgSckN2INQLV2saXgctzYC+yyHclS6ju5dgr8ArhLUwdB7LETAAAAAElFTkSuQmCC"
										alt="">
								</div>
								<div data-v-29e47ff9=""
									class="weui-cell__bd weui-cell_primary yb-item">
									<p data-v-29e47ff9="">活动中心</p>
								</div> <span data-v-29e47ff9="" class="weui-cell__ft"></span></a>
							<div data-v-29e47ff9="" class="yb-action-type">
								<ul data-v-29e47ff9="" id="actionBox">
									
									<li data-v-29e47ff9=""><a data-v-29e47ff9=""
										href="http://masr8-26.pospal.cn/m/accountv4#/sale"><img
											data-v-29e47ff9=""
											src="data:image/png;base64,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"
											alt="">
											<p data-v-29e47ff9="">打折促销</p></a></li>
									
									
									
									
									
								</ul>
							</div>
						</div> -->
						<div data-v-29e47ff9="" class="weui-cells yb-listBlock">
							<!---->
							<!-- <a data-v-29e47ff9=""
								href="http://masr8-26.pospal.cn/m/accountv4#/level"
								class="weui-cell weui-cell_access yb-itemContent"><div
									data-v-29e47ff9="" class="weui-cell__hd">
									<img data-v-29e47ff9=""
										src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACoAAAAoCAYAAACIC2hQAAAAAXNSR0IArs4c6QAAARJJREFUWAntmN0NwyAMhEPVMbpQF+kGKDNEbNBFulD3SLkHJGJhEYsjfXGlSPEP5vqRmIhl8R+XQOCWO19tXdfnvu/vfD3qUSGEb75e27Z9av+tNq68b4nE/BCOmNRyl46r7EIypXRY1RhjDh0pQ9PfiFqBuFArsV6+E+0RssZpb721L1qF0pYeva/VVuBDzCpM5tOIFpFn+6IU0rNpRHsTjcZd6ChBOd6JSiKjthMdJSjHq3109k4jhfRsdemxm5QmXheBD7Had8W9SrSInLXTWP+cStRaaHa+C2UTdqJOlE2AXc+fUSfKJsCu58+oE2UTYNdTv0dxlo5vUpwAy0kRa/lm5qsvEw78NUGINYROzf8B+uuIvReflD4AAAAASUVORK5CYII="
										alt="">
								</div>
								<div data-v-29e47ff9=""
									class="weui-cell__bd weui-cell_primary yb-item">
									<p data-v-29e47ff9="">会员权益</p>
								</div> <span data-v-29e47ff9="" class="weui-cell__ft"></span></a> --> 
								<a
								data-v-29e47ff9=""
								href="http://masr8-26.pospal.cn/m/accountv4#/location"
								class="weui-cell weui-cell_access yb-itemContent"><div
									data-v-29e47ff9="" class="weui-cell__hd">
									<img data-v-29e47ff9="" src="./img/address@2x.png"
										alt="">
								</div>
								<div data-v-29e47ff9=""
									class="weui-cell__bd weui-cell_primary yb-item">
									<p data-v-29e47ff9="">商家地址</p>
								</div> <span data-v-29e47ff9="" class="weui-cell__ft"></span></a> <a
								data-v-29e47ff9=""
								href="http://masr8-26.pospal.cn/m/feedback/indexnew"
								class="weui-cell weui-cell_access yb-itemContent"><div
									data-v-29e47ff9="" class="weui-cell__hd">
									<img data-v-29e47ff9=""
										src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACoAAAAoCAYAAACIC2hQAAAAAXNSR0IArs4c6QAAA4NJREFUWAntmF9IU1Ecxze3GUyCnspA31NCCYygnvIlsucIjYSSekgYhbh/WonNP5s9CJGpFZSBxuqhoKDHhQ9FDBHMl9B6WOlDVA+VZM6tz2/dMy7XaW53ptAOnP3O+d3z+/0+93vOvc5ZLIVWUKCgwP+lgFXdbkdHR/HCwkIn88ZkMrlb+TfDWq3WeeqOOJ3Oy3D9Ega7AhFIAD1qvplWE8oDk2B45SMNyrhRHEVFRfXBYPCBjDertba2Hqd2mC5MKdAiBaO2O5FI3GThGeX/19bj8TRQc0DqKiYZ6xWVubQd9DvAnrTZbGd7e3vfpbwb/NHW1la+tLQ0iFB1mUqlFVUXZes5zJ+Y1xI05Xa7W8LhsE1dz7dFNSs1zgM5zbiO2l8R6LSxzgpQOZ8srCDgPoFO+rVoNPrK7/dXGYPNzn0+3x4gx6lxg76dmo/sdnsFu3jXmDvT1lt6eno+s7DR6/WOLi8vD5KkhjuOkjRUVlZ21eVyLRoTZTMfGhpyzM7OuuPx+CXitgE4h20OhUKPV8uzQlH9Qu7seUlJyV5810lmA7gtFotNosQh/bpsxtxszczMTJRcAeKKyXuLXrkWpOTPqKi+MC/c78xdwI2hwG3GldhxHrYBCvgo8E2/frUxeZzau/oCa2zEzvA8yMMaWS1G719TUf1CjsNL1N1H8k78cXozqkwDnPEp1cdyhGqBnGJ9i/iB7CstLa1aL6TE/FVRWaSa9ufsCg/WQ86sqHuA/gzYUR7Aft4SLcAcBiSJP8JNBfE1c86btByT2CZ2YUKbr9usW1F9xu7u7jeoexCgi/h/0BuAeQ3kCcY7sbtkjG8C28S6n3Q/Mfv7+vqyhpTaWSkqAaqhboJxf3t7+5PFxcUXjMuBGXc4HPWobQXwHr5afHOofZij81bF5mJzUlRfKBAIvAemWHxAnurq6vrI1n5g21MvbYDtZiElt2lQSUITdS0ouSxWGoApHzeR9v25kttnzltvKBdhXk8f5j15Trs2rNmIZk2ZfIG6oTiCikexMR3RF8ZyzXTLy9bLmWSLq+lj9Hmty7harpmmJEG+FLVoQPJdckNaXhTdEDJD0gKoQRDT04KipiU0JCgoahDE9DStqLykJRv/Vx8zndVkAsWgmCSd/oU/wtzDF92nfBE2WcpcOAwqgTClWhpUfpDSfuvZUj+SKdCCLSiw1RX4DWWjclUsnRCPAAAAAElFTkSuQmCC"
										alt="">
								</div>
								<div data-v-29e47ff9=""
									class="weui-cell__bd weui-cell_primary yb-item">
									<p data-v-29e47ff9="">反馈通道</p>
								</div> <span data-v-29e47ff9="" class="weui-cell__ft"></span></a>
								
								
							<!---->
						</div>
						<!---->
					</div>
					
					<div data-v-7c1af045="" style="text-align: center;width: 16.95rem;height: 2.1rem;background: #ff6d5a;margin: 1.5rem auto 1rem;color: #fff;font-size: 16px;background: #fff;box-shadow: 0 1px 1px 0 rgba(0, 0, 0, .1);line-height: 2.1rem;border-radius: 4px;">
					<a style="color: #3a3c4c;" data-v-7c1af045="" href="javascript:;">退出账户</a></div>
					
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
					<div data-v-1c47b319="" class="account-nav-item item-left" style="margin: 0px 0px 0px 13px;">
						<a data-v-1c47b319=""
							href="/page/allcategory/process"><div
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
					<div data-v-1c47b319="" class="account-nav-item account-nav-active" style="margin: 0px 13px 0px 0px;">
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
 <script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
<script src="./js/member.js"></script>
</html>