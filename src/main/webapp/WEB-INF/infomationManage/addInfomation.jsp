
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>House730</title>
<link rel="stylesheet" href="/static-res/viewer/css/viewer.min.css">
<link rel="stylesheet" href="/static/css/layui.css">
<style type="text/css">
.layui-body {
	background-color: #f3f3f4;
}

#layui-input-width {
	width: 250px;
}

.layui-label-width {
	width: 200px !important;
	text-align: left !important;
	margin-left: 50px;
}

.layui-label1-width {
	width: 100px !important;
}

.layui-label-ck {
	width: 0 !important;
}

.layui-inline-width {
	width: 120px !important;
}

.layui-input-inlinetime {
	width: 220px !important;
}

.layui-inline-widthtime {
	width: 170px !important;
}

.layui-input-inlinetime {
	float: right;
}

.layui-input-inlineinfotitle {
	float: right;
}

.layui-form-labelinfo {
	float: left;
	display: block;
	padding: 9px 0px 9px 12px;
	width: 80px;
	font-weight: 400;
	line-height: 20px;
}

}
.edlabel {
	margin: 4px 8px 10px 10px;
}

.eddiv {
	margin: 12px
}

.red {
	float: left;
	color: red;
}
</style>

</head>
<jsp:include page="../include/header.jsp" />
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-body">
			<!-- 内容主体区域 -->
			<div style="padding: 15px;">
				<fieldset class="layui-elem-field layui-field-title"
					style="margin-top: 20px;">
					<legend>資訊管理</legend>
				</fieldset>

				<div class="layui-row">

					<div class="layui-col-xs6 layui-col-md12">
						<div class="grid-demo grid-demo-bg2"
							style="background-color: #52cdec; line-height: 50px; padding: 0 30px; font-size: 18px; color: white;">添加新聞資訊</div>
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
											<label class="layui-form-label layui-label-width"><span
												class="red">*&nbsp&nbsp&nbsp</span>選擇資訊分類：</label>
											<div class="layui-input-inline">
												<select name="categoryname" lay-filter="test" id="categoryname">
													<!-- <option value="">請選擇付款狀態</option>

													<option value="1">已付款</option>
													<option value="0">未付款</option> -->

												</select>
											</div>
										</div>
									</div>

									<div class="layui-form-item">

										<div class="layui-inline">
											<label class="layui-form-label layui-label-width"></label>
											<div class="layui-input-inline">
												<select name="subcategoryname" id="subcategoryname">
												<option value="">請選擇咨詢二級分類</option>
													
													<!-- <option value="0">信用卡付款</option>
													<option value="1">銀行轉賬</option> -->

												</select>
											</div>
										</div>
									</div>

									<div class="layui-form-item">
										<div class="layui-inlineinfotitle">
											<label class="layui-form-labelinfo layui-label-width">資訊標題:</label>
											<span class="red">*&nbsp&nbsp&nbsp</span>
											<div class="layui-input-inline">
												<%-- <label class="layui-form-label layui-label-width" >${UserContact.phone}</label>  --%>

												<input type="tel" name="title" id="title"autocomplete="off"
													class="layui-input" value="" maxlength="30">
											</div>
											<div class="layui-input-inline">
												<label class="layui-form-label layui-label-width "
													style="color: #999 !important;">(繁體中文)&nbsp&nbsp&nbsp(30個字內)</label>
											</div>
										</div>
									</div>
									<div class="layui-form-item">
										<div class="layui-inline">
											<label class="layui-form-label layui-label-width"></label>
											<div class="layui-input-inline">
												<%-- <label class="layui-form-label layui-label-width" >${UserContact.phone}</label>  --%>
												<input type="tel" name="titleen" id="titleen" autocomplete="off"
													class="layui-input" value="" maxlength="50">
											</div>

											<div class="layui-input-inline">
												<label class="layui-form-label layui-label-width "
													style="color: #999 !important;">(英文)&nbsp&nbsp&nbsp(50個字內)</label>
											</div>
										</div>
									</div>
									<div class="layui-form-item">
										<div class="layui-inline">
											<label class="layui-form-label layui-label-width">封面圖:</label>
											<div class="layui-input-inline">
												<label class="layui-form-label layui-label-width">${UserContact.title}</label>
												<%-- <input type="tel" name="phone" autocomplete="off"
													class="layui-input" value="${UserContact.title}"> --%>
											</div>
										</div>
									</div>
									<div class="layui-form-item">
										<div class="layui-inline">
											<label class="layui-form-label layui-label-width">資訊正文:</label>
											<div class="layui-input-inline">
												<label class="edlabel"><span class="red">*</span>&nbsp&nbsp&nbsp繁體中文</label>
												<div class="eddiv">
													<script id="content" type="text/plain"
														style="width: 1024px; height: 500px;"></script>

												</div>

											</div>


										</div>


									</div>


									<div class="layui-form-item">
										<div class="layui-inline">
											<label class="layui-form-label layui-label-width"></label>
											<div class="layui-input-inline">
												<label class="edlabel">英文</label>
												<div class="eddiv">
													<script id="contenten" type="text/plain"
														style="width: 1024px; height: 500px;"></script>

												</div>

											</div>


										</div>


									</div>

									<div class="layui-form-item">
										<div class="layui-inline">
											<label class="layui-form-label layui-label-width">消息推送:</label>
											<div class="layui-input-inline">
												<%-- <label class="layui-form-label layui-label-width" >${UserContact.title}</label>  --%>
												<%-- <input type="tel" name="phone" autocomplete="off"
													class="layui-input" value="${UserContact.title}"> --%>


												<div class="layui-input-inline">
													<input type="checkbox" id="ispush"
														name="propertycoin" lay-skin="primary" title="推送"
														lay-filter="test">

												</div>

											</div>
										</div>
									</div>
									<div class="layui-form-item">
										<div class="layui-inline">
											<label class="layui-form-label layui-label-width">推送時間:</label>
											<div class="layui-input-inlinetime">
												<%-- <label class="layui-form-label layui-label-width" >${UserContact.title}</label>  --%>
												<%-- <input type="tel" name="phone" autocomplete="off"
													class="layui-input" value="${UserContact.title}"> --%>


												<!--   <input type="checkbox" id="propertycoin" name="propertycoin" lay-skin="primary" title=""  lay-filter="test"> -->
												<input name="pushtime" title="" type="radio"  id="xzpushtime"
													value="">

												<div class="layui-input-inlinetime layui-inline-widthtime">
													<input type="text" name="beginpublishTime"
														id="beginpublishTime" placeholder="推送時間"
														autocomplete="off" class="layui-input">
												</div>

											</div>
										</div>
									</div>
									<div class="layui-form-item">
										<div class="layui-inline">
											<label class="layui-form-label layui-label-width"></label>
											<div class="layui-input-inline">
												<%-- <label class="layui-form-label layui-label-width" >${UserContact.title}</label>  --%>
												<%-- <input type="tel" name="phone" autocomplete="off"
													class="layui-input" value="${UserContact.title}"> --%>

												<div class="layui-input-inline">
													<input name="pushtime" title="即刻推送" type="radio" id="jkpushtime"
														value="即刻推送">

													<!--   <input type="checkbox" name="sex1" lay-skin="primary"  value="女" title="即刻推送" > -->
												</div>
												
												
												<div  style="display: none;" >
													<input type="text" name="newTime"
														id="newTime" placeholder="推送時間"
														autocomplete="off" class="layui-input">
												</div>

											</div>
										</div>
									</div>


									<div class="layui-form-item">

										<div class="layui-inline">
											<label class="layui-form-label layui-label-width">推送平台</label>
											<div class="layui-input-inline">
												<select name="pushplatform" id="pushplatform">
													<option value="0">全部</option>
													<option value="1">安卓</option>
													<option value="2">ios</option>

												</select>
											</div>
										</div>
									</div>

								</form>
								<fieldset class="layui-elem-field layui-field-title"
									style="margin-top: 20px;">
									<legend></legend>
								</fieldset>
								<div class="layui-inline" align="center" style="margin: 0 auto;">
									<div class="layui-btn-container">
										<input type="button" class="layui-btn" value="保存"
											onclick="saveBtn()">
										<input type="button" class="layui-btn layui-btn-normal"
											value="取消"
											onclick="account()"> 
									</div>
								</div>

							</div>
						</div>
					</div>


				</div>

			</div>


		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />
	-
</body>




</body>

<script type="text/javascript"
	src="/static-res/js/jquery/jquery-3.4.0.min.js"></script>

<script type="text/javascript" charset="utf-8"
	src="/static-res/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="/static-res/ueditor/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="utf-8"
	src="/static-res/ueditor/lang/zh-cn/zh-cn.js"></script>
<script src="/static-res/js/infomationManage/addInfomation.js"></script>


<script>
	

 	/*  $(function() { */
 		  
 		 
 		//实例化编辑器
 	    /* var ue = UE.getEditor('editor'); */

 	//根据不同action上传图片和附件
 	/* UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;
 	    UE.Editor.prototype.getActionUrl = function(action) {
 	        if (action == 'uploadimage') {
 	            return '${pageContext.request.contextPath}/upload/uploadimage';
 	        } else if (action == 'uploadfile') {
 	            return '${pageContext.request.contextPath}/upload/uploadfile';
 	        } else {
 	            return this._bkGetActionUrl.call(this, action);
 	        }
 	    } */
	/*  });  */
	 
</script>
</html>