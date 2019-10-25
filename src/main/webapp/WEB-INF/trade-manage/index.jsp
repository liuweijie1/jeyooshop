<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
    <title>交易管理/交易列表</title>
    <link rel="stylesheet" href="/static/css/layui.css">
    <style type="text/css">
    	.layui-body{
    		background-color:  	#f3f3f4;
    	}
    	.layui-input-width{
    		width:190px !important;
    	}
    	.layui-label-width{
    		width:160px !important;
    	}
    	.layui-label1-width{
    		
    		width:100px !important;
    	}
    	.layui-label-ck{
    		width:0 !important;
    	}
    	.layui-inline-width{
    		width:160px !important;
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
					  <legend>交易管理/交易列表</legend>
					</fieldset>
								       	
		        	<!-- <div class="layui-row">
					   
					    <div class="layui-col-xs6 layui-col-md12">
					      <div class="grid-demo grid-demo-bg2" style="background-color:#52cdec;line-height:50px;padding:0 30px;font-size:18px;color:white;">交易列表</div>
					    </div>
					 </div> -->
					<div class="layui-row layui-col-space15">
					    <div class="layui-col-md12">
					      <div class="layui-card">
					        <!-- <div class="layui-card-header">卡片面板</div> -->
					        <div class="layui-card-body">
					        	<form class="layui-form" action="">
					        		<div class="layui-form-item">
										    <div class="layui-inline">
										      <div class="layui-input-inline">
										        <input id="orderIdOrUserId" type="tel" name="orderid" placeholder="請輸入會員號或訂單號" autocomplete="off" class="layui-input" value="">
										      </div>
										    </div>
										    <div class="layui-inline">
										      <!-- <label class="layui-form-label">分组选择框</label> -->
										      <div class="layui-input-inline">
										        <select name="sourcetype" id="sourcetype">
										          <option value="">請選擇交易事項</option>
										            <option value="Property">放盤</option>
										            <option value="PropertyCoin">購買金幣</option>
										        </select>
										      </div>
										    </div>
										    <div class="layui-inline">
										      <!-- <label class="layui-form-label">分组选择框</label> -->
										      <div class="layui-input-inline">
										        <div class="layui-input-inline">
										        <input id="sourceid" type="tel" name="sourceid" placeholder="請輸入樓盤編號" autocomplete="off" class="layui-input" value="">
										      </div>
										      </div>
										    </div>
										    <div class="layui-inline">
										      <!-- <label class="layui-form-label">分组选择框</label> -->
										      <div class="layui-input-inline">
										        <select name="accountid" id="accountid">
										          <option value="">請選擇付款来源</option>
										            <option value="0">普通會員</option>
										            <option value="1">PMS</option>
										        </select>
										      </div>
										    </div>
										    <div class="layui-inline">
										      <!-- <label class="layui-form-label">分组选择框</label> -->
										      <div class="layui-input-inline">
										        <select name="orderstatus" id="orderstatus">
										          <option value="">請選擇付款狀態</option>
										            <option value="0">未付款</option>
										            <option value="1">已付款</option>
										            <option value="2">已關閉</option>
										        </select>
										      </div>
										    </div>
										    <div class="layui-inline">
										      <!-- <label class="layui-form-label">分组选择框</label> -->
										      <div class="layui-input-inline">
										        <select name="paymenttype" id="paymenttype">
										          <option value="">請選擇付款方式</option>
										          <option value="1">PayPal付款</option>
										          <option value="2">銀行轉賬</option>
										          <option value="0">金幣支付</option>
										        </select>
										      </div>
										    </div>
										    <div class="layui-inline">
										      <!-- <label class="layui-form-label">分组选择框</label> -->
										      <div class="layui-input-inline layui-input-width">
										        <select name="isUploadEvidence" id="isUploadEvidence">
										          <option value="">請選擇付款憑證審核狀態</option>
										          <option value="1">已上傳</option>
										          <option value="0">未上傳</option>
										        </select>
										      </div>
										    </div>
										    <!-- <label class="layui-form-label layui-label-ck" ></label>
										    <div class="layui-input-inline">
										      <input type="checkbox" id="propertycoin" name="propertycoin" lay-skin="primary" title="有可儲值屋幣量"  lay-filter="test">
										     
										    </div> -->
										    <div class="layui-inline">
										      <!-- <label class="layui-form-label layui-label1-width" >儲值屋幣時間：</label> -->
										      <div class="layui-input-inline">
										        <input type="text" name="beginTime" id="beginTime"  placeholder="交易時間-起始日期" autocomplete="off" class="layui-input">
										      </div>
										      <label class="layui-form-label" style="width:10px;padding:10px 4px 10px 0;text-align: left;">-</label>
										      <div class="layui-input-inline ">
										        <input type="text" name="endTime" id="endTime"  placeholder="交易時間-結束日期" autocomplete="off" class="layui-input">
										      </div>
										    </div>
										    
										    <div class="layui-inline">
										      <!-- <label class="layui-form-label layui-label1-width" >上傳憑證時間：</label> -->
										      <div class="layui-input-inline " >
										        <input type="text" name="beginEvidenceTime" id="beginEvidenceTime"  placeholder="上傳憑證-起始日期" autocomplete="off" class="layui-input">
										      </div>
										      <label class="layui-form-label" style="width:10px;padding:10px 4px 10px 0;text-align: left;">-</label>
										      <div class="layui-input-inline " >
										        <input type="text" name="endEvidenceTime" id="endEvidenceTime"  placeholder="上傳憑證-結束日期" autocomplete="off" class="layui-input">
										      </div>
										    </div>
										     <div class="layui-inline">
												<input type="button" value="查找" class="layui-btn" id="searchBtn" ></input>
										    </div>

										  </div>
										  
								   </form>
								   <%--<div class="layui-form-item">--%>
											    <%--<div class="layui-input-block">--%>
											      <%--<button class="layui-btn"  id="searchBtn">查找</button>--%>
											      <%--<!-- <button type="reset" class="layui-btn layui-btn-primary">導出</button> -->--%>
											    <%--</div>--%>
										  <%--</div>--%>
					        </div>
					      </div>
					    </div>
				    	
				    
				  	</div>
				  	
				  	<div class="layui-row layui-col-space15">
					    <div class="layui-col-md12">
					    	<table class="layui-table" id="demo"  lay-size="lg" lay-filter="test">
					    	<script type="text/html" id="barDemo">
									<a class="layui-btn layui-btn-xs" lay-event="detail" style="width:60px;">管理</a>
							</script>
							</table>
					    </div>
					    <!-- <div class="layui-col-md12">
					    	     <div id="bottomPage"></div>
					    </div> -->
					</div>
		        </div>
		        
		       
		    </div>
		</div>
	<jsp:include page="../include/footer.jsp"/>
   </body>
<script src="/static-res/js/tradeManager/getPage.js?v=<%=System.currentTimeMillis() %>"></script>
<script type="text/javascript"></script>
<script>
    /* window.onload=function(){
        //getPage();
     } */
</script>
</body>
</html>