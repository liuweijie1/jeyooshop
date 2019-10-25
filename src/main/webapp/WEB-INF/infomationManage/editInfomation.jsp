
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
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
<title>資訊管理/編輯新聞資訊</title>
<link rel="stylesheet" href="/static-res/viewer/css/viewer.min.css">
<link rel="stylesheet" href="/static/css/layui.css">
 
<script type="text/javascript"
	src="/static-res/js/jquery/jquery-3.4.0.min.js"></script>
<style type="text/css">
.layui-body {
	background-color: #f3f3f4;
}

#layui-input-width {
	width: 250px;
}

.layui-label-width {
	width: 120px !important;
	text-align: left !important;
	margin-left: 50px;
}
.layui-label-widthts {
	width: 170px !important;
	text-align: left !important;
	margin-left: 50px;
}
.layui-label-widthzxfl {
	width: 120px !important;
	text-align: left !important;
	margin-left: 25px;
}
.layui-input-inlinezxfl {
    float: left;
    width: 260px;
     margin-right: -66px; 
     margin-left: 64px; 
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

/* ol,ul{
	 width:270px !important;
} */

.layui-inlinesub{
display: inline-block;
vertical-align: middle;
/* position: relative; */
margin-bottom: 5px;
margin-left: -226px;
}

.layui-input-inline {
	width: 546px !important;
}
.layui-input-inlineplat {
    float: left;
    width: 225px;
     margin-right: 10px; 
     margin-left: 1px; 
    }
.layui-input-inlinetext{
    float: left;
    width: 225px;
     margin-right: 10px; 
     margin-left: 1px; 
    }
</style>

</head>

<jsp:include page="../include/header.jsp" />
 <div id="editcontenten" style="display: none;">${InfomationResult.contenten}</div> 
<div id="editcontent"  style="display: none;">${InfomationResult.content}</div>  

<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-body">
			<!-- 内容主体区域 -->
			<div style="padding: 15px;">
				<fieldset class="layui-elem-field layui-field-title"
					style="margin-top: 20px;">
					<legend>資訊管理/編輯新聞資訊</legend>
				</fieldset>

				
				<div class="layui-row layui-col-space15">
					<div class="layui-col-md12">
						<div class="layui-card">
							<!-- <div class="layui-card-header">卡片面板</div> -->
							<div class="layui-card-body">
								<form class="layui-form" action="">
                                     <input type="hidden" id="informationid" value="${InfomationResult.informationid}"/>
									<div class="layui-form-item">


										<div class="layui-inline">
											<label class="layui-form-label layui-label-widthzxfl"><span
												class="red">*&nbsp&nbsp&nbsp&nbsp</span>資訊分類：</label>
											<div class="layui-input-inlinezxfl">
											 <input type="hidden" id="categoryid" value="${InfomationResult.categoryid}"/>
												<select name="categoryname" lay-filter="test" id="categoryname" onchange="getSubCategory()">
													<!-- <option value="">請選擇付款狀態</option>

													<option value="1">已付款</option>
													<option value="0">未付款</option> -->

												</select>
											</div>
										</div>
										
										<div class="layui-inlinesub">
											<label class="layui-form-label layui-label-width"></label>
											<div class="layui-input-inlinezxfl">
											 <input type="hidden" id="subcategoryid" value="${InfomationResult.subcategoryid}"/>
												<select name="subcategoryname" id="subcategoryname"/>
													<!-- <option value="">請選擇付款方式</option>
													<option value="0">信用卡付款</option>
													<option value="1">銀行轉賬</option> -->

												</select>
											</div>
										</div>
									</div>

									<div class="layui-form-item">

										
									</div>

									<div class="layui-form-item">
										<div class="layui-inlineinfotitle">
											<label class="layui-form-labelinfo layui-label-width">資訊標題：</label>
											<span class="red">*&nbsp&nbsp&nbsp</span>
											<div class="layui-input-inline">
												<%-- <label class="layui-form-label layui-label-width" >${UserContact.phone}</label>  --%>

												<input type="tel" name="title" id="title"autocomplete="off"
													class="layui-input" value="${InfomationResult.title}" maxlength="30"/>
											</div>
											<div class="layui-input-inlinetext">
												<label class="layui-form-label layui-label-widthts "
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
												 onkeyup="value=value.replace(/[^a-zA-Z0-9\s]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^a-zA-Z]/g,''))"
													class="layui-input" value="${InfomationResult.titleen}" maxlength="50"/>
											</div>

											<div class="layui-input-inlinetext">
												<label class="layui-form-label layui-label-width "
													style="color: #999 !important;">(英文)&nbsp&nbsp&nbsp(50個字內)</label>
											</div>
										</div>
									</div>
									<div class="layui-form-item">
										<div class="layui-inline">
											<label class="layui-form-label layui-label-width">封面圖：</label>
											<div class="layui-input-inline">
												<div class="layui-upload">
													<button type="button" class="layui-btn" id="test1">上传图片</button>
													<div class="layui-upload-list" style="width:120px;height:90px;border:dashed 1px #bfbaba;position: relative;">
														<img class="layui-upload-img " src="${InfomationResult.imagepath }?x-oss-process=style/150xauto_f"  style="max-width: 100%;max-height: 100%;position: absolute;top: 50%;left: 50%;transform: translate(-50%,-50%);" id="demo1"/>
														<input type="hidden" value="${InfomationResult.imagepath}" id="imagepath"/>
														
													</div>
													<p id="demoText"></p>
												</div>
											</div>
										</div>
									</div>
									<div class="layui-form-item">
										<div class="layui-inline">
											<label class="layui-form-label layui-label-width">資訊正文：</label>
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
												<label class="edlabel">&nbsp&nbsp&nbsp英文</label>
												<div class="eddiv">
													<script id="contenten" type="text/plain"
														style="width: 1024px; height: 500px;"></script>

												</div>
                                             
											</div>


										</div>


									</div>

									<div class="layui-form-item">
										<div class="layui-inline">
											<label class="layui-form-label layui-label-width">消息推送：</label>
											<div class="layui-input-inline">
												<%-- <label class="layui-form-label layui-label-width" >${UserContact.title}</label>  --%>
												<%-- <input type="tel" name="phone" autocomplete="off"
													class="layui-input" value="${UserContact.title}"> --%>


												<div class="layui-input-inline">
													<!-- <input type="checkbox" id="ispush"
														name="propertycoin" lay-skin="primary" title="推送"
														lay-filter="test"> -->

                                                 <c:if test="${InfomationResult.ispush eq true}">
													<input type="checkbox" lay-filter="ispush" id="ispush"name="propertycoin" lay-skin="primary" title="推送"  checked/>
                                                </c:if>
                                                <c:if test="${InfomationResult.ispush eq false}">
													<input type="checkbox" lay-filter="ispush" id="ispush"name="propertycoin" lay-skin="primary" title="推送"  />
                                                </c:if>
												</div>

											</div>
										</div>
									</div>
								<div id="pushparm" style="display: none;">
								
								
								
								
								<div class="layui-form-item">
										<div class="layui-inlineinfotitle">
											<label class="layui-form-labelinfo layui-label-width">推送內容：</label>
											<span class="red">*&nbsp&nbsp&nbsp</span>
											<div class="layui-input-inline">
												<%-- <label class="layui-form-label layui-label-width" >${UserContact.phone}</label>  --%>

												<input type="tel" name="title" id="pushcontent"autocomplete="off"
													class="layui-input" value="${InfomationResult.pushcontent}" maxlength="30"/>
											</div>
											<div class="layui-input-inlinetext">
												<label class="layui-form-label layui-label-widthts "
													style="color: #999 !important;">(繁體中文)&nbsp&nbsp&nbsp(30個字內)</label>
											</div>
										</div>
									</div>
									<div class="layui-form-item">
										<div class="layui-inline">
											<label class="layui-form-label layui-label-width"></label>
											<div class="layui-input-inline">
												<%-- <label class="layui-form-label layui-label-width" >${UserContact.phone}</label>  --%>
												<input type="tel" name="titleen" id="pushcontenten" autocomplete="off"
												 onkeyup="value=value.replace(/[^a-zA-Z0-9\s]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^a-zA-Z]/g,''))"
													class="layui-input" value="${InfomationResult.pushcontenten}" maxlength="50"/>
											</div>

											<div class="layui-input-inlinetext">
												<label class="layui-form-label layui-label-width "
													style="color: #999 !important;">(英文)&nbsp&nbsp&nbsp(50個字內)</label>
											</div>
										</div>
									</div>
								
								
								
								
								
								
								
								
								
								
								
								
								
									<div class="layui-form-item">
										<div class="layui-inline">
											<label class="layui-form-label layui-label-width">推送時間：</label>
											<div class="layui-input-inlinetime">
												<input name="pushtime" title="" type="radio"  id="xzpushtime"
													value=""checked/>

												<div class="layui-input-inlinetime layui-inline-widthtime">
													<input type="text" name="beginpublishTime" value="<fmt:formatDate value="${InfomationResult.pushtime}" pattern="yyyy-MM-dd HH:mm" />"
														id="beginpublishTime" placeholder="推送時間"
														autocomplete="off" class="layui-input"/>
												</div> 
												
												
											</div>
										</div>
									</div>
									<div class="layui-form-item" id="pushtimebox" >
										<div class="layui-inline">
											<label class="layui-form-label layui-label-width"></label>
											<div class="layui-input-inline">
												<%-- <label class="layui-form-label layui-label-width" >${UserContact.title}</label>  --%>
												<%-- <input type="tel" name="phone" autocomplete="off"
													class="layui-input" value="${UserContact.title}"> --%>

												<div class="layui-input-inline">
													<input name="pushtime" title="即刻推送" type="radio" id="jkpushtime"
														value="即刻推送"/>

													<!--   <input type="checkbox" name="sex1" lay-skin="primary"  value="女" title="即刻推送" > -->
												</div>
												
												
												<div   >
													<input type="text" name="newTime" style="display: none;"
														id="newTime" placeholder="推送時間"
														autocomplete="off" class="layui-input"/>
												</div>

											</div>
										</div>
									</div>

									<div class="layui-form-item">

										<div class="layui-inline">
											<label class="layui-form-label layui-label-width">推送平台：</label>
											<div class="layui-input-inlineplat">
												<select name="pushplatform" id="pushplatform">
													
													<option value="ALL" <c:if test="${InfomationResult.pushplatform eq  'ALL'  }">selected</c:if> >全部</option>
													<option value="ANDROID" <c:if test="${InfomationResult.pushplatform eq  'ANDROID'  }">selected</c:if>>安卓</option>
													<option value="IOS" <c:if test="${InfomationResult.pushplatform eq 'IOS' }">selected</c:if>>ios</option>

												</select>

											
											</div>
										</div>
									</div>
                              </div>
								</form>
								<fieldset class="layui-elem-field layui-field-title"
									style="margin-top: 20px;">
									<legend></legend>
								</fieldset>
								<div class="layui-inline"  style="margin: 0 580px;line-height: 48px;white-space:nowrap;">
									<div class="layui-btn-container" style="line-height: 48px;white-space:nowrap;">
										<input type="button" class="layui-btn" value="保存"
											onclick="editBtn()"/>
										<input type="button" class="layui-btn layui-btn-normal"
											value="取消"
											onclick="account()"/> 
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





<script type="text/javascript" charset="utf-8"
	src="/static-res/ueditor/ueditor.config.js"></script>
<!-- <script type="text/javascript" charset="utf-8" src="/static-res/ueditor/ueditor.all.min.js"> </script> -->
<script type="text/javascript" charset="utf-8" src="/static-res/ueditor/ueditor.all.js"> </script>
<script type="text/javascript" charset="utf-8"
	src="/static-res/ueditor/lang/zh-cn/zh-cn.js"></script>
<script src="/static-res/js/infomationManage/editInfomation.js?v=<%=System.currentTimeMillis() %>"></script>
<script src="/static-res/js/infomationManage/ftchange.js?v=<%=System.currentTimeMillis() %>"></script>

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