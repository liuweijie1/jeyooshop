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

        #layui-input-width{
            width:250px;
        }
        .layui-label-width{
            width:130px !important;
        }
        .layui-label1-width{

            width:120px !important;
        }
        .layui-label-ck{
            width:0 !important;
        }
        .layui-inline-width{
            width:120px !important;
        }
        .layui-input-inline{
            width:120px !important;

        }
        .innerDemo{
            width:90px !important;
        }
        
        .score{
            width: 350px;
            text-align: center;
            padding-top: 10px;
            height: 100px;
        }
        #score .line{
            margin-top: 15px;
        }
        #score .enline{
            margin-top: 15px;
             margin-left: 112px;
        }
        
         #score .red{
            color:red;
        }
         #editscore .red{
            color:red;
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
                    <div class="grid-demo grid-demo-bg2" style="background-color:#52cdec;line-height:50px;padding:0 30px;font-size:18px;">資訊一級分類列表</div>
                </div>
            </div>
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <!-- <div class="layui-card-header">卡片面板</div> -->
                        <div class="layui-card-body">
                        
                        
                            <form class="layui-form" action="" id="formDemo">
                                
                            </form>
                            <div class="layui-inline innerDemo">
                                        <div class="layui-input-inline ">
                                            <button class="layui-btn innerDemo" lay-submit="" lay-filter="demo" onclick="add()">添加</button>
                                          </div>
                                    </div>
                                    <div class="layui-inline ">
                                        <div class="layui-input-inline">
                                            <button class="layui-btn innerDemo" style="display: none;" lay-submit="" lay-filter="demo1">導出</button>
                                            </div>
                                    </div>
                            
                                    
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
 
       <form class="layui-form" action="" id="addformDemo"> 
<div class="" id="score">
   		<div style="padding:0 15px;">
       	<fieldset class="layui-elem-field layui-field-title" style="text-align: center;">
		  <legend>添加咨詢一級分類</legend>
		</fieldset>
		
		<div class="layui-form-item">
		    <div class="layui-inline">
		      <label class="layui-form-label layui-label-width" ><span class="red">*</span>一級分類 :</label>
		      <div class="layui-input-inline" >
		         <input type="tel" name="categoryName" id="categoryName" placeholder="請輸入簡體中文分類"  autocomplete="off" class="layui-input checkOrder1" value="" maxlength="10">   
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
		      <input type="tel" name="sequence" id="sequence" placeholder="請輸入英文分類" autocomplete="off" class="layui-input checkOrder1" value=""  maxlength="10"
		       onkeyup="if(value.length==1){value=value.replace(/[^(\-?)\d+]/ig,'')}else{value=value.substring(0,1)+value.substring(1,value.length).replace(/[^\d+]/ig,'');}" > 
		      </div>
		    </div>
		 </div>
		 <div class="layui-form-item">
		    <div class="layui-inline">
		      <label class="layui-form-label layui-label-width" >是否在外網顯示:</label>
		      <div class="layui-input-inline">
		      	<!--  <input type="radio" name="isShow" id="isShow" value="0" title="不顯示" > -->
		      	  <input type="checkbox" id="isShow" name="isShow" lay-skin="primary" title="不顯示" value="0" lay-filter="test">
		      </div>
		    </div>
		 </div>
		
   	</div>
   
   </div>
   </form>
   <form class="layui-form" action="" id="ediformDemo">
   
   <div class="" id="editscore">
   		<div style="padding:0 15px;">
       	<fieldset class="layui-elem-field layui-field-title" style="text-align: center;">
		  <legend>添加咨詢一級分類</legend>
		</fieldset>
		
		<div class="layui-form-item">
		    <div class="layui-inline">
		      <label class="layui-form-label layui-label-width" ><span class="red">*</span>一級分類 :</label>
		      <div class="layui-input-inline" >
		         <input type="tel" name="categoryName" id="edcategoryName" placeholder="請輸入簡體中文分類"  autocomplete="off" class="layui-input checkOrder1" value=""  maxlength="10">   
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
		      <input type="tel" name="sequence" id="edsequence" placeholder="請輸入英文分類" autocomplete="off" class="layui-input checkOrder1" value=""  maxlength="10"
		       onkeyup="if(value.length==1){value=value.replace(/[^(\-?)\d+]/ig,'')}else{value=value.substring(0,1)+value.substring(1,value.length).replace(/[^\d+]/ig,'');}" > 
		      </div>
		    </div>
		 </div>
		 <div class="layui-form-item">
		    <div class="layui-inline">
		      <label class="layui-form-label layui-label-width" >是否在外網顯示:</label>
		      <div class="layui-input-inline">
		      <!-- 	 <input type="radio" name="isShow" id="edisShow" value="0" title="不顯示" > -->
		      	 <input type="checkbox" id="edisShow" name="edisShow" lay-skin="primary" title="不顯示" value="0" lay-filter="test">

		      </div>
		    </div>
		 </div>
		
   	</div>
   
   </div>
</form>
<script src="/static-res/js/infomationManage/category.js"></script>
</html>



   