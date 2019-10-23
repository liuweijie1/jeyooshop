<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
         <%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>House730</title>
    <link rel="stylesheet" href="/static/css/layui.css">
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
    </style>
    
    <script type="text/javascript" src="/static-res/js/jquery/jquery-3.4.0.min.js"></script>
</head>
	<jsp:include page="../include/header.jsp"/>
	<body class="layui-layout-body">
		<div class="layui-layout layui-layout-admin">
		    <div class="layui-body">
		        <!-- 内容主体区域 -->
		        <div style="padding: 15px;">
		        	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
					  <legend>交易管理</legend>
					</fieldset>
								       	
		        	<div class="layui-row">
					   
					    <div class="layui-col-xs6 layui-col-md12">
					      <div class="grid-demo grid-demo-bg2" style="background-color:#52cdec;line-height:50px;padding:0 30px;font-size:18px;color:white;">交易詳情</div>
					    </div>
					 </div>
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
										      	<input type="hidden" name="orderid" value="${userOrder.orderid }">
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
										 <div class="layui-form-item">
										    <div class="layui-inline">
										      <label class="layui-form-label layui-label-width" >付款狀態:</label>
										      <div class="layui-input-inline">
										        <%-- <input type="tel"   autocomplete="off" class="layui-input checkOrder" value="<c:if test='${userOrder.orderstatus=="0"}'>未支付</c:if><c:if test='${userOrder.orderstatus=="1"}'>已支付</c:if>"> --%>           
										      	<label class="layui-form-label layui-label-width" ><c:if test='${userOrder.orderstatus=="0"}'>未支付</c:if><c:if test='${userOrder.orderstatus=="1"}'>已支付</c:if></label>
										      	<input type="hidden" name="orderstatus" value="${userOrder.orderstatus}">
										      </div>
										    </div>
										 </div>
										 <div class="layui-form-item">
										    <div class="layui-inline">
										      <label class="layui-form-label layui-label-width" >付款方式:</label>
										      <div class="layui-input-inline">
										        <%-- <input type="tel"  autocomplete="off" class="layui-input checkOrder" value="<c:if test='${userOrder.paymenttype=="0"}'>信用卡</c:if><c:if test='${userOrder.paymenttype=="1"}'>銀行轉賬</c:if>"> --%>
										      	<label class="layui-form-label layui-label-width" ><c:if test='${userOrder.paymenttype=="0"}'>信用卡</c:if><c:if test='${userOrder.paymenttype=="1"}'>銀行轉賬</c:if></label>
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
										 <c:if test="${userOrder.paymenttype == '1' }">
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
											      	<input type="hidden" name="evidenceTime" value="${userOrder.evidenceTime}">
											      	<label class="layui-form-label layui-label-width" ><c:if test="${empty userOrder.evidenceTime}">/</c:if><c:if test="${not empty userOrder.evidenceTime}"><fmt:formatDate value='${userOrder.evidenceTime }' pattern='yyyy-MM-dd hh:mm:ss'  /></c:if></label>
											      </div>
											    </div>
											 </div>
										 </c:if>
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
											      		<label class="layui-form-label layui-label-width" ><fmt:formatDate value='${userOrder.createtime }' pattern='yyyy-MM-dd hh:mm:ss'  /></label>
											      </div>
											    </div>
											 </div>
										 </c:if>
								   </form>
								   
								   <div class="layui-form-item" style="margin-bottom: 50px;">
									    <div class="layui-input-block" >
									    	<c:if test="${!empty userOrder && userOrder.sourcetype == 'PropertyCoin' && userOrder.propertycoin > 0 && userOrder.orderstatus == '0' }">
										    	<button class="layui-btn"  id="storeValueBtn" style="width:120px;" onclick="storeValueBtn()">儲值屋幣</button>
										    </c:if>
										    <c:if test="${!empty userOrder && userOrder.paymenttype == 1 }">
										    	<button id="uploadFile" class="layui-btn layui-btn-primary" style="width:120px;" onclick="uploadFileBtn();">上傳憑證</button>
										    </c:if>
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
				  <c:if test="${userOrder.sourcetype=='PropertyCoin'}">
		      	<label class="layui-form-label layui-label-width" >屋幣儲值</label>
				  </c:if>
				  <c:if test="${userOrder.sourcetype=='Property'}">
					  <label class="layui-form-label layui-label-width" >房源</label>
				  </c:if>
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
	       	<fieldset class="layui-elem-field layui-field-title" style="text-align: center;">
			  <legend>上傳憑證</legend>
			</fieldset>
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
					  <c:if test="${userOrder.sourcetype=='PropertyCoin'}">
						  <label class="layui-form-label layui-form-textalign" >屋幣儲值</label>
					  </c:if>
					  <c:if test="${userOrder.sourcetype=='Property'}">
						  <label class="layui-form-label layui-form-textalign" >房源</label>
					  </c:if>
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
   		</div>
   
   </div>
<script src="/static-res/js/tradeManager/getPage.js"></script>
<script type="text/javascript"></script>
<script>
/*  window.onload=function(){
	//getPage();
 }  */
</script>
</body>
</html>