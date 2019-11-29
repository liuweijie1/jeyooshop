<%@ page import="com.jeyoo.resultpojo.UserOrderRecordResult" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
         <%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta http-equiv="Expires" content="0">
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Cache-control" content="no-cache">
	<meta http-equiv="Cache" content="no-cache">
    <title>交易管理/交易詳情</title>
    <link rel="stylesheet" href="/static/css/layui.css">
    <link rel="stylesheet" href="/static-res/viewer/css/viewer.min.css">
    <style type="text/css">
    	.layui-body{
    		background-color:  	#f3f3f4;
    	}
    	#layui-input-width{
    		width:250px;
    	}
    	.layui-label-width{
    		width:200px !important;
    		text-align: left !important;
    		margin-left: 50px;
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
    	.layui-form-textalign{
    		text-align: left !important;
    	}
    	ul.imglist {
	margin: 0 auto;
	width: 536px;
	overflow: hidden;
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

.imgname {
	display: block;
	width: 100%;
	height: 30px;
	line-height: 30px;
	background: #F6F6F6;
	word-break:keep-all;           /* 不换行 */
    white-space:nowrap;          /* 不换行 */
    overflow:hidden;               /* 内容超出宽度时隐藏超出部分的内容 */
    text-overflow:ellipsis;
}
.filename {
	display: block;
	font-weight:bold;
	width: 100%;

	height: 30px;
	line-height: 30px;
	font-style:italic;

	word-break:keep-all;           /* 不换行 */
    white-space:nowrap;          /* 不换行 */
    overflow:hidden;               /* 内容超出宽度时隐藏超出部分的内容 */
    text-overflow:ellipsis;         /* 当对象内文本溢出时显示省略标记(...) ；需与overflow:hidden;一起使用。*/


    verflow: hidden;



}
.viewer-container{
	margin-top:60px !important;
}
.viewer-button{
	top: -33px !important;
	right: -37px !important;
	width:100px;
	height:100px;
}
.viewer-button:before{
	bottom:26px !important;
	left:24px !important;
}

    </style>

    <script type="text/javascript" src="/static-res/js/jquery/jquery-3.4.0.min.js"></script>
</head>
	<jsp:include page="../include/header.jsp"/>
	<body class="layui-layout-body" style="height: 100%;">
		<div class="layui-layout layui-layout-admin">
		    <div class="layui-body">
		        <!-- 内容主体区域 -->
		        <div style="padding: 15px;">
		        	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
					  <legend>交易管理/交易詳情</legend>
					</fieldset>

		        	<!-- <div class="layui-row">

					    <div class="layui-col-xs6 layui-col-md12">
					      <div class="grid-demo grid-demo-bg2" style="background-color:#52cdec;line-height:50px;padding:0 30px;font-size:18px;color:white;">交易詳情</div>
					    </div>
					 </div> -->
					<div class="layui-row layui-col-space15">
					    <div class="layui-col-md12">
					      <div class="layui-card">
					        <!-- <div class="layui-card-header">卡片面板</div> -->
					        <div class="layui-card-body">
					        	<form class="layui-form" action="" id="storeValueForm">
									    <div class="layui-form-item">
										    <div class="layui-inline">
										      <label class="layui-form-label layui-label-width" >會員編號:</label>
										      <div class="layui-input-inline">
										      	<!-- <label class="layui-form-label layui-label-width" >會員編號:</label> -->
										        <%-- <input type="tel" name="userid"  autocomplete="off" class="layui-input checkOrder" value="${userOrder.userid }" > --%>
										      	<label class="layui-form-label layui-label-width" >${userOrder.usercode }</label>
										      </div>
										    </div>
										 </div>
									    <div class="layui-form-item">
										    <div class="layui-inline">
										      <label class="layui-form-label layui-label-width" >訂單編號:</label>
										      <div class="layui-input-inline">
										        <%-- <input type="tel" name="orderid"  autocomplete="off" class="layui-input checkOrder" value="${userOrder.orderid }"> --%>
										      	<label class="layui-form-label layui-label-width" >${userOrder.orderid }</label>
										      </div>
										    </div>
										 </div>
										 <div class="layui-form-item">
										    <div class="layui-inline">
										      <label class="layui-form-label layui-label-width" >交易事項:</label>
										      <div class="layui-input-inline">
										        <%-- <input type="tel" name="item"  autocomplete="off" class="layui-input checkOrder" value="${userOrder.item }"> --%>
													<label class="layui-form-label layui-label-width" >${userOrder.item}</label>
										      </div>
										    </div>
										 </div>
										 <c:if test='${userOrder.sourcetype=="Property"}'>
											 <div class="layui-form-item">
											    <div class="layui-inline">
											      <label class="layui-form-label layui-label-width" >樓盤編號:</label>
											      <div class="layui-input-inline">
											        <%-- <input type="tel" name="item"  autocomplete="off" class="layui-input checkOrder" value="${userOrder.item }"> --%>
														<label class="layui-form-label layui-label-width" >${userOrder.sourceid}</label>
											      </div>
											    </div>
											 </div>
										 </c:if>
										 <div class="layui-form-item">
										    <div class="layui-inline">
										      <label class="layui-form-label layui-label-width" >付款狀態:</label>
										      <div class="layui-input-inline">
										        <%-- <input type="tel"   autocomplete="off" class="layui-input checkOrder" value="<c:if test='${userOrder.orderstatus=="0"}'>未支付</c:if><c:if test='${userOrder.orderstatus=="1"}'>已支付</c:if>"> --%>
										      	<label class="layui-form-label layui-label-width" ><c:if test='${userOrder.orderstatus=="0"}'>未付款</c:if><c:if test='${userOrder.orderstatus=="1"}'>已付款</c:if><c:if test='${userOrder.orderstatus=="2"}'>已關閉</c:if></label>
										      	<input type="hidden" name="orderstatus" value="${userOrder.orderstatus}">
										      </div>
										    </div>
										 </div>
										 <div class="layui-form-item">
										    <div class="layui-inline">
										      <label class="layui-form-label layui-label-width" >付款方式:</label>
										      <div class="layui-input-inline">
										        <%-- <input type="tel"  autocomplete="off" class="layui-input checkOrder" value="<c:if test='${userOrder.paymenttype=="0"}'>信用卡</c:if><c:if test='${userOrder.paymenttype=="1"}'>銀行轉賬</c:if>"> --%>
										      	<%-- <label class="layui-form-label layui-label-width" ><c:if test='${userOrder.paymenttype=="0"}'>信用卡</c:if><c:if test='${userOrder.paymenttype=="1"}'>銀行轉賬</c:if></label> --%>
										      	<label class="layui-form-label layui-label-width" >
											      	<c:if test='${userOrder.orderstatus=="1"}'>
											      		<c:if test='${userOrder.paymenttype=="1" }'>PayPal</c:if>
											      		<c:if test='${userOrder.paymenttype=="0" }'>金幣支付</c:if>
											      		<c:if test='${userOrder.paymenttype=="2" }'>銀行轉賬</c:if>
											      	</c:if>
											      	<c:if test='${userOrder.orderstatus=="0"}'>/</c:if>
										      	</label>
										      	<input type="hidden" name="paymenttype" value="${userOrder.paymenttype}">
										      </div>
										    </div>
										 </div>
										 <div class="layui-form-item">
										    <div class="layui-inline">
										      <label class="layui-form-label layui-label-width" >交易金額（港幣/屋幣）:</label>
										      <div class="layui-input-inline">
										        <%-- <input type="tel" name="money"  autocomplete="off" class="layui-input checkOrder" value="${userOrder.money }"> --%>
										      	<label class="layui-form-label layui-label-width" >${userOrder.money }</label>
										      </div>
										    </div>
										 </div>
											 <div class="layui-form-item">
											    <div class="layui-inline">
											      <label class="layui-form-label layui-label-width" >是否上傳憑證:</label>
											      <div class="layui-input-inline">
											      		<%-- <input type="tel" autocomplete="off" class="layui-input checkOrder"  value="<c:if test='${userOrder.isUploadEvidence==false}'>未上傳</c:if><c:if test='${userOrder.isUploadEvidence==true}'>已上傳</c:if> "> --%>
											        	<input type="hidden" name="isUploadEvidence" value="${userOrder.isUploadEvidence}">
											        	<label class="layui-form-label layui-label-width" ><c:if test='${userOrder.isUploadEvidence==false}'>未上傳</c:if><c:if test='${userOrder.isUploadEvidence==true}'>已上傳</c:if></label>
											        <!-- <c:if test='${userOrder.isUploadEvidence == false} '>未上傳</c:if> -->
											      </div>
											    </div>
											 </div>
											  <div class="layui-form-item">
											    <div class="layui-inline">
											      <label class="layui-form-label layui-label-width" >上傳憑證時間:</label>
											      <div class="layui-input-inline">
											        <%-- <input type="tel" autocomplete="off" class="layui-input checkOrder" value="<fmt:formatDate value='${userOrder.evidenceTime }' pattern='yyyy-MM-dd hh:mm:ss'  />"> --%>
											      	<input type="hidden" name="evidenceTime" value="${userOrder.userOrderEvidence[0].createtime}">
											      	<label class="layui-form-label layui-label-width" ><c:if test="${empty userOrder.userOrderEvidence[0].createtime}">/</c:if><c:if test="${not empty userOrder.userOrderEvidence[0].createtime}"><fmt:formatDate value='${userOrder.userOrderEvidence[0].createtime }' pattern='yyyy/MM/dd HH:mm:ss ' /></c:if></label>
											      	<ul class="imglist " id="imglist" style="margin-left: 50px;">
														<c:if test="${not empty userOrder && not empty userOrder.userOrderEvidence}">
														    <c:forEach var="userOrderEvidence" items="${userOrder.userOrderEvidence}" varStatus="status" >
																<c:if test="${not empty userOrderEvidence.evidencepath }">
																	<li><a href="javascript:showTS()" > <img
																	        data-original="${userOrderEvidence.evidencepath}?x-oss-process=style/master"
																			src="${userOrderEvidence.evidencepath}?x-oss-process=style/master" alt="${it.fileName}" title="${it.fileName}" />

																			<span class="imgname">${it.fileName}</span>
																	</a></li>
																</c:if>
		                                                  	</c:forEach>
		                                                 </c:if>
													</ul>
											      </div>
											    </div>
											 </div>
										 <c:if test="${userOrder.sourcetype == 'PropertyCoin' }">
											 <div class="layui-form-item">
											    <div class="layui-inline">
											      <label class="layui-form-label layui-label-width" >可儲值數量:</label>
											      <div class="layui-input-inline">
											        <%-- <input type="tel" name="propertycoin"  autocomplete="off" class="layui-input checkOrder" value="${userOrder.propertycoin }"> --%>
											      	<label class="layui-form-label layui-label-width" >${userOrder.propertycoin }</label>
											      </div>
											    </div>
											 </div>
											 <div class="layui-form-item">
											    <div class="layui-inline">
											      <label class="layui-form-label layui-label-width" >屋幣儲值時間:</label>
											      <div class="layui-input-inline">
											        <%-- <input type="tel" autocomplete="off" class="layui-input checkOrder"  value="<fmt:formatDate value='${userOrder.createtime }' pattern='yyyy-MM-dd hh:mm:ss'  />" > --%>
											      		<input type="hidden" name="createtime" value="${userOrder.createtime}">
											      		<label class="layui-form-label layui-label-width" ><fmt:formatDate value='${userOrder.createtime }' pattern='yyyy-MM-dd HH:mm:ss'  /></label>
											      </div>
											    </div>
											 </div>
										 </c:if>
								   </form>

								   <div class="layui-form-item" style="margin-bottom: 50px;">
									    <div class="layui-input-block" >
										    <c:if test="${!empty userOrder && userOrder.orderstatus == '0'}">
										    	<c:if test="${!empty userOrder && userOrder.isUploadEvidence == false }">
										    		<button id="uploadFile" class="layui-btn layui-btn-primary" style="width:120px;" onclick="uploadFileBtn();">上傳憑證</button>
										    	</c:if>
										    	<c:if test="${!empty userOrder  && userOrder.propertycoin > 0 && userOrder.orderstatus == '0' && userOrder.isUploadEvidence == true}">
										    		<button class="layui-btn"  id="storeValueBtn" style="width:120px;" onclick="storeValueBtn('${userOrder.sourcetype}')">交易已確認</button>
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
		    </div>
		</div>
	<jsp:include page="../include/footer.jsp"/>
   </body>
   <div class="" id="storeValuePage">
   		<div style="padding:0 15px;">
       	<fieldset class="layui-elem-field layui-field-title" style="text-align: center;">
		  <legend>儲值屋幣</legend>
		</fieldset>
		<div class="layui-form-item">
		    <div class="layui-inline">
		      <label class="layui-form-label layui-label-width" >會員編號 :</label>
		      <div class="layui-input-inline">
		      	<!-- <label class="layui-form-label layui-label-width" >會員編號:</label> -->
		        <%-- <input type="tel" name="userid"  autocomplete="off" class="layui-input checkOrder1" value="${userOrder.userid }" > --%>
		      	<label class="layui-form-label layui-label-width" >${userOrder.usercode }</label>
		      </div>
		    </div>
		 </div>
	    <div class="layui-form-item">
		    <div class="layui-inline">
		      <label class="layui-form-label layui-label-width" >訂單編號 :</label>
		      <div class="layui-input-inline">
		      	<label class="layui-form-label layui-label-width" >${userOrder.orderid }</label>
		        <%-- <input type="tel" name="orderid"  autocomplete="off" class="layui-input checkOrder1" value="${userOrder.orderid }"> --%>
		      </div>
		    </div>
		 </div>
		 <div class="layui-form-item">
		    <div class="layui-inline">
		      <label class="layui-form-label layui-label-width" >交易事項 :</label>
		      <div class="layui-input-inline">
				  <label class="layui-form-label layui-label-width" >${userOrder.item }</label>
		      </div>
		    </div>
		 </div>
		 <div class="layui-form-item">
		    <div class="layui-inline">
		      <label class="layui-form-label layui-label-width" >交易金額（港幣/屋幣）:</label>
		      <div class="layui-input-inline">
		      	<label class="layui-form-label layui-label-width" >${userOrder.money }</label>
		      </div>
		    </div>
		 </div>
		 <div class="layui-form-item">
		    <div class="layui-inline">
		      <label class="layui-form-label layui-label-width" >訂單編號 :</label>
		      <div class="layui-input-inline">
		      	<label class="layui-form-label layui-label-width" >${userOrder.orderid }</label>
		      </div>
		    </div>
		 </div>
		 <div class="layui-form-item">
		    <div class="layui-inline">
		      <label class="layui-form-label layui-label-width" >可儲值數量:</label>
		      <div class="layui-input-inline">
		        	<label class="layui-form-label layui-label-width" >${userOrder.propertycoin }</label>
		      </div>
		    </div>
		 </div>
   	</div>

   </div>
   <div class="" id="uploadFileDetail">
   		<div style="padding:0 15px;">
	       	<!-- <fieldset class="layui-elem-field layui-field-title" style="text-align: center;">
			  <legend>上傳憑證</legend>
			</fieldset> -->
			<div style="height: 75px;line-height: 75px;text-align: center;font-size: 20px;">上傳憑證</div>
			<div class="layui-form-item">
			    <div class="layui-inline">
			      <label class="layui-form-label layui-label-width" >會員編號 :</label>
			      <div class="layui-input-inline">
			      	<!-- <label class="layui-form-label layui-label-width" >會員編號:</label> -->
			        <%-- <input type="tel" name="userid"  autocomplete="off" class="layui-input checkOrder1" value="${userOrder.userid }" > --%>
			      	<label class="layui-form-label layui-form-textalign" >${userOrder.usercode }</label>
			      </div>
			    </div>
			 </div>
		    <div class="layui-form-item">
			    <div class="layui-inline">
			      <label class="layui-form-label layui-label-width" >訂單編號 :</label>
			      <div class="layui-input-inline">
			      	<label class="layui-form-label layui-form-textalign" >${userOrder.orderid }</label>
			        <%-- <input type="tel" name="orderid"  autocomplete="off" class="layui-input checkOrder1" value="${userOrder.orderid }"> --%>
			      </div>
			    </div>
			 </div>
			 <div class="layui-form-item">
			    <div class="layui-inline">
			      <label class="layui-form-label layui-label-width" >交易事項 :</label>
			      <div class="layui-input-inline">
					  <label class="layui-form-label layui-form-textalign" >${userOrder.item}</label>
			      </div>
			    </div>
			 </div>
			 <div class="layui-form-item">
			    <div class="layui-inline">
			      <label class="layui-form-label layui-label-width" >交易金額（港幣/屋幣）:</label>
			      <div class="layui-input-inline">
			      	<label class="layui-form-label layui-form-textalign" >${userOrder.money }</label>
			      </div>
			    </div>
			 </div>

		    <div class="layui-upload" style="padding: 9px 15px;">
			    <div class="layui-inline">
			      <label class="layui-form-label " style="width: 200px;margin-left:35px;text-align: left;" >上傳憑證:</label>
			    </div>
				  <button type="button" class="layui-btn" id="uploadEvidence">上傳憑證</button>
				  <!-- <button type="button" class="layui-btn" id="uploadEvidences">開始上傳</button> -->
				  <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;width: 600px;margin-left: 265px;min-height: 250px;">
				    预览图：
				    <div class="layui-upload-list" id="uploadEvidenceList"></div>
				 </blockquote>
			</div>
			<form class="layui-form" action="" id="fileUpload">
				<div id="displayImage" style="display: none;">
				</div>
				<input type="hidden" name="orderid" value="${userOrder.orderid }">
			</form>

   		</div>

   </div>
<script src="/static-res/viewer/js/viewer-jquery.min.js"></script>
<script src="/static-res/js/tradeManager/getPage.js?v=<%=System.currentTimeMillis() %>"></script>
<script type="text/javascript"></script>
<script>
$(function() {
 	$('#imglist').viewer({
 		url: 'data-original',
 	});

 	showTS();

 });
 function showTS(){
	 layer.msg('按“Esc”鍵退出預覽');
 }
</script>
</body>
</html>