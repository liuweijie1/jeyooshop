<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>標籤詞管理/標籤詞列表</title>
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
    	.layui-input-width1{
    		width: 300px !important;
    	}
    	.layui-anim-upbit{
    		height: 200px;
    	}
    	#storeValuePage .layui-table td{
    		padding: 5px !important;
    		text-align: right;
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
					  <legend>標籤詞管理/標籤詞列表</legend>
					</fieldset>
					<!-- <div class="layui-col-xs6 layui-col-md12">
					      <div class="grid-demo grid-demo-bg2" style="background-color:#52cdec;line-height:50px;padding:0 30px;font-size:18px;color:white;">標籤詞列表</div>
					    </div>	   -->     	
					<div class="layui-row layui-col-space15">
					    <div class="layui-col-md12">
					      <div class="layui-card">
					        <!-- <div class="layui-card-header">卡片面板</div> -->
					        <div class="layui-card-body">
					        	<form class="layui-form" action="javascript:void(0);" id="searchLabel">
								   <div class="layui-form-item">
									    <div class="layui-input-inline">
									        <input id="seachLabelname"  name="labelname" placeholder="請輸入標籤詞中文名稱" autocomplete="off" class="layui-input" value="">
									    </div>
									    <div class="layui-input-inline">
									        <input id="seachLabelnameen"  name="labelnameen" placeholder="請輸入標籤詞英文名稱" autocomplete="off" class="layui-input" value="">
									    </div>
								      <div class="layui-input-inline">
								        <select name="type" id="searchType">
								          <option value="">請選擇標籤詞類型</option>
								            <option value="rent">租屋</option>
								      		<option value="sale">二手</option>
								        </select>
								      </div>
									    <div class="layui-input-inline">
									    	<input type="button" value="查找" class="layui-btn" id="searchBtn"></input>
									      <button class="layui-btn"  id="addBtn" >添加標籤詞</button>
									      <!-- <button type="reset" class="layui-btn layui-btn-primary">導出</button> -->
									    </div>
								  </div>
								  <div class="layui-form-item">
									    	<p style="color: #666;">ps：每個分類的標簽詞各顯示20個，根據勾選的排序顯示，若同壹分類同壹個排序有多個標簽詞，則按照更新時間降序顯示；</p>
									</div>
								</form>
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
   <form class="layui-form" action="javascript:void(0);" id="coinsetForm">
   <div class="" id="storeValuePage" style="display: none;">
   		<div style="padding:0 15px;">
       	<!-- <fieldset class="layui-elem-field layui-field-title" style="text-align: center;">
		  <legend>添加標籤詞</legend>
		</fieldset> -->
		<div style="height: 75px;line-height: 75px;text-align: center;font-size: 20px;">添加標籤詞</div>
		 <table class="layui-table" lay-skin="nob" id="coinsetTable">
		 	<tr class="coinsetTr">
		 		<!-- <td>標籤詞類型:</td> -->
		 		<!-- <td><input type="tel" name="money"  autocomplete="off" class="layui-input" value="" ></td> -->
		 		<td style="width: 170px;text-align: left;">
				      <div class="layui-input-inline">
				        <select name="type" id="type">
				          <option value="">請選擇標籤詞類型</option>
				            <option value="rent">租屋</option>
				      		<option value="sale">二手</option>
				        </select>
				      </div>
		 		</td>
		 		<td>標籤詞中文名稱:</td>
		 		<td><input type="tel" name="labelname" placeholder="請輸入標籤詞中文名稱" maxlength="50"  autocomplete="off" class="layui-input" value="" ></td>
		 		<td>標籤詞英文名稱:</td>
		 		<td><input type="tel" name="labelnameen" placeholder="請輸入標籤詞英文名稱" maxlength="50" autocomplete="off" class="layui-input" value="" ></td>
				<td>標籤詞鏈接:</td>
		 		<td><input type="tel" name="labelurl" placeholder="請輸入標籤詞鏈接"  maxlength="200" autocomplete="off" class="layui-input" value="" ></td>
		 		<td style="width: 80px;">
				      <div class="layui-input-inline">
				        <select name="sequence" id="sequence">
				          	<option value="">排序</option>
			      		    <c:forEach begin="1" end="50" step="1" var="op">
						    	<option value="${op}">${op}</option>
						    </c:forEach>
				        </select>
				      </div>
		 		</td>
				<td>
					<button class="layui-btn layui-btn-danger" onclick="delRow(this)">刪除</button>
				</td>
		 	</tr>
		 </table>
		 
		 <div class="layui-form-item">
		 	<div class="layui-input-block">
		      <button class="layui-btn" type="button"  id="addCoinset">+標籤詞</button>
		      <!-- <button type="reset" class="layui-btn layui-btn-primary">導出</button> -->
		    </div>
		 </div>
   	</div>
   
   </div>
   </form>
   <div class="" id="labelManage">
   		<div style="padding:0 15px;">
       	<!-- <fieldset class="layui-elem-field layui-field-title" style="text-align: center;">
		  <legend>標籤詳情</legend>
		</fieldset> -->
		<div style="height: 75px;line-height: 75px;text-align: center;font-size: 20px;">標籤詳情</div>
		<form class="layui-form" action="" id="labelFrom">
		<div class="layui-form-item">
		    <div class="layui-inline">
		      <label class="layui-form-label layui-label-width" >標籤詞類型 :</label>
		      <div class="layui-input-inline">
		        <select name="type" id="labeltype">
		          <option value="">請選擇標籤詞類型</option>
		              <option value="rent">租屋</option>
				      <option value="sale">二手</option>
		        </select>
		      </div>
		    </div>
		 </div>
	    <div class="layui-form-item">
		    <div class="layui-inline">
		      <label class="layui-form-label layui-label-width" >標籤詞中文名稱 :</label>
		      <div class="layui-input-inline">
		        	<input type="text" id="labelname"  name="labelname" maxlength="50"  autocomplete="off" placeholder="请輸入標籤詞中文名稱 " class="layui-input layui-input-width1" value="${labelManage.labelname }">
		      </div>
		    </div>
		 </div>
		  <div class="layui-form-item">
		    <div class="layui-inline">
		      <label class="layui-form-label layui-label-width" >標籤詞英文名稱 :</label>
		      <div class="layui-input-inline">
		        	<input type="text" id="labelnameen"  name="labelnameen" maxlength="50"  autocomplete="off" placeholder="请輸入標籤詞英文名稱 " class="layui-input layui-input-width1" value="${labelManage.labelname }">
		      </div>
		    </div>
		 </div>
		 <div class="layui-form-item">
		    <div class="layui-inline">
		      <label class="layui-form-label layui-label-width" >標籤詞鏈接 :</label>
		      <div class="layui-input-inline">
		      		<input type="text" id="labelurl" name="labelurl" maxlength="200"  autocomplete="off" placeholder="请輸入標籤詞鏈接" class="layui-input layui-input-width1" value="${labelManage.labelurl }">
		      </div>
		    </div>
		 </div>
		 <div class="layui-form-item">
		    <div class="layui-inline">
		      <label class="layui-form-label layui-label-width" >排序 :</label>
		      <div class="layui-input-inline">
			        <select name="sequence" id="sequence1">
			          	<option value="">排序</option>
		      		    <c:forEach begin="1" end="50" step="1" var="op">
					    	<option value="${op}">${op}</option>
					    </c:forEach>
			        </select>
		      </div>
		    </div>
		 </div>
		 </form>
   	</div>
   
   </div>
<script src="/static-res/js/labelManage/labelManage.js?v=<%=System.currentTimeMillis() %>"></script>
<script type="text/html" id="barDemo">
	<a class="layui-btn layui-btn-xs" lay-event="manage" style="width:60px;">管理</a>
	<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="delLabel" style="width:60px;">删除</a>
</script>
<script type="text/javascript"></script>
<script>
    /* window.onload=function(){
        //getPage();
     } */
</script>
</body>
</html>