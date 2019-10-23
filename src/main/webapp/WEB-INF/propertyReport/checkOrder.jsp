<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
    		width:160px !important;
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
					      <div class="grid-demo grid-demo-bg2" style="background-color:#52cdec;line-height:50px;padding:0 30px;font-size:18px;color:white;">交易列表</div>
					    </div>
					 </div>
					<div class="layui-row layui-col-space15">
					    <div class="layui-col-md12">
					      <div class="layui-card">
					        <!-- <div class="layui-card-header">卡片面板</div> -->
					        <div class="layui-card-body">
					        	<form class="layui-form" action="">
									  
									    <div class="layui-form-item">
										    <div class="layui-inline">
										      <label class="layui-form-label layui-label-width" >請輸入會員號或訂單號:</label>
										      <div class="layui-input-inline">
										        <input type="tel" name="phone"  autocomplete="off" class="layui-input">
										      </div>
										    </div>
										   
										    <div class="layui-inline">
										      <!-- <label class="layui-form-label">分组选择框</label> -->
										      <div class="layui-input-inline">
										        <select name="quiz">
										          <option value="">請選擇付款狀態</option>
										          
										          
										            <option value="1">已付款</option>
										            <option value="0">未付款</option>
										          
										        </select>
										      </div>
										    </div>
										    <div class="layui-inline">
										      <!-- <label class="layui-form-label">分组选择框</label> -->
										      <div class="layui-input-inline">
										        <select name="quiz">
										          <option value="">請選擇付款方式</option>
										          <option value="你工作的第一个城市">信用卡付款</option>
										          <option value="你工作的第一个城市">銀行轉賬</option>
										          
										        </select>
										      </div>
										    </div>
										    
										    <div class="layui-inline">
										      <!-- <label class="layui-form-label">分组选择框</label> -->
										      <div class="layui-input-inline">
										        <select name="quiz">
										          <option value="">請選擇付款憑證審核狀態</option>
										          <option value="你工作的第一个城市">未通過</option>
										          <option value="你工作的第一个城市">已通過</option>
										          <option value="你工作的第一个城市">未審核</option>
										        </select>
										      </div>
										    </div>
										    
										 </div>
									     <div class="layui-form-item" pane="">
										    <label class="layui-form-label layui-label-ck" ></label>
										    <div class="layui-input-inline">
										      <input type="checkbox" name="like1[write]" lay-skin="primary" title="有可儲值屋幣量" checked="">
										     
										    </div>
										    <div class="layui-inline">
										      <label class="layui-form-label layui-label1-width" >儲值屋幣時間</label>
										      <div class="layui-input-inline">
										        <input type="text" name="date" id="date"  placeholder="起始日期" autocomplete="off" class="layui-input">
										      </div>
										      <label class="layui-form-label" style="width:10px;padding:10px 0 10px 0;text-align: left;">-</label>
										      <div class="layui-input-inline">
										        <input type="text" name="date1" id="date1"  placeholder="結束日期" autocomplete="off" class="layui-input">
										      </div>
										    </div>
										    
										    <div class="layui-inline">
										      <label class="layui-form-label layui-label1-width" >儲值屋幣時間</label>
										      <div class="layui-input-inline layui-inline-width" >
										        <input type="text" name="date" id="date2"  placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
										      </div>
										      <label class="layui-form-label" style="width:10px;padding:10px 0 10px 0;text-align: left;">-</label>
										      <div class="layui-input-inline layui-inline-width" >
										        <input type="text" name="date1" id="date3"  placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
										      </div>
										    </div>
										  </div>
										  <div class="layui-form-item">
											    <div class="layui-input-block">
											      <button class="layui-btn" lay-submit="" lay-filter="demo">查找</button>
											      <button type="reset" class="layui-btn layui-btn-primary">導出</button>
											    </div>
										  </div>
										  
								   </form>
					        </div>
					      </div>
					    </div>
				    	
				    
				  	</div>
				  	
				  	<div class="layui-row layui-col-space15">
					    <div class="layui-col-md12">
					    	<table class="layui-table" id="demo"  lay-size="lg" lay-filter="test">
					    	<script type="text/html" id="barDemo">
									<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
									<a class="layui-btn layui-btn-xs" lay-event="edit">管理</a>
									<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">審核</a>
							</script>
							</table>
					    </div>
					    <!-- <div class="layui-col-md12">
					    	     <div id="bottomPage"></div>
					    </div> -->
					</div>
		        </div>
		        
		        <div class="layui-card-body" id="test">
					        	<form class="layui-form" action="">
									  
									    <div class="layui-form-item">
										    <div class="layui-inline">
										      <label class="layui-form-label layui-label-width" >請輸入會員號或訂單號:</label>
										      <div class="layui-input-inline">
										        <input type="tel" name="phone"  autocomplete="off" class="layui-input">
										      </div>
										    </div>
										   
										    <div class="layui-inline">
										      <!-- <label class="layui-form-label">分组选择框</label> -->
										      <div class="layui-input-inline">
										        <select name="quiz">
										          <option value="">請選擇付款狀態</option>
										          
										          
										            <option value="1">已付款</option>
										            <option value="0">未付款</option>
										          
										        </select>
										      </div>
										    </div>
										    <div class="layui-inline">
										      <!-- <label class="layui-form-label">分组选择框</label> -->
										      <div class="layui-input-inline">
										        <select name="quiz">
										          <option value="">請選擇付款方式</option>
										          <option value="你工作的第一个城市">信用卡付款</option>
										          <option value="你工作的第一个城市">銀行轉賬</option>
										          
										        </select>
										      </div>
										    </div>
										    
										    <div class="layui-inline">
										      <!-- <label class="layui-form-label">分组选择框</label> -->
										      <div class="layui-input-inline">
										        <select name="quiz">
										          <option value="">請選擇付款憑證審核狀態</option>
										          <option value="你工作的第一个城市">未通過</option>
										          <option value="你工作的第一个城市">已通過</option>
										          <option value="你工作的第一个城市">未審核</option>
										        </select>
										      </div>
										    </div>
										    
										 </div>
									     <div class="layui-form-item" pane="">
										    <label class="layui-form-label layui-label-ck" ></label>
										    <div class="layui-input-inline">
										      <input type="checkbox" name="like1[write]" lay-skin="primary" title="有可儲值屋幣量" checked="">
										     
										    </div>
										    <div class="layui-inline">
										      <label class="layui-form-label layui-label1-width" >儲值屋幣時間</label>
										      <div class="layui-input-inline">
										        <input type="text" name="date" id="date"  placeholder="起始日期" autocomplete="off" class="layui-input">
										      </div>
										      <label class="layui-form-label" style="width:10px;padding:10px 0 10px 0;text-align: left;">-</label>
										      <div class="layui-input-inline">
										        <input type="text" name="date1" id="date1"  placeholder="結束日期" autocomplete="off" class="layui-input">
										      </div>
										    </div>
										    
										    <div class="layui-inline">
										      <label class="layui-form-label layui-label1-width" >儲值屋幣時間</label>
										      <div class="layui-input-inline layui-inline-width" >
										        <input type="text" name="date" id="date2"  placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
										      </div>
										      <label class="layui-form-label" style="width:10px;padding:10px 0 10px 0;text-align: left;">-</label>
										      <div class="layui-input-inline layui-inline-width" >
										        <input type="text" name="date1" id="date3"  placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
										      </div>
										    </div>
										  </div>
										  <div class="layui-form-item">
											    <div class="layui-input-block">
											      <button class="layui-btn" lay-submit="" lay-filter="demo">查找</button>
											      <button type="reset" class="layui-btn layui-btn-primary">導出</button>
											    </div>
										  </div>
										  
								   </form>
					        </div>
		    </div>
		</div>
		<div id="test">1231312</div>
	<jsp:include page="../include/footer.jsp"/>
   </body>
<!-- <script src="/static/layui.js"></script> -->
<script src="/static-res/js/tradeManager/getPage.js"></script>
<script type="text/javascript"></script>
<script>
/* window.onload=function(){
	//getPage();
 } */
</script>
</body>
</html>