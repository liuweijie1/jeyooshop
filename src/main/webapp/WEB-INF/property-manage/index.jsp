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
    <title>放盤管理/放盤列表</title>
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
					  <legend>放盤管理/放盤列表</legend>
					</fieldset>
					<!-- <div class="layui-col-xs6 layui-col-md12">
					      <div class="grid-demo grid-demo-bg2" style="background-color:#52cdec;line-height:50px;padding:0 30px;font-size:18px;color:white;">放盤列表</div>
					    </div>	    -->    	
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
										    <div class="layui-inline">
										      <!-- <label class="layui-form-label">分组选择框</label> -->
										      <div class="layui-input-inline">
										        <select name="propertystatus" id="propertyStatus">
										          <option value="">請選擇樓盤狀態</option>
										          <option value="0">封盤</option>
										          <option value="1">待售/租</option>
										         <!--  <option value="2">管理員下架</option> -->
										          <option value="3">已售/租</option>
										        </select>
										      </div>
										    </div>
										    
										    <!-- <div class="layui-inline">
										      <label class="layui-form-label">分组选择框</label>
										      <div class="layui-input-inline layui-input-width">
										        <select name="isHide" id="isHide">
										          <option value="">請選擇樓盤顯示狀態</option>
										          <option value="1">顯示</option>
										          <option value="0">隱藏</option>
										        </select>
										      </div>
										    </div> -->
										    
										    <div class="layui-inline">
										      <!-- <label class="layui-form-label">分组选择框</label> -->
										      <div class="layui-input-inline layui-input-width">
										        <select  id="isadminoffline">
										          <option value="">請選擇樓盤上下架狀態</option>
										          <option value="0">上架</option>
										          <option value="1">下架</option>
										        </select>
										      </div>
										    </div>
										    <div class="layui-inline">
										      <!-- <label class="layui-form-label">分组选择框</label> -->
										      <div class="layui-input-inline layui-input-width">
										        <select  id="rentaltype">
										          <option value="">請選擇租售狀態</option>
										          <option value="1">放售</option>
										          <option value="2">放租</option>
										        </select>
										      </div>
										    </div>
										   <%-- <div class="layui-inline" style="width: 100px;height: 38px;">
												<div class="layui-input-inline">

											    </div>
											</div>--%>
										    <div class="layui-inline">
										      <!-- <label class="layui-form-label" style="padding:9px 0;text-align: left;width: 70px;">放盤日期:</label> -->
										      <div class="layui-input-inline ">
										        <input type="text" name="beginTime" id="beginTime"  placeholder="放盤-起始日期" autocomplete="off" class="layui-input">
										      </div>
										      <label class="layui-form-label" style="width:10px;padding:10px 4px 10px 0;text-align: left;">-</label>
										      <div class="layui-input-inline ">
										        <input type="text" name="endTime" id="endTime"  placeholder="放盤-結束日期" autocomplete="off" class="layui-input">
										      </div>
										    </div>
										    
										    <div class="layui-inline">
										      <!-- <label class="layui-form-label layui-label1-width" >更新時間 :</label>
										      <div class="layui-input-inline layui-inline-width" >
										        <input type="text" name="beginUpdateTime" id="beginUpdateTime"  placeholder="起始日期" autocomplete="off" class="layui-input"/>
										      </div>
										      <label class="layui-form-label" style="width:10px;padding:10px 0 10px 0;text-align: left;">-</label>
										      <div class="layui-input-inline layui-inline-width" >
										        <input type="text" name="endUpdateTime" id="endUpdateTime"  placeholder="結束日期" autocomplete="off" class="layui-input"/>
										      </div> -->
												<div class="layui-input-inline" style="width: 120px;height: 38px;">

													<input type="checkbox" id="estateid" name="estateid" lay-skin="primary" title="只看自建樓盤"  lay-filter="test">
												</div>
												<input type="button" value="查找" class="layui-btn" id="searchBtn"></input>
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
							</table>
							<script type="text/html" id="barDemo">
									<a class="layui-btn layui-btn-xs" lay-event="detail" style="width:50px;">預覽</a>
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
<script src="/static-res/js/propertyManager/propertyManager.js?v=<%=System.currentTimeMillis() %>"></script>
<script type="text/html" id="switchTpl">
  	<input type="checkbox" name="upDown" tag="{{d.propertyid}}" value="{{d.upOrDown}}" lay-skin="switch" lay-text="上架|下架" lay-filter="upDown" {{ d.isadminoffline == '0' ? 'checked' : '' }}/>
</script>
<!--上架功能隱藏 <input type="checkbox" name="upDown" tag="{{d.propertyid}}" value="{{d.upOrDown}}" lay-skin="switch" lay-text="下架|上架" lay-filter="upDown" {{ d.upOrDown != '2' ? 'checked' : ('','disabled') }}/>  -->
<script type="text/javascript"></script>
<script>
    /* window.onload=function(){
        //getPage();
     } */
</script>
</body>
</html>