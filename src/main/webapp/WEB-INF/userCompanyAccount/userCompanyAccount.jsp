<%--
  Created by IntelliJ IDEA.
  User: wbliuwj
  Date: 2019/4/23
  Time: 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta http-equiv="Expires" content="0">
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Cache-control" content="no-cache">
	<meta http-equiv="Cache" content="no-cache">
<title>代理公司管理/公司（總行）管理員賬戶管理</title>
<link rel="stylesheet" href="/static/css/layui.css">
<style type="text/css">
body .layui-layer-btn {
  
    text-align: center;
   
}

.layui-body {
	background-color: #f3f3f4;
}

#layui-input-width {
	width: 250px;
}

.layui-label-width {
	width: 130px !important;
}

.layui-label1-width {
	width: 120px !important;
}

.layui-label-ck {
	width: 0 !important;
}

.layui-inline-width {
	width: 120px !important;
}

.layui-label-widthed {
	width: 300px !important;
}

.layui-form-labeled {
	float: left;
	display: block;
	padding: 9px 0px;
	width: 80px;
	font-weight: 400;
	line-height: 20px;
	text-align: left;
}

.layui-input-inline {
	width: 170px !important;
}

*
        .innerDemo {
	width: 90px !important;
}

.score {
	width: 350px;
	text-align: center;
	padding-top: 10px;
	height: 100px;
}

#score .line {
	margin-top: 15px;
}

#score .enline {
	margin-top: 15px;
	margin-left: 112px;
}

.red {
	color: red;
}

#editscore .red {
	color: red;
}

.textlabel {
	float: left;
	display: block;
	padding: 9px 15px;
	margin: 1px 1px 1px -14px;
	width: 80px font-weight: 400;
	line-height: 20px;
	text-align: left;
}

.layui-label-widthcat {
	width: 380px !important;
}
</style>
<script type="text/javascript"
	src="/static-res/js/jquery/jquery-3.4.0.min.js"></script>
</head>
<jsp:include page="../include/header.jsp" />
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-body">
			<!-- 内容主体区域 -->
			<div style="padding: 15px;">
				<fieldset class="layui-elem-field layui-field-title"
					style="margin-top: 20px;">
					<legend>代理公司管理/公司（總行）管理員賬戶管理</legend>
				</fieldset>

				
				<div class="layui-row layui-col-space15">
					<div class="layui-col-md12">
						<div class="layui-card">
							<!-- <div class="layui-card-header">卡片面板</div> -->
							<div class="layui-card-body">


								<form class="layui-form" action="" id="formDemo">

									<div class="layui-form-item">
										<div class="layui-inline" style="width: 190px">

											<select name="modules" lay-verify="required" lay-search=""
												id="companyname">
												<option value="">請選擇/輸入代理公司</option>
												<c:if test="${companyname != null}">
													<c:forEach var="iter" items="${companyname}">
														<option value="${iter.CompanyID}" data-comen="${iter.CompanyNameEN}">${iter.CompanyName}</option>
													</c:forEach>
												</c:if>
											</select>
										</div>

										<div class="layui-inline" style="width: 190px">

											<select name="modules" lay-verify="required" lay-search=""
												id="state">
												<option value="">請選擇/賬戶狀態</option>
												
													
														<option value="Normal" >正常</option>
													    <option value="Disable" >停用</option>
												
											</select>
										</div>
										
										<input type="button" value="查找" class="layui-btn"
											id="searchBtn"></input> <input type="button" value="添加賬戶"
											class="layui-btn" id="addBtn" onclick="add()"></input>
									</div>
								</form>
								<!-- <div class="layui-inline innerDemo"> 
                                        <div class="layui-input-inline ">
                                            <button class="layui-btn innerDemo" lay-submit="" lay-filter="demo" onclick="add()">添加</button>
                                          </div>
                                    </div>
                                    <div class="layui-inline ">
                                        <div class="layui-input-inline">
                                            <button class="layui-btn innerDemo" style="display: none;" lay-submit="" lay-filter="demo1">導出</button>
                                            </div>
                                    </div>
                             -->

							</div>
						</div>
					</div>


				</div>

				<div class="layui-row layui-col-space15">
					<div class="layui-col-md12  ">


						<table class="layui-table-cell" style="height: inherit;"
							id="usercontact" lay-size="lg" lay-filter="usertool">

							<script type="text/html" id="barDemo">
									<a class="layui-btn layui-btn-xs" lay-event="edit">管理</a>
									
							</script>
						</table>
					</div>
				</div>



			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />
</body>

<form class="layui-form" action="jacascript::void(0);" id="coinsetForm">
	<div id="storeValuePage" style="display: none;">
		<div style="padding: 0 15px;">
			
			<div  style="  margin: 20px 250px 5px;font-size: 20px; font-weight: 300;">添加賬戶</div>
			<table class="layui-table" lay-skin="nob" id="coinsetTable">
				<tr>
					<td><span class="red">*</span>代理公司名稱:</td>

					<td><select name="catselect" lay-verify="required"
						lay-search="" id="catselect">
					</select></td>
					<td><label class="layui-form-label layui-label-width "
						style="color: #999 !important;">一個代理公司可添加多個總行管理員賬戶</label></td>
				</tr>

			</table>

			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" type="button" id="addCoinset">+添加總行管理員賬戶</button>
					<!-- <button type="reset" class="layui-btn layui-btn-primary">導出</button> -->
				</div>
			</div>
		</div>

	</div>
</form>

<!-- 編輯賬戶-->
<form class="layui-form" action="" id="addformDemo">
	<div class="" id="editscore">
		<div style="padding: 0 15px;">
		
			<div  style="  margin: 20px 235px 13px;font-size: 20px; font-weight: 300;">修改賬戶</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label layui-label-width">代理公司名稱 :</label>

					<!-- <label class="layui-form-label">分组选择框</label> -->
					<div class="layui-input-inline" id="catdiv">
						<!--  <select name="editselect" lay-verify="required" lay-search="" id="editselect">
                                                <option value="">請選擇檢舉渠道</option>
                                                <option value="app">app</option>
                                                <option value="wap">wap</option>

                                            </select> -->

						<label class="layui-form-labeled layui-label-widthed"
							id="editselect"></label>
					</div>

				</div>
			</div>
			<!--  <div class="layui-form-item">
		    <div class="layui-inline">
		      <label class="layui-form-label layui-label-width" ><span class="red">*</span>賬號名 :</label>
		      <div class="layui-input-inline" >
		         <input type="tel"  id="edaccount"   autocomplete="off" class="layui-input checkOrder1" value="" 
		       maxlength="50"
		         >   
		      </div>
		       
		      <div class="layui-input-inline" >
		      <label class="layui-form-label layui-label-width " style=" color: #999!important;">中文不超過10個字</label> 
		      </div>
		      
		    </div>
		 </div> -->
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label layui-label-width">賬戶登入電郵:</label>
					<div class="layui-input-inline">
						<!--  <input type="tel"  id="edemail" autocomplete="off" class="layui-input checkOrder1" value="" 
		         maxlength="100">   -->
						<label class="layui-form-labeled layui-label-widthed" id="edemail"></label>
					</div>

					<!-- <div class="layui-input-inline" >
		      <label class="layui-form-label layui-label-width " style=" color: #999!important;">英文不超過30個字母</label> 
		      </div> -->

				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label layui-label-width"><span
						class="red">*</span>賬戶狀態 :</label>

					<!-- <label class="layui-form-label">分组选择框</label> -->
					<div class="layui-input-inline" id="catdiv">
						<select name="status" lay-verify="required" lay-search=""
							id="edstatus">

							<option value="Normal">正常</option>
							<option value="Disable">停用</option>

						</select>
					</div>

				</div>
			</div>


		</div>

	</div>
</form>
<script src="/static-res/js/userCompanyAccount/userCompanyAccount.js?v=<%=System.currentTimeMillis() %>"></script>

</html>
