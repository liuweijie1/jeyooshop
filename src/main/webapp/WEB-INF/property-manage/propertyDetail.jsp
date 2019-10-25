<%@ page import="com.house730.admin.resultpojo.PropertyReleaseResult" %>
<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta http-equiv="Expires" content="0">
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Cache-control" content="no-cache">
	<meta http-equiv="Cache" content="no-cache">
	<title>放盤管理/放盤詳情</title>
	<link rel="stylesheet" href="/static/css/layui.css">
	<link rel="stylesheet" href="/static-res/viewer/css/viewer.min.css">
	<style type="text/css">
		.fOrange{
			color:#ff761a
		}
		.layui-body{
			background-color:  	#f3f3f4;
		}
		#layui-input-width{
			width:250px;
		}
		.layui-label-width{
			width:400px !important;
			text-align: left !important;
			margin-left: 50px;
		}
		.layui-label-width1{
			width:250px !important;
			text-align: left !important;
			background-color: #c4d4e5;
		}
		.layui-label1-width{

			width:100px !important;
		}
		.layui-label-ck{
			width:0 !important;
		}
		.layui-inline-width{
			width:120px !important;
		}
		.checkOrder{
			width:500px !important;
		}
		.checkOrder1{
			width:300px !important;
		}
		.layui-row1{
			border-bottom: 1px solid #C0C0C0;
		}
		.carousel-ul li{
			float: left;
		}
		.carousel-ul{
			text-align: center;
		}

		ul.imglist {
            margin: 0 auto;
            width: 536px;
            overflow: hidden
        }

        ul.imglist li {
            float: left;
            padding: 4px 8px;
            width: 160px
        }

        ul.imglist li img {
            display: block;
            width: 160px;
            height: 90px
        }
        .layui-laydate-content tbody{
        	font-size: 14px;
        }
        
	</style>

	<script type="text/javascript" src="/static-res/js/jquery/jquery-3.4.0.min.js"></script>
</head>
<jsp:include page="../include/header.jsp"/>
<body class="layui-layout-body">
<input type="hidden" name="" id="propertyId" value="${releaseResult.propertyid }">
<div class="layui-layout layui-layout-admin">
	<div class="layui-body">
		<!-- 内容主体区域 -->
		<div style="padding: 15px;">
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
				<legend>放盤管理/放盤詳情</legend>
			</fieldset>
			<div class="layui-row layui-col-space15">
				<div class="layui-col-md8">
					<div class="layui-card">
						<!-- <div class="layui-card-header">卡片面板</div> -->
						<div class="layui-card-body">
							<label style="font-weight:bold;margin-left:15px;">${releaseResult.regionname}</label>
							<label style="font-weight:bold;margin-left:15px;">${releaseResult.estatename}</label>
							<label style="font-weight:bold;padding:9px 15px;">${releaseResult.rentaltype==1?"放售":releaseResult.rentaltype==2?"放租":"/"}</label>
							<label style="font-weight:bold;margin-left:15px;">${releaseResult.titlecn}</label>
							<c:if test="${releaseResult.propertyno!=null and releaseResult.propertyno!=''}">
								<div class="layui-row layui-row1">
									<div class="layui-inline">
										<label class="layui-form-label layui-label-width1" >物業編號(由代理提供):</label>
										<div class="layui-input-inline">
											<!-- <label class="layui-form-label layui-label-width" >會員編號:</label> -->
												<%-- <input type="tel" name="userid"  autocomplete="off" class="layui-input checkOrder" value="${userOrder.userid }" > --%>
											<label class="layui-form-label layui-label-width" >${releaseResult.propertyno }</label>
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${releaseResult.propertyid !=null}">
								<div class="layui-row layui-row1">
									<div class="layui-inline">
										<label class="layui-form-label layui-label-width1">HOUSE730樓盤編號：</label>
										<div class="layui-input-inline">
											<!-- <label class="layui-form-label layui-label-width" >會員編號:</label> -->
												<%-- <input type="tel" name="userid"  autocomplete="off" class="layui-input checkOrder" value="${userOrder.userid }" > --%>
											<label class="layui-form-label layui-label-width">${releaseResult.propertyid }</label>
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${releaseResult.propertystatus!=null}">
								<div class="layui-row layui-row1">
									<div class="layui-inline">
										<label class="layui-form-label layui-label-width1">樓盤狀態：</label>
										<div class="layui-input-inline">
												<%-- <input type="tel" name="orderid"  autocomplete="off" class="layui-input checkOrder" value="${userOrder.orderid }"> --%>
											<label class="layui-form-label layui-label-width" >
													${releaseResult.propertystatus=="0"?"封盤":(releaseResult.propertystatus=="1"?"待售/租":(releaseResult.propertystatus == "3"?"已售/租":releaseResult.propertystatus)) }
												<span style="color: #c2ccd1">&nbsp;&nbsp;${releaseResult.toptype=="1"?"超级置頂盤":"" }</span>
											</label>
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${releaseResult.estateaddress!=null and releaseResult.estateaddress!=''}">
								<div class="layui-row layui-row1">
									<div class="layui-inline">
										<label class="layui-form-label layui-label-width1 classwidth1" >物業地址：</label>
										<div class="layui-input-inline">
											<label class="layui-form-label layui-label-width classwidth" >${releaseResult.estateaddress }</label>
										</div>
									</div>
								</div>
							</c:if>

							<c:if test="${releaseResult.rentaltype!=null}">
								<c:if test="${releaseResult.rentaltype ==2 and releaseResult.rentprice!=null and releaseResult.rentprice!='0.00'}">
									<div class="layui-row layui-row1">
										<div class="layui-inline">
											<label class="layui-form-label layui-label-width1">租價：</label>
											<div class="layui-input-inline">
													<%-- <input type="tel" name="item"  autocomplete="off" class="layui-input checkOrder" value="${userOrder.item }"> --%>
												<label class="layui-form-label layui-label-width">$${releaseResult.rentprice}</label>
											</div>
										</div>
									</div>
								</c:if>
								<c:if test="${releaseResult.rentaltype == 1 and releaseResult.saleprice!=null and releaseResult.saleprice!='0.00'}">
									<div class="layui-row layui-row1">
										<div class="layui-inline">
											<label class="layui-form-label layui-label-width1">售價：</label>
											<div class="layui-input-inline">
													<%-- <input type="tel" name="item"  autocomplete="off" class="layui-input checkOrder" value="${userOrder.item }"> --%>
												<label class="layui-form-label layui-label-width">$${releaseResult.saleprice/10000 }萬</label>
											</div>
										</div>
									</div>
								</c:if>
							</c:if>
							<c:if test="${releaseResult.buildingavgprice!=null and releaseResult.buildingavgprice!='0.00'}">
								<div class="layui-row layui-row1">
									<div class="layui-inline">
										<label class="layui-form-label layui-label-width1" > 呎價(建築)：</label>
										<div class="layui-input-inline">
											<label class="layui-form-label layui-label-width" >@$${releaseResult.buildingavgprice }</label>
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${releaseResult.saleableavgprice!=null and releaseResult.saleableavgprice!='0.00'}">
								<div class="layui-row layui-row1">
									<div class="layui-inline">
										<label class="layui-form-label layui-label-width1" >呎價(實用)：</label>
										<div class="layui-input-inline">
											<label class="layui-form-label layui-label-width" >@$${releaseResult.saleableavgprice}</label>
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${releaseResult.floor!=null}">
								<div class="layui-row layui-row1">
									<div class="layui-inline">
										<label class="layui-form-label layui-label-width1" >層數：</label>
										<div class="layui-input-inline">
											<label class="layui-form-label layui-label-width" >${releaseResult.floor}</label>
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${releaseResult.room!=null}">
								<div class="layui-row layui-row1">
									<div class="layui-inline">
										<label class="layui-form-label layui-label-width1" >房間：</label>
										<div class="layui-input-inline">
											<label class="layui-form-label layui-label-width" >${releaseResult.room}</label>
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${releaseResult.buildingarea!=null and releaseResult.buildingarea!='0.00'}">
								<div class="layui-row layui-row1">
									<div class="layui-inline">
										<label class="layui-form-label layui-label-width1" > 建築面積(呎)：</label>
										<div class="layui-input-inline">
											<label class="layui-form-label layui-label-width" > ${releaseResult.buildingarea}</label>
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${releaseResult.saleablearea!=null and releaseResult.saleablearea!='0.00'}">
								<div class="layui-row layui-row1">
									<div class="layui-inline">
										<label class="layui-form-label layui-label-width1" >實用面積(呎)：</label>
										<div class="layui-input-inline">
											<label class="layui-form-label layui-label-width" > ${releaseResult.saleablearea }</label>
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${releaseResult.buildingage!=null and releaseResult.buildingage!=0}">
								<div class="layui-row layui-row1">
									<div class="layui-inline">
										<label class="layui-form-label layui-label-width1" >樓齡(年)：</label>
										<div class="layui-input-inline">
											<label class="layui-form-label layui-label-width" >${releaseResult.buildingage }</label>
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${ releaseResult.phase!=null}">
								<div class="layui-row layui-row1">
									<div class="layui-inline">
										<label class="layui-form-label layui-label-width1" >期數：</label>
										<div class="layui-input-inline">
											<label class="layui-form-label layui-label-width" >${empty releaseResult.phase?"/": releaseResult.phase}</label>
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${releaseResult.buildingname!=null and releaseResult.buildingname!=''}">
								<div class="layui-row layui-row1">
									<div class="layui-inline">
										<label class="layui-form-label layui-label-width1" > 座數及單位：</label>
										<div class="layui-input-inline">
											<label class="layui-form-label layui-label-width" >${releaseResult.buildingname}</label>
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${releaseResult.propertymanagementfee!=null and releaseResult.propertymanagementfee!='0.00'}">
								<div class="layui-row layui-row1">
									<div class="layui-inline">
										<label class="layui-form-label layui-label-width1" >  每月管理費(元)：</label>
										<div class="layui-input-inline">
												<%-- <input type="tel" name="money"  autocomplete="off" class="layui-input checkOrder" value="${userOrder.money }"> --%>
											<label class="layui-form-label layui-label-width" >${releaseResult.propertymanagementfee }</label>
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${releaseResult.isverifylabel==true}">
								<div class="layui-row layui-row1">
									<div class="layui-inline">
										<label class="layui-form-label layui-label-width1" >  已驗證標籤：</label>
										<div class="layui-input-inline">
												<%-- <input type="tel" name="money"  autocomplete="off" class="layui-input checkOrder" value="${userOrder.money }"> --%>
											<label class="layui-form-label layui-label-width" >樓盤已驗證</label>
										</div>
									</div>
								</div>
							</c:if>
							<div class="layui-row layui-row1">
								<div class="layui-inline">
									<label class="layui-form-label layui-label-width1" >瀏覽人次：</label>
									<div class="layui-input-inline">
										<%-- <input type="tel" name="money"  autocomplete="off" class="layui-input checkOrder" value="${userOrder.money }"> --%>
										<label class="layui-form-label layui-label-width" >${releaseResult.browsenumber }</label>
									</div>
								</div>
							</div>
							<div class="layui-row layui-row1">
								<div class="layui-inline">
									<label class="layui-form-label layui-label-width1" >收藏人次：</label>
									<div class="layui-input-inline">
										<%-- <input type="tel" name="money"  autocomplete="off" class="layui-input checkOrder" value="${userOrder.money }"> --%>
										<label class="layui-form-label layui-label-width" >${releaseResult.collectionnumber }</label>
									</div>
								</div>
							</div>
							<c:if test="${releaseResult.publictime!=null}">
								<div class="layui-row layui-row1">
									<div class="layui-inline">
										<label class="layui-form-label layui-label-width1" >刊登或續期日：</label>
										<div class="layui-input-inline">
												<%-- <input type="tel" name="money"  autocomplete="off" class="layui-input checkOrder" value="${userOrder.money }"> --%>
											<label class="layui-form-label layui-label-width" ><c:if test="${empty releaseResult.publictime }">/</c:if><c:if test="${not empty releaseResult.publictime }"><fmt:formatDate value='${releaseResult.publictime }' pattern='yyyy/MM/dd'  /></c:if></label>
										</div>
									</div>
								</div>
							</c:if>
							<%
								PropertyReleaseResult releaseResult = (PropertyReleaseResult) request.getAttribute("releaseResult");
								Date updatetime = releaseResult.getUpdatetime();
								if(updatetime!=null) {
									Date now = new Date();
									long nd = 86400000L;//每天毫秒数
									long nh = 3600000L;//每小时毫秒数
									long nm = 60000L;//每分钟毫秒数

									long diff = now.getTime() - updatetime.getTime(); // 获得两个时间的毫秒时间差异

									long day = diff / nd;   // 计算差多少天

									long hour = diff % nd / nh; // 计算差多少小时

									long min = diff % nd % nh / nm;  // 计算差多少分钟
									if(day>=1){
										request.setAttribute("updatetime",day+"日前");
									}else if(hour>=1){
										request.setAttribute("updatetime",hour+"小時前");
									}else if(min!=0){
										request.setAttribute("updatetime",min+"分鐘前");
									}else if(min==0){
										request.setAttribute("updatetime","1分鐘前");
									}
								}
							%>
							<c:if test="${releaseResult.updatetime!=null}">
								<div class="layui-row layui-row1">
									<div class="layui-inline">
										<label class="layui-form-label layui-label-width1" >記錄更新：</label>
										<div class="layui-input-inline">
												<%-- <input type="tel" name="money"  autocomplete="off" class="layui-input checkOrder" value="${userOrder.money }"> --%>
											<label class="layui-form-label layui-label-width" >${updatetime}</label>
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${releaseResult.expiretime!=null and releaseResult.paymentstatus==1}">
								<div class="layui-row layui-row1">
									<div class="layui-inline">
										<label class="layui-form-label layui-label-width1" >放盤到期日：</label>
										<div class="layui-input-inline">
												<%-- <input type="tel" name="money"  autocomplete="off" class="layui-input checkOrder" value="${userOrder.money }"> --%>
											<label class="layui-form-label layui-label-width" ><fmt:formatDate value='${releaseResult.expiretime }' pattern='yyyy/MM/dd'  /></label>
										</div>
									</div>
								</div>
							</c:if>
						</div>
					</div>
				</div>
				<div class="layui-col-md4">
					<div class="layui-carousel" id="imgCarousel">
						<c:choose>
							<c:when test="${!empty releaseResult.proimg}">
								<div carousel-item>
									<c:forEach items="${releaseResult.proimg}" var="list" varStatus="s">
										<div>
											<img alt=""  <c:if test="${fn:contains(list,'house730.com')}">src="${list}?x-oss-process=style/640x480_c"</c:if><c:if test="${!fn:contains(list,'house730.com')}">src="${list}"</c:if> style="width: 100% ; height: 300px;">
										</div>
									</c:forEach>
								</div>
							</c:when>
							<c:otherwise>
								<div carousel-item>
									<div>
										<img alt="" src="/static-res/image/house-bg.png" style="width: 100% ; height: 300px;">
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>

				<div class="layui-col-md12">
					<div class="layui-row">
						<div class="layui-col-xs6 layui-col-md12">
							<div class="grid-demo grid-demo-bg2 " style="background-color:#c4d4e5;line-height:40px;padding:0 30px;font-size:16px;color:black;font-weight: bold">單位特色</div>
						</div>
					</div>
					<div class="layui-card">
						<div class="layui-card-body">
							<div class="layui-row">
								<div class="layui-block">
									<label class="" style="font-weight:bold;margin-left:15px;">${releaseResult.category}</label>
									<c:forEach items="${releaseResult.subcategory}" var="list" varStatus="s">
										<label class=""style="font-weight:bold;margin-left:15px;">${list}</label>
									</c:forEach>
								</div>
							</div>
							<div class="layui-row">
								<div class="layui-block">
									<label style="font-weight:bold;margin-left:15px;">${releaseResult.regionname}</label>  <label style="font-weight:bold;margin-left:15px;">${releaseResult.estatename}</label> <label style="font-weight:bold;margin-left:15px;">${releaseResult.rentaltype==1?"放售":releaseResult.rentaltype==2?"放租":"/"}</label>
								</div>
							</div>
							<div class="layui-row">
								<div class="layui-block">
									<div class="layui-block" style="font-weight:bold;margin-left:15px;">${releaseResult.titlecn}</div>
								</div>
							</div>
							<c:if test="${releaseResult.rentaltype==2}">
								<div class="layui-row">
									<div class="layui-block">
										<label class="layui-form-label " style="width: 100px;text-align: left;">起租日：</label>
										<div class="layui-block">
											<c:set var="beginrenttime">
												<fmt:formatDate value="${releaseResult.beginrenttime}" pattern="yyyy-MM-dd" type="date"/>
											</c:set>
											<fmt:parseDate value="1970-01-01" pattern="yyyy-MM-dd" var="receiveDate"></fmt:parseDate>
											<c:set var="vaildtime">
												<fmt:formatDate value="${receiveDate}" pattern="yyyy-MM-dd" type="date"/>
											</c:set>
											<c:if test="${beginrenttime!=vaildtime}">
												<label class="layui-form-label" style="width: 200px;text-align: left;" >${beginrenttime}</label>
											</c:if>
											<c:if test="${beginrenttime==vaildtime}">
												<label class="layui-form-label" style="width: 200px;text-align: left;" >可隨時起租</label>
											</c:if>
										</div>
									</div>
								</div>
								<c:if test="${!empty releaseResult.rentlabel }">
									<div class="layui-row">
										<label class="layui-form-label " style="width: 100px;text-align: left;">其他：</label>
										<div class="layui-block">

											<label class="layui-form-label " style="width: 200px; text-align: left"><c:forEach items="${releaseResult.rentlabel}" var="label" varStatus="s">${label}<br/> </c:forEach></label>

										</div>
									</div>
								</c:if>
							</c:if>
							<c:if test="${releaseResult.rentaltype==1}">
								<div class="layui-row">
									<div class="layui-block">
										<label class="layui-form-label" style="width: 200px;text-align: left;">${releaseResult.saleform==1?"綠表價/白表價":"已補地價,自由市場"}</label>
									</div>
								</div>
								<c:if test="${releaseResult.islinkparking}">
									<div class="layui-row">
										<div class="layui-block">
											<label class="layui-form-label" style="width: 100px;text-align: left;">連車位</label>
										</div>
									</div>
								</c:if>
							</c:if>

							<div class="layui-row">
								<div class="layui-block" style="padding: 0 15px;">
									<hr>
								</div>
							</div>
							<c:if test="${releaseResult.introduceCN !=null and releaseResult.introduceCN!=''}">
								<div class="layui-row">
									<label class="layui-form-label " style="width: 100px;text-align: left;">樓盤介紹：</label>
									<div class="layui-block">
										<label  class="layui-form-label" style="width: 900px;text-align: left;"> <pre>${releaseResult.introduceCN}</pre> </label>
									</div>
								</div>
							</c:if>
							<c:if  test="${releaseResult.similar!=null}">
								<c:forEach items="${releaseResult.similar}" var="similar" varStatus="s">
									<div class="layui-row">
										<div class="layui-block">
											<label class="layui-form-label" style="text-align: left;width: 150px;font-weight: bold;">類近單位提供</label>
											<div class="layui-block">
													<%-- <input type="tel" name="money"  autocomplete="off" class="layui-input checkOrder" value="${userOrder.money }"> --%>
												<label class="layui-form-label layui-label-width" ></label>
											</div>
										</div>
									</div>
									<c:if test="${similar.unitremark!=null and similar.unitremark!=''}">
										<div class="layui-row">
											<div class="layui-block">
												<label class="layui-form-label" style="width: 100px;text-align: left;">單位備註：</label>
												<div class="layui-block">
													<label class="layui-form-label" style="width: 900px;text-align: left;">${similar.unitremark}</label>
												</div>
											</div>
										</div>
									</c:if>
									<c:if test="${similar.saleprice!=null and  similar.saleprice!='0.00'}">
										<div class="layui-row">
											<div class="layui-block">
												<label class="layui-form-label" style="width: 100px;text-align: left;">售價：</label>
												<div class="layui-block">
													<label class="layui-form-label" style="width: 200px;text-align: left;">$${similar.saleprice/10000}萬</label>
												</div>
											</div>
										</div>
									</c:if>
									<c:if test="${similar.rentprice!=null and  similar.rentprice!='0.00'}">
										<div class="layui-row">
											<div class="layui-block">
												<label class="layui-form-label" style="width: 100px;text-align: left;">租價：</label>
												<div class="layui-block">
													<label class="layui-form-label" style="width: 200px;text-align: left;">$${similar.rentprice}</label>
												</div>
											</div>
										</div>
									</c:if>
									<c:if test="${similar.buildingarea!=null and similar.buildingarea!='0.00'}">
										<div class="layui-row">
											<div class="layui-block">
												<label class="layui-form-label" style="width: 100px;text-align: left;">建築面積：</label>
												<div class="layui-block">
													<label class="layui-form-label" style="width: 200px;text-align: left;">${similar.buildingarea}呎</label>
												</div>
											</div>
										</div>
									</c:if>
									<c:if test="${similar.saleablearea!=null and  similar.saleablearea!='0.00'}">
										<div class="layui-row">
											<div class="layui-block">
												<label class="layui-form-label" style="width: 100px;text-align: left;">實用面積：</label>
												<div class="layui-block">
													<label class="layui-form-label" style="width: 200px;text-align: left;">${similar.saleablearea}呎</label>
												</div>
											</div>
										</div>
									</c:if>
								</c:forEach>
							</c:if>
						</div>
					</div>
				</div>
				<c:if test="${!empty releaseResult.user}">
					<div class="layui-row">
						<div class="layui-col-xs6 layui-col-md12">
							<div class="grid-demo grid-demo-bg2 " style="background-color:#c4d4e5;line-height:40px;padding:0 30px;font-size:16px;color:black;font-weight: bold">聯絡方法</div>
						</div>
					</div>
				</c:if>
				<c:forEach items="${releaseResult.user}" var="list" varStatus="s">
					<div class="layui-col-md1" style="text-align: center;">
						<c:choose>
							<c:when test="${!empty list.imagepath}">
								<img alt=""  <c:if test="${fn:contains(list.imagepath,'house730.com')}">src="${list.imagepath}?x-oss-process=style/150xauto_f"</c:if><c:if test="${!fn:contains(list.imagepath,'house730.com')}">src="${list.imagepath}"</c:if> style="height: 94px;width: 94px;">
							</c:when>
							<c:when test="${empty list.imagepath and releaseResult.propertysource==1}">
								<img  src="/static-res/image/user-default.png" style="height: 94px;width: 94px;">
							</c:when>
							<c:otherwise>
								<img  src="/static-res/image/staff-default.png" style="height: 94px;width: 94px;">
							</c:otherwise>
						</c:choose>
					</div>
					<div class="layui-col-md11">
						<div class="layui-row">
							<div class="layui-block">
								<div class="layui-block">
									<c:if test="${releaseResult.propertysource==1}">
										<label  style="line-height:24pt;text-align: left; padding-left:3.5%;font-weight: bold;width: 200px;">業主自讓盤</label>
									</c:if>
									<c:if test="${releaseResult.propertysource==2}">
										<label  style="line-height:24pt;text-align: left; font-weight: bold; padding-left:3.5%; width: 200px;">地產代理盤</label>
									</c:if>
									<c:if test="${list.approvalstatus=='PassApproval'}">
										<label  style="color: #5FB878; line-height: 20px;font-size: 15px;width: 300px;text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;代理人資料已通過審核</label>
									</c:if>
								</div>
							</div>
						</div>
						<div class="layui-row">
							<div class="layui-block">
								<div class="layui-block">
									<label  style="line-height:24pt;padding-left:3.5%; text-align: left;">${list.contactnamecn}</label>&nbsp;&nbsp;&nbsp;&nbsp;
									<label  style="line-height:24pt; text-align: left;">${list.contactnameen}</label>
								</div>
							</div>
						</div>
						<c:if test="${list.companynamecn !=null and list.companynamecn!='' and releaseResult.propertysource==2}">
							<div class="layui-row">
								<div class="layui-block">
									<div class="layui-block">
											<%-- <input type="tel" name="money"  autocomplete="off" class="layui-input checkOrder" value="${userOrder.money }"> --%>
										<label  style="line-height:24pt;text-align: left;padding-left:3.5%;width: 400px;" >${list.companynamecn}</label>
									</div>
								</div>
							</div>
						</c:if>
						<c:choose>
							<c:when test="${ releaseResult.propertysource==2}">
								<c:if test="${list.isshowtel}">
									<div class="layui-row">
										<label  style="padding-left:3.5%;line-height:24pt; text-align: left;">TEL：</label>
										<c:if test="${list.isshowtel and list.telphone!=null and list.telphone!=''}">
											<label  style="line-height:24pt;text-align: left;" >${list.telphone }</label>&nbsp;&nbsp;&nbsp;&nbsp;
										</c:if>
										<c:if test="${ list.companytel!=null and list.companytel!=''}">
											<label  style="line-height:24pt;text-align: left;" >${list.companytel }</label>&nbsp;&nbsp;&nbsp;&nbsp;
										</c:if>
										<c:if test="${ list.customertel!=null and list.customertel!=''}">
											<label  style="line-height:24pt;text-align: left;" >${list.customertel }</label>
										</c:if>
									</div>
								</c:if>

								<c:if test="${ list.agentlicencenumber!=null and list.agentlicencenumber!='' }">
									<div class="layui-row">
										<div class="layui-block">
											<label  style="padding-left:3.5%;line-height:24pt;width: 200px; text-align: left;" >${list.agentlicencenumber }</label>
										</div>
									</div>
								</c:if>
								<c:if test="${ list.agentintroduce!=null and list.agentintroduce!='' and releaseResult.isjoinagentintroduce }">
									<div class="layui-row">
										<div class="layui-block" style="padding-left:3.5%;">
											<label  style=" line-height:24pt;width: 400px; text-align: left;" >${list.agentintroduce }</label>
										</div>
									</div>
								</c:if>
							</c:when>
							<c:when test="${releaseResult.propertysource==1 and list.isshowtel}">
								<div class="layui-row">
									<c:if test="${ list.telphone!=null and list.telphone!=''}">
										<label  style="padding-left:3.5%;line-height:24pt; text-align: left;">TEL：</label>
										<label  style="line-height:24pt; text-align: left;" >${list.telphone }</label>
									</c:if>
								</div>
							</c:when>
						</c:choose>
					</div>

				</c:forEach>

				<div class="layui-col-md12">
					<div class="layui-card">
						<div class="layui-card-body">
							<div class="layui-row">
								<div class="layui-block">
									<label class="layui-form-label" style="text-align: left;width: 100px;">放盤審核狀態：</label>
									<div class="layui-block">
										<%-- <input type="tel" name="money"  autocomplete="off" class="layui-input checkOrder" value="${userOrder.money }"> --%>
										<c:if test="${releaseResult.approvalstatus=='0' }">
											<label class="layui-form-label" style="text-align: left;width: 150px;">未審核</label>
										</c:if>
										<c:if test="${releaseResult.approvalstatus=='1' }">
											<label class="layui-form-label" style="text-align: left;width: 150px;">已通過</label>
										</c:if>
										<c:if test="${releaseResult.approvalstatus=='-1' }">
											<label class="layui-form-label" style="text-align: left;width: 150px;">未通過</label>
										</c:if>
									</div>
								</div>
							</div>
							<div class="layui-row">
								<div class="layui-block">
									<label class="layui-form-label" style="text-align: left;width: 100px;">放盘审核时间：</label>
									<div class="layui-block">
										<%-- <input type="tel" name="money"  autocomplete="off" class="layui-input checkOrder" value="${userOrder.money }"> --%>
										<label class="layui-form-label" style="text-align: left;width: 150px;"><c:if test="${not empty releaseResult.approvalTime }"><fmt:formatDate value='${releaseResult.approvalTime }' pattern='yyyy/MM/dd HH:mm:ss'  /></c:if><c:if test="${empty releaseResult.approvalTime }">/</c:if></label>
									</div>
								</div>
							</div>
							<div class="layui-row">
								<div class="layui-block">
									<label class="layui-form-label" style="text-align: left;width: 100px;">權重分值：</label>
									<div class="layui-block">
										<%-- <input type="tel" name="money"  autocomplete="off" class="layui-input checkOrder" value="${userOrder.money }"> --%>
										<label class="layui-form-label" style="text-align: left;width: 150px;">${not empty releaseResult.score?releaseResult.score:"/" }</label>
									</div>
								</div>
							</div>
							<div class="layui-row">
								<div class="layui-block">
									<label class="layui-form-label" style="text-align: left;width: 100px;">推薦時間：</label>
									<div class="layui-block">
										<%-- <input type="tel" name="money"  autocomplete="off" class="layui-input checkOrder" value="${userOrder.money }"> --%>
										<label class="layui-form-label" style="text-align: left;width: 300px;">
											<c:if test="${not empty releaseResult.recbegintime && not empty releaseResult.recendtime}">
												<fmt:formatDate value='${releaseResult.recbegintime }' pattern='yyyy/MM/dd'  />
												-
												<fmt:formatDate value='${releaseResult.recendtime }' pattern='yyyy/MM/dd'  />
											</c:if>
											<c:if test="${empty releaseResult.recbegintime || empty releaseResult.recendtime}">
											/
											</c:if>
											<%-- <c:if test="${not empty releaseResult.recbegintime }"><fmt:formatDate value='${releaseResult.recbegintime }' pattern='yyyy-MM-dd'  /></c:if><c:if test="${empty releaseResult.recbegintime }">/</c:if>
											-
											<c:if test="${not empty releaseResult.recendtime }"><fmt:formatDate value='${releaseResult.recendtime }' pattern='yyyy-MM-dd'  /></c:if><c:if test="${empty releaseResult.recendtime }">/</c:if>
										 --%>
										</label>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
			<div class="layui-row" style="height: 150px;text-align: center;line-height: 100px;">
				<div class="layui-card">
					<div class="layui-card-body">
						<div class="layui-input-inline">
							<c:if test="${resource == 'releaseApply' }">
								<button class="layui-btn"  id="scoreBtn" style="width: 120px;" onclick="scoreBtn()">權重分值管理</button>
							</c:if>
							<c:if test="${not empty resource && resource == 'releaseApply'}">
								<c:if test="${releaseResult.approvalstatus == '0' }">
									<button class="layui-btn"  id="" style="width: 120px;" onclick="applyBtn()">審核</button>
								</c:if>
							</c:if>
									<button class="layui-btn  layui-btn-normal"  id="closePage" style="width:120px;" onclick="closePage()">關閉</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="scoreDiv" class="score">
	<div style="padding:0 15px;">
	<!-- <fieldset class="layui-elem-field layui-field-title" style="text-align: center;">
		  <legend>權重分值管理</legend>
		</fieldset> -->
	<div style="height: 75px;line-height: 75px;text-align: center;font-size: 20px;">權重分值管理</div>
	<form class="layui-form" action="">
	      <div class="layui-form-item">
		    <div class="layui-inline">
		      <label class="layui-form-label" >樓盤編號：</label>
		      <div class="layui-input-inline">
		        	<label class="layui-form-label" style="text-align: left;"> ${releaseResult.propertyid}</label>
		      </div>
		    </div>
		 </div>
		 <div class="layui-form-item">
		    <div class="layui-inline">
		      <label class="layui-form-label" >權重分值：</label>
		      <div class="layui-input-inline">
		        	<input id="score" placeholder="請輸入權重分值" type="tel"  autocomplete="off" maxlength="3" class="layui-input" value="${releaseResult.score }" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9]+/,'');if(this.value>200){this.value=200};if(this.value.substring(0,1)=='0'){this.value=0}}).call(this)" onblur="this.v();">
		      </div>
		    </div>
		 </div>
	      <div class="layui-form-item">
	        <div class="layui-inline">
			      <label class="layui-form-label" >推薦日期：</label>
			      <div class="layui-input-inline ">
			        <input type="text" name="scoreBeginTime" readonly id="scoreBeginTime"  placeholder="起始日期" autocomplete="off" class="layui-input">
			      </div>
			      <label class="layui-form-label" style="width:10px;padding:10px 0 10px 0;text-align: left;">-</label>
			      <div class="layui-input-inline ">
			        <input type="text" name="scoreEndTime" readonly id="scoreEndTime"  placeholder="結束日期" autocomplete="off" class="layui-input">
			      </div>
			 </div>
		 </div>
		 <div class="layui-form-item">
	        <div class="layui-inline">
	        	<label class="layui-form-label" ></label>
			      <div class="layui-input-block ">
					  <p>權重分值在0~200之間，默認值100</p>
			      	 <p>ps：僅在推薦日期範圍內，該權重分值為有效</p>
			 	  </div>
			 </div>
		 </div>
	</form>
	</div>
</div>

<jsp:include page="../include/footer.jsp"/>
</body>
<script src="/static-res/js/propertyManager/propertyManager.js?v=<%=System.currentTimeMillis() %>"></script>
<script src="/static-res/viewer/js/viewer-jquery.min.js"></script>
<script type="text/javascript"></script>

</body>
</html>