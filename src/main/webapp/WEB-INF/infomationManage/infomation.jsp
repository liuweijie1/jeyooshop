<%--
  Created by IntelliJ IDEA.
  User: wbliuwj
  Date: 2019/4/23
  Time: 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
    	.layui-label1-width1{
    		
    		width:70px !important;
    	}
    	.layui-label-ck{
    		width:0 !important;
    	}
    	.layui-inline-width{
    		width:160px !important;
    	}
    	.layui-form-label1{
    	
    	float: left;
	    display: block;
	    padding: 9px 2px;
	    width: 80px;
	    font-weight: 400;
	    line-height: 20px;
	    text-align: left;
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
                <legend>資訊管理</legend>
            </fieldset>

            <div class="layui-row">

                <div class="layui-col-xs6 layui-col-md12">
                    <div class="grid-demo grid-demo-bg2" style="background-color:#52cdec;line-height:50px;padding:0 30px;font-size:18px;">新聞資訊列表</div>
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
										     <!--  <label class="layui-form-label layui-label-width" >請輸入資訊標題:</label> -->
										      <div class="layui-input-inline">
										        <input id="title" type="tel" name="title"  placeholder="請輸入資訊標題"autocomplete="off" class="layui-input" value="">
										      </div>
										    </div>
										   
										    <div class="layui-inline">
										      <!-- <label class="layui-form-label">分组选择框</label> -->
										      <div class="layui-input-inline">
										        <select name="categoryname" lay-filter="test" id="categoryname">
										          <!-- <option value="">請選擇付款狀態</option>
										          
										            <option value="1">已付款</option>
										            <option value="0">未付款</option> -->
										          
										        </select>
										      </div>
										    </div>
										    <div class="layui-inline">
										      <!-- <label class="layui-form-label">分组选择框</label> -->
										      <div class="layui-input-inline">
										        <select name="subcategoryname" id="subcategoryname">
										         <!--  <option value="">請選擇付款方式</option>
										          <option value="0">信用卡付款</option>
										          <option value="1">銀行轉賬</option> -->
										          
										        </select>
										      </div>
										    </div>
										    <div class="layui-inline">
										      <label class="layui-form-label layui-label1-width" >發佈時間:</label>
										      <div class="layui-input-inline layui-inline-width">
										        <input type="text" name="beginTime" id="beginpublishTime"  placeholder="起始日期" autocomplete="off" class="layui-input">
										      </div>
										      <label class="layui-form-label" style="width:10px;padding:10px 0 10px 0;text-align: left;">-</label>
										      <div class="layui-input-inline layui-inline-width">
										        <input type="text" name="endTime" id="endpublishTime"  placeholder="結束日期" autocomplete="off" class="layui-input">
										      </div>
										    </div>
										    
										 </div>
									     <div class="layui-form-item" pane="">
										    <!-- <label class="layui-form-label layui-label-ck" ></label>
										    <div class="layui-input-inline">
										      <input type="checkbox" id="propertycoin" name="propertycoin" lay-skin="primary" title="有可儲值屋幣量"  lay-filter="test">
										     
										    </div> -->
										   
										    
										    <div class="layui-inline">
										      <label class="layui-form-label1 layui-label1-width1" >修改時間:</label>
										      <div class="layui-input-inline layui-inline-width" >
										        <input type="text" name="beginEvidenceTime" id="beginupdateTime"  placeholder="起始日期" autocomplete="off" class="layui-input"/>
										      </div>
										      <label class="layui-form-label" style="width:10px;padding:10px 0 10px 0;text-align: left;">-</label>
										      <div class="layui-input-inline layui-inline-width" >
										        <input type="text" name="endEvidenceTime" id="endupdateTime"  placeholder="結束日期" autocomplete="off" class="layui-input"/>
										      </div>
												<input type="button" value="查找" class="layui-btn" id="searchBtn"></input>
												<input type="button" value="添加資訊" class="layui-btn" id="addBtn"></input>
										    </div>
										  </div>
										  
										  
								   </form>
<%--                            <div class="layui-inline innerDemo">
                                        <div class="layui-input-inline ">
                                            <button class="layui-btn innerDemo" id="searchBtn" lay-submit="" lay-filter="demo" ">查找</button>
                                          </div>
                                    </div>
                                     <div class="layui-inline ">
                                        <div class="layui-input-inline">
                                            <button class="layui-btn innerDemo"  id="addBtn" lay-submit="" lay-filter="demo1">添加資訊</button>
                                            </div>
                                    </div>
                                    <div class="layui-inline ">
                                        <div class="layui-input-inline">
                                            <button class="layui-btn innerDemo" style="display: none;" lay-submit="" lay-filter="demo1">導出</button>
                                            </div>
                                    </div>--%>
                            
                                    
                        </div>
                    </div>
                </div>


            </div>

            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12  ">
                  

                    <table class="layui-table-cell" style="height:inherit;" id="usercontact"  lay-size="lg" lay-filter="usertool">
                    
                    <script type="text/html" id="barDemo">
									<a class="layui-btn layui-btn-xs" lay-event="edit">管理</a>
									<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">刪除</a>
							</script>
                    </table>
                </div>
            </div>
            
            
            
        </div>
    </div>
</div>
<jsp:include page="../include/footer.jsp"/>
</body>
 
<div class="" id="score">
   		<div style="padding:0 15px;">
       	<fieldset class="layui-elem-field layui-field-title" style="text-align: center;">
		  <legend>添加咨詢一級分類</legend>
		</fieldset>
		<div class="layui-form-item">
		    <div class="layui-inline">
		      <label class="layui-form-label layui-label-width" ><span class="red">*</span>一級分類 :</label>
		     
                                        <!-- <label class="layui-form-label">分组选择框</label> -->
                                        <div class="layui-input-inline" id="catdiv">
                                            <select name="catselect" id="catselect">
                                                <option value="">請選擇檢舉渠道</option>
                                                <option value="app">app</option>
                                                <option value="wap">wap</option>

                                            </select>
                                        </div>
                                   
		    </div>
		 </div>
		<div class="layui-form-item">
		    <div class="layui-inline">
		      <label class="layui-form-label layui-label-width" ><span class="red">*</span>二級分類 :</label>
		      <div class="layui-input-inline" >
		         <input type="tel" name="categoryName" id="categoryName" placeholder="請輸入簡體中文分類"  autocomplete="off" class="layui-input checkOrder1" value="" 
		       maxlength="10"
		         >   
		      </div>
		      
		      <div class="layui-input-inline" >
		      <label class="layui-form-label layui-label-width " style=" color: #999!important;">中文不超過10個字</label> 
		      </div>
		      
		    </div>
		 </div>
		 <div class="layui-form-item">
		    <div class="layui-inline">
		      <label class="layui-form-label layui-label-width" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
		      <div class="layui-input-inline" >
		         <input type="tel" name="categoryNameEN"  id="categoryNameEN" placeholder="請輸入英文分類" autocomplete="off" class="layui-input checkOrder1" value="" 
		         maxlength="30">   
		      </div>
		      
		      <div class="layui-input-inline" >
		      <label class="layui-form-label layui-label-width " style=" color: #999!important;">英文不超過30個字母</label> 
		      </div>
		      
		    </div>
		 </div>
		 
	    <div class="layui-form-item">
		    <div class="layui-inline">
		      <label class="layui-form-label layui-label-width" ><span class="red">*</span>分類排序 :</label>
		      <div class="layui-input-inline">
		      	<%-- <label class="layui-form-label layui-label-width" >${userOrder.orderid }</label> --%>
		      <input type="tel" name="sequence" id="sequence" placeholder="請輸入英文分類" autocomplete="off" class="layui-input checkOrder1" value=""
		       onkeyup="if(value.length==1){value=value.replace(/[^(\-?)\d+]/ig,'')}else{value=value.substring(0,1)+value.substring(1,value.length).replace(/[^\d+]/ig,'');}" > 
		      </div>
		    </div>
		 </div>
		 <div class="layui-form-item">
		    <div class="layui-inline">
		      <label class="layui-form-label layui-label-width" >是否在外網顯示:</label>
		      <div class="layui-input-inline">
		      	 <input type="radio" name="isShow" id="isShow" value="0" title="不顯示" >
		      </div>
		    </div>
		 </div>
		
   	</div>
   
   </div>
   
   
   <!-- 編輯二級分類 -->
   
   <div class="" id="editscore">
   		<div style="padding:0 15px;">
       	<fieldset class="layui-elem-field layui-field-title" style="text-align: center;">
		  <legend>添加咨詢一級分類</legend>
		</fieldset>
		<div class="layui-form-item">
		    <div class="layui-inline">
		      <label class="layui-form-label layui-label-width" ><span class="red">*</span>一級分類 :</label>
		     <!--  <div class="layui-input-inline" >
		         <input type="tel" name="categoryName" id="edcategoryName" placeholder="請輸入簡體中文分類"  autocomplete="off" class="layui-input checkOrder1" value="" 
		       maxlength="10">   
		      </div> -->
		      
		      
		      <label class="layui-label-width textlabel" id="yiji" ></label> 
		     
		      
		    </div>
		 </div>
		<div class="layui-form-item">
		    <div class="layui-inline">
		      <label class="layui-form-label layui-label-width" ><span class="red">*</span>二級分類 :</label>
		      <div class="layui-input-inline" >
		         <input type="tel" name="categoryName" id="edcategoryName" placeholder="請輸入簡體中文分類"  autocomplete="off" class="layui-input checkOrder1" value="" 
		       maxlength="10">   
		      </div>
		      
		      <div class="layui-input-inline" >
		      <label class="layui-form-label layui-label-width " style=" color: #999!important;">中文不超過10個字</label> 
		      </div>
		      
		    </div>
		 </div>
		 <div class="layui-form-item">
		    <div class="layui-inline">
		      <label class="layui-form-label layui-label-width" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
		      <div class="layui-input-inline" >
		         <input type="tel" name="categoryNameEN"  id="edcategoryNameEN" placeholder="請輸入英文分類" autocomplete="off" class="layui-input checkOrder1" value="" 
		         maxlength="30">   
		      </div>
		      
		      <div class="layui-input-inline" >
		      <label class="layui-form-label layui-label-width " style=" color: #999!important;">英文不超過30個字母</label> 
		      </div>
		      
		    </div>
		 </div>
		 
	    <div class="layui-form-item">
		    <div class="layui-inline">
		      <label class="layui-form-label layui-label-width" ><span class="red">*</span>分類排序 :</label>
		      <div class="layui-input-inline">
		      	<%-- <label class="layui-form-label layui-label-width" >${userOrder.orderid }</label> --%>
		      <input type="tel" name="sequence" id="edsequence" placeholder="請輸入英文分類" autocomplete="off" class="layui-input checkOrder1" value=""
		       onkeyup="if(value.length==1){value=value.replace(/[^(\-?)\d+]/ig,'')}else{value=value.substring(0,1)+value.substring(1,value.length).replace(/[^\d+]/ig,'');}" > 
		      </div>
		    </div>
		 </div>
		 <div class="layui-form-item">
		    <div class="layui-inline">
		      <label class="layui-form-label layui-label-width" >是否在外網顯示:</label>
		      <div class="layui-input-inline">
		      	 <input type="radio" name="isShow" id="edisShow" value="0" title="不顯示" >
		      </div>
		    </div>
		 </div>
		
   	</div>
   
   </div>

<script src="/static-res/js/infomationManage/infomation.js"></script>

</html>
