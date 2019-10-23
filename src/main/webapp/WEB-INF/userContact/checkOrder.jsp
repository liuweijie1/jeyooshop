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

ul.imglist {
	margin: 0 auto;
	width: 536px;
	overflow: hidden
}

ul.imglist li {
	float: left;
	padding: 4px 8px;
	width: 160px
}

ul.imglist li img {
	display: block;
	width: 160px;
	height: 90px
}

.imgname {
	display: block;
	width: 100%;
	height: 30px;
	line-height: 30px;
	background: #F6F6F6; 
	word-break:keep-all;           /* 不换行 */
    white-space:nowrap;          /* 不换行 */
    overflow:hidden;               /* 内容超出宽度时隐藏超出部分的内容 */
    text-overflow:ellipsis;
}
.filename {
	display: block;
	font-weight:bold;
	width: 100%; 

	height: 30px;
	line-height: 30px;
	font-style:italic; 
	
	word-break:keep-all;           /* 不换行 */
    white-space:nowrap;          /* 不换行 */
    overflow:hidden;               /* 内容超出宽度时隐藏超出部分的内容 */
    text-overflow:ellipsis;         /* 当对象内文本溢出时显示省略标记(...) ；需与overflow:hidden;一起使用。*/
    
    
    verflow: hidden;

   

}
.viewer-container{
	margin-top:60px !important;
}
.viewer-button{
	top: -33px !important;
	right: -37px !important;
	width:100px;
	height:100px;
}
.viewer-button:before{
	bottom:26px !important;
	left:24px !important;
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
					<legend>聯絡我們管理</legend>
				</fieldset>

				<div class="layui-row">

					<div class="layui-col-xs6 layui-col-md12">
						<div class="grid-demo grid-demo-bg2"
							style="background-color: #52cdec; line-height: 50px; padding: 0 30px; font-size: 18px; color: white;">資料詳情</div>
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
											<label class="layui-form-label layui-label-width">聯絡人:</label>
											<div class="layui-input-inline">
												<label class="layui-form-label layui-label-width" >${empty UserContact.contactperson?'/':UserContact.contactperson}</label> 
												<%-- <input type="tel" name="phone" autocomplete="off"
													class="layui-input" value="${UserContact.contactperson}"> --%>
											</div>
										</div>
									</div>
									<div class="layui-form-item">
										<div class="layui-inline">
											<label class="layui-form-label layui-label-width">E-mail:</label>
											<div class="layui-input-inline">
											<label class="layui-form-label layui-label-width" >${empty UserContact.email?'/':UserContact.email}</label> 
												<%-- <input type="tel" name="phone" autocomplete="off"
													class="layui-input" value="${UserContact.email}"> --%>
											</div>
										</div>
									</div>
									<div class="layui-form-item">
										<div class="layui-inline">
											<label class="layui-form-label layui-label-width">聯絡電話:</label>
											<div class="layui-input-inline">
											<label class="layui-form-label layui-label-width" >${empty UserContact.phone?'/':UserContact.phone}</label> 
												<%-- <input type="tel" name="phone" autocomplete="off"
													class="layui-input" value="${UserContact.phone}"> --%>
											</div>
										</div>
									</div>
									<div class="layui-form-item">
										<div class="layui-inline">
											<label class="layui-form-label layui-label-width">選項:</label>
											<div class="layui-input-inline">
											<label class="layui-form-label layui-label-width" >${empty UserContact.dictionaryname?'/':UserContact.dictionaryname}</label> 
												<%-- <input type="tel" name="phone" autocomplete="off"
													class="layui-input" value="${UserContact.dictionaryname}"> --%>
											</div>
										</div>
									</div>
									<div class="layui-form-item">
										<div class="layui-inline">
											<label class="layui-form-label layui-label-width">標題:</label>
											<div class="layui-input-inline">
											<label class="layui-form-label layui-label-width" >${empty UserContact.title?'/':UserContact.title}</label> 
												<%-- <input type="tel" name="phone" autocomplete="off"
													class="layui-input" value="${UserContact.title}"> --%>
											</div>
										</div>
									</div>
									<div class="layui-form-item">
										<div class="layui-inline">
											<label class="layui-form-label layui-label-width">內容:</label>
											<div class="layui-input-inline">
											<label class="layui-form-label layui-label-width" >${empty UserContact.content?'/':UserContact.content}</label> 
												<%-- <input type="tel" name="phone" autocomplete="off"
													class="layui-input" value="${UserContact.content}"> --%>
											</div>
										</div>
									</div>
									<div class="layui-form-item">
										<div class="layui-inline">
											<label class="layui-form-label layui-label-width">附件:</label>
											<div class="layui-input-inline" >
                                               <c:if test="${filesMap.images==null}">  
                                            <label class="layui-form-label layui-label-width" >/</label>
                                               </c:if>  
                                            <label class="layui-form-label layui-label-width" >
												<ul class="imglist" id="imglist">
												<c:if test="${filesMap.images != null}">
												    <c:forEach var="it" items="${filesMap.images}" varStatus="stauts" >
													<li><a href="javascript:showTS()" > <img 
													        data-original="${it.filePath}"
															src="${it.filePath}" alt="${it.fileName}" title="${it.fileName}" />
															
															<span class="imgname">${it.fileName}</span>
													</a></li>
                                                  </c:forEach>
                                                  
                                                  </c:if>
                                                 

												</ul>
												
												<ul class="imglist" id="imglist">

                                                  <c:if test="${filesMap.other != null}">
												    <c:forEach var="it" items="${filesMap.other}" varStatus="stauts" >
													<li><a href="${it.filePath}"  >
															<span class="filename" title="${it.fileName}">${it.fileName}</span>
													</a></li>
                                                  </c:forEach>
                                                  </c:if>
                                                  

												</ul>

                                             </label> 

											</div>

										</div>
									</div>


								</form>


							</div>
						</div>
					</div>


				</div>

			</div>


		</div>
	</div>
 <jsp:include page="../include/footer.jsp" />  -
</body>




</body>

<script type="text/javascript" src="/static-res/js/jquery/jquery-3.4.0.min.js"></script> 
<script src="/static-res/viewer/js/viewer-jquery.min.js"></script> 
<script src="/static-res/js/userContact/getPage.js"></script> 
<script>
	
	
$(function() {
 	$('#imglist').viewer({
 		url: 'data-original',
 	});
 	
 	function showTS(){
 		 layer.msg('按“Esc”鍵退出預覽');
 		}
 	
 });


</script>
</html>