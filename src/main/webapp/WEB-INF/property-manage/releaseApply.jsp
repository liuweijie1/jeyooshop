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
    <title>放盤管理/放盤審核</title>
    <link rel="stylesheet" href="/static/css/layui.css">
    <style type="text/css">
    	.layui-body{
    		background-color:  	#f3f3f4;
    	}
    	.layui-input-width{
    		width:200px !important;
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
		<input type="hidden" value="${resource }" name="resource" id="resource">
		
		<div class="layui-layout layui-layout-admin">
		    <div class="layui-body">
		        <!-- 内容主体区域 -->
		        <div style="padding: 15px;">
		        	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
					  <legend>放盤管理/放盤審核</legend>
					</fieldset>
					<!-- <div class="layui-col-xs6 layui-col-md12">
					      <div class="grid-demo grid-demo-bg2" style="background-color:#52cdec;line-height:50px;padding:0 30px;font-size:18px;color:white;">放盤審核</div>
					    </div>	     -->   	
					<div class="layui-row layui-col-space15">
					    <div class="layui-col-md12">
					      <div class="layui-card">
					        <!-- <div class="layui-card-header">卡片面板</div> -->
					        <div class="layui-card-body">
					        	<form class="layui-form" action="">
									  <div class="layui-form-item">

										    <div class="layui-inline">
										      <!-- <label class="layui-form-label layui-label-width" >請輸入會員號:</label> -->
										      <div class="layui-input-inline">
										        <input id="propertyId" placeholder="請輸入樓盤編號" type="tel"  autocomplete="off" class="layui-input" value="">
										      </div>
										    </div>
										    <!-- <div class="layui-inline">
										      <div class="layui-input-inline">
										        <input id="estateName" placeholder="請輸入屋苑名"  type="tel"  autocomplete="off" class="layui-input" value="">
										      </div>
										    </div> -->
										   
										    <div class="layui-inline">
										      <!-- <label class="layui-form-label">分组选择框</label> -->
										      <div class="layui-input-inline">
										        <select name="propertysource" id="propertySource">
										          <option value="">請選擇盤源類型</option>
										          
										            <option value="1">業主盤</option>
										            <option value="2">代理盤</option>
										            <option value="accountid">PMS</option>
										          
										        </select>
										      </div>
										    </div>
										    <!-- <div class="layui-inline">
										      <label class="layui-form-label">分组选择框</label>
										      <div class="layui-input-inline">
										        <select name="approvalStatus" id="approvalStatus">
										          <option value="">請選擇放盤審核狀態</option>
										          <option value="0">未審核</option>
										          <option value="1">已通過</option>
										          <option value="2">未通過</option>
										        </select>
										      </div>
										    </div> -->
										    <div class="layui-inline">
										      <!-- <label class="layui-form-label">分组选择框</label> -->
										      <div class="layui-input-inline">
										        <select name="paymentstatus" id="paymentstatus">
										          <option value="">請選擇付款狀態</option>
										          <option value="0">未付款</option>
										          <option value="1">已付款</option>
										        </select>
										      </div>
										    </div>
										    <div class="layui-inline">
										      <!-- <label class="layui-form-label" style="padding:9px 0;text-align: left;width: 70px;" >放盤時間 :</label> -->
										      <div class="layui-input-inline ">
										        <input type="text" name="beginPublictime" id="beginPublictime"  placeholder="放盤-起始日期" autocomplete="off" class="layui-input">
										      </div>
										      <label class="layui-form-label" style="width:10px;padding:10px 4px 10px 0;text-align: left;">-</label>
										      <div class="layui-input-inline ">
										        <input type="text" name="endPublictime" id="endPublictime"  placeholder="放盤-結束日期" autocomplete="off" class="layui-input">
										      </div>
										    </div>
										  <div class="layui-inline" style="height: 38px;">
											  <div class="layui-input-inline" style="width: 120px;">
												  <input type="checkbox" id="estateid" name="estateid" lay-skin="primary" title="只看自建樓盤"  lay-filter="test">
											  </div>
											  <input type="button" value="查找" class="layui-btn" id="searchBtn"></input>
										  </div>

										    <!-- <div class="layui-inline">
										      <label class="layui-form-label" style="padding:9px 0;text-align: left;width: 70px;">審核時間 :</label>
										      <div class="layui-input-inline " >
										        <input type="text" name="beginApprovalTime" id="beginApprovalTime"  placeholder="審核時間-起始日期" autocomplete="off" class="layui-input">
										      </div>
										      <label class="layui-form-label" style="width:10px;padding:10px 0 10px 0;text-align: left;">-</label>
										      <div class="layui-input-inline " >
										        <input type="text" name="endApprovalTime" id="endApprovalTime"  placeholder="審核時間-結束日期" autocomplete="off" class="layui-input">
										      </div>
												<input type="button" value="查找" class="layui-btn" id="searchBtn"></input>
										    </div> -->
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
							</table>
							<script type="text/html" id="barDemo">
									<a class="layui-btn layui-btn-xs" lay-event="manager" style="width:50px;">管理</a>
							</script>
							<!-- {{#  if(d.propertystatus != "管理員下架"){ }}
									<a class="layui-btn layui-btn-xs" value="{{d.propertystatus}}" lay-event="detail" style="width:50px;">下架</a>
 								{{#  } }}	 -->
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
<script src="/static-res/js/propertyManager/releaseApply.js?v=<%=System.currentTimeMillis() %>"></script>
<script type="text/javascript"></script>
<script>
    /* window.onload=function(){
        //getPage();
     } */
</script>
</body>
</html>