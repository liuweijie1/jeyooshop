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
					  <legend>屋幣配置</legend>
					</fieldset>
					<div class="layui-col-xs6 layui-col-md12">
					      <div class="grid-demo grid-demo-bg2" style="background-color:#52cdec;line-height:50px;padding:0 30px;font-size:18px;color:white;">屋幣/港幣管理</div>
					    </div>	       	
					<div class="layui-row layui-col-space15">
					    <div class="layui-col-md12">
					      <div class="layui-card">
					        <!-- <div class="layui-card-header">卡片面板</div> -->
					        <div class="layui-card-body">
					        	<form class="layui-form" action="">
									  
									    <div class="layui-form-item">
										   
										    <div class="layui-inline">
										      <!-- <label class="layui-form-label">分组选择框</label> -->
										      <div class="layui-input-inline">
										        <select name="isshow" id="isshow">
										          <option value="">請選擇下架狀態</option>
										            <option value="1">上架</option>
										            <option value="0">下架</option>
										          
										        </select>
										      </div>
										    </div>
										    <div class="layui-inline">
										      <!-- <label class="layui-form-label">分组选择框</label> -->
										      <div class="layui-input-inline">
										        <select name="type" id="type">
										          <option value="">請選擇分類</option>
										          <option value="2">普通會員</option>
										          <option value="1">代理公司</option>
										        </select>
										      </div>
										    </div>
										 </div>
								   </form>
								   <div class="layui-form-item">
									    <div class="layui-input-block">
									      <button class="layui-btn"  id="searchBtn">查找</button>
									      <button class="layui-btn"  id="addBtn" onclick="addBtn();">添加屋币/港币关系</button>
									      <!-- <button type="reset" class="layui-btn layui-btn-primary">導出</button> -->
									    </div>
								  </div>
					        </div>
					      </div>
					    </div>
				  	</div>
				  	<div class="layui-row layui-col-space15">
					    <div class="layui-col-md12">
					    	<table class="layui-table" id="demo"  lay-size="lg" lay-filter="test">
							</table>
					    </div>
					</div>
		        </div>
		        
		       
		    </div>
		</div>
	<jsp:include page="../include/footer.jsp"/>
   </body>
   <form class="layui-form" action="jacascript::void(0);" id="coinsetForm">
   <div class="" id="storeValuePage">
   		<div style="padding:0 15px;">
       	<fieldset class="layui-elem-field layui-field-title" style="text-align: center;">
		  <legend>儲值屋幣</legend>
		</fieldset>
		 <table class="layui-table" lay-skin="nob" id="coinsetTable">
		 	<tr class="coinsetTr">
		 		<td>港幣(HK$) :</td>
		 		<td><input type="tel" name="money" onkeypress='return( /[\d]/.test(String.fromCharCode(event.keyCode) ) )' autocomplete="off" class="layui-input" value="" ></td>
		 		<td>對應屋幣值 :</td>
		 		<td><input type="tel" name="propertycoin" onkeypress='return( /[\d]/.test(String.fromCharCode(event.keyCode) ) )'  autocomplete="off" class="layui-input" value="" ></td>
		 		<td><div class="layui-input-block" style="margin-left: 0px;">
					      <input type="radio" name="type" value="2" title="普通會員" checked="checked">
					      <input type="radio" name="type" value="1" title="代理公司">
				    </div>
				</td>
				<td>
					<button class="layui-btn layui-btn-danger" onclick="delRow(this)">刪除</button>
				</td>
		 	</tr>
		 </table>
		 
		 <div class="layui-form-item">
		 	<div class="layui-input-block">
		      <button class="layui-btn" type="button"  id="addCoinset">+添加屋币/港币关系</button>
		      <!-- <button type="reset" class="layui-btn layui-btn-primary">導出</button> -->
		    </div>
		 </div>
   	</div>
   
   </div>
   </form>
<script src="/static-res/js/propertyCoinset/propertyCoinset.js"></script>
<script type="text/html" id="switchTpl">
  	<input type="checkbox" name="upDown" tag="{{d.setid}}" value="{{d.isshow}}" lay-skin="switch" lay-text="下架|上架" lay-filter="upDown" {{ d.isshow == '1' ? 'checked' : ('','disabled') }}>
</script>
<script type="text/javascript"></script>
<script>
    /* window.onload=function(){
        //getPage();
     } */
</script>
</body>
</html>