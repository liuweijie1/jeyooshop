<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wbwuxd
  Date: 2019/5/14
  Time: 9:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Expires" content="0">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-control" content="no-cache">
    <meta http-equiv="Cache" content="no-cache">
    <title>代理公司管理/代理公司詳情</title>

    <script type="text/javascript" src="/static-res/js/jquery/jquery-3.4.0.min.js"></script>
    <link href="/static-res/bootstrap/bootstrap.css" rel="stylesheet" />

    <script src="/static-res/bootstrap/bootstrapValidator.min.js"></script>
    <script src="/static-res/bootstrap/bootstrap.js"></script>
    <link href="/static-res/bootstrap/bootstrapValidator.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="/static/css/layui.css">
    <style type="text/css">
        legend{
           !important;
        }
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

        .layui-label-width1 {
            width: 250px !important;
            text-align: left !important;
            background-color: #c4d4e5;
        }

        .layui-label1-width {

            width: 100px !important;
        }
        .bor{
            border:1px dashed #9F9F9F;
            width:152px;height:102px;
            margin-top:10px
        }
        .layui-label-ck {
            width: 0 !important;
        }

        .layui-inline-width {
            width: 120px !important;
        }

        .layui-input {
            width: 270px !important;
        }

        .checkOrder {
            width: 500px !important;
        }

        .checkOrder1 {
            width: 300px !important;
        }

        .layui-row1 {
            border-bottom: 1px solid #C0C0C0;
        }

        .carousel-ul li {
            float: left;
        }

        .carousel-ul {
            text-align: center;
        }

        select {
            width: 270px;
        }
        input::-webkit-input-placeholder {
            text-align: center;
        }
    </style>
</head>

<jsp:include page="../../include/header.jsp"/>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>代理公司管理/代理公司</legend>
            </fieldset>

            <form class="layui-form" id="mf" action="">
                <div class="layui-form-item">
                    <input type="text" id="companyid1" value="${company.companyid}" style="display: none">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-label-width">公司中文名稱:</label>
                        <div class="layui-input-inline">
                            <label class="layui-form-label layui-label-width"  id="companyname1" name="companyname">${company.companyname}</label>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-label-width">公司英文名稱:</label>
                        <div class="layui-input-inline">
                            <label class="layui-form-label layui-label-width"  id="companynameen1" name="companynameen">${company.companynameen}</label>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-label-width"><span style="color: red">*</span>所屬區域:</label>
                        <div class="layui-input-inline">
                            <div style="width: 270px"  class="form-group">
                                <select id="area" name="area" class="selectpicker form-control"   lay-search="" lay-filter="area" >
                                    <option value="">請選擇/輸入區域</option>
                                    <c:if test="${regionname != null}">
                                        <c:forEach var="region" items="${regionname}">
                                            <option value="${region}" <c:if test="${region eq area}">selected</c:if> >${region}</option>
                                        </c:forEach>
                                    </c:if>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-label-width"><span style="color: red">*</span>所屬地區:</label>
                        <div class="layui-input-inline">
                            <div   class="form-group" style="width: 270px">
                                <select id="gscope" name="gscope"  class=" selectpicker form-control"  lay-search="" lay-filter="gscopedetail"  >
                                    <option value="">請選擇/輸入地區</option>
                                    <c:if test="${gscopelist != null}">
                                        <c:forEach var="gscope" items="${gscopelist}">
                                            <option value="${gscope['GscopeCode']}" <c:if test="${gscope['GscopeCode'] eq company.gscopecode}">selected</c:if> >${gscope['GscopeName']}</option>
                                        </c:forEach>
                                    </c:if>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-label-width"><span style="color: red">*</span>中文地址:</label>
                        <div class="layui-input-inline">
                            <div class="form-group">
                            <input type="text" name="address" id="address1" value="${company.address}"
                                   lay-verify="required" autocomplete="off" placeholder="请輸入公司中文地址"
                                   class="form-control layui-input " maxlength="100">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-label-width"><span style="color: red">*</span>英文地址:</label>
                        <div class="layui-input-inline ">
                            <div class="form-group">
                            <input type="text" name="addressen" id="addressen1" value="${company.addressen}"
                                   lay-verify="required" autocomplete="off" placeholder="请輸入公司英文地址"
                                   class="form-control layui-input " maxlength="300">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-label-width"><span style="color: red">*</span>公司電話:</label>
                        <div class="layui-input-inline ">
                            <div class="form-group">
                            <input type="text" name="telephone" id="telephone1" value="${company.telephone}"
                                   lay-verify="required" autocomplete="off" placeholder="请輸入公司電話"
                                   class="form-control layui-input " onkeyup="this.value=this.value.replace(/\D/g,'');if(this.value.substring(0,1)=='0'||this.value.substring(0,1)=='1'){this.value=''}"  onafterpaste="this.value=this.value.replace(/\D/g,'')" maxlength="20" >
                        </div>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-label-width"><span style="color: red">*</span>公司地產代理牌照:</label>
                        <div class="layui-input-inline form-group">
                            <div class="form-group">
                            <input type="text" name="companylicense" id="companylicense1"
                                   value="${company.companylicense}" lay-verify="required" autocomplete="off"
                                   placeholder="请輸入公司經濟牌照號碼"
                                   class="form-control layui-input " maxlength="20">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-label-width"><span style="color: red">*</span>公司標誌:</label>
                        <div class="layui-input-inline">
                            <form name="form1" id="form1">
                                <div class="parent">
                                        <input type="file" class="file" name="file" id="file">
                                        <div class="bor"><div align="center"><img id="photourlShow" <c:if test="${company.logo!=null and company.logo!=''}">src="${company.logo}?x-oss-process=style/150xauto_f"</c:if>  style="max-width: 150px ;max-height: 100px"/></div> </div>
                                        <input type="hidden" id="hidden"/>
                                </div>
                            </form>

                        </div>
                        <label  style="width: 500px"><span style="color: #c2ccd1;font-family: 宋体;font-size: medium">圖片大小:600像素(闊)x400像素(高),支援格式:JPG,JPEG,PNG</span></label>
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-label-width">公司簡介中文:</label>
                        <div class="layui-input-inline">
                            <textarea placeholder="请輸入内容(不多餘300字)" id="introduce1" name="checknum"
                                      class="layui-textarea" style="width: 500px;height: 200px" onkeydown="checknum300(this)"
                                      onkeyup="checknum300(this)">${company.introduce}</textarea>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-label-width">公司簡介英文:</label>
                        <div class="layui-input-inline">
                            <textarea placeholder="请輸入内容(不多餘500字)" id="introduceen1" name="checknumen"
                                      class="layui-textarea" style="width: 500px;height: 200px"
                                      onkeydown="checknum500(this)"
                                      onkeyup="checknum500(this)">${company.introduceen}</textarea>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-label-width">主要專營地區中文:</label>
                        <div class="layui-input-inline">
                            <textarea placeholder="请輸入内容(不多餘300字)" id="monopolyarea1" name="checknum"
                                      class="layui-textarea" style="width: 500px;height: 200px"
                                      onkeydown="checknum300(this)"
                                      onkeyup="checknum300(this)">${company.monopolyarea}</textarea>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-label-width">主要專營地區英文:</label>
                        <div class="layui-input-inline">
                            <textarea placeholder="请輸入内容(不多餘500字)" id="monopolyareaen1" name="checknumen"
                                      class="layui-textarea" style="width: 500px;height: 200px"
                                      onkeydown="checknum500(this)"
                                      onkeyup="checknum500(this)">${company.monopolyareaen}</textarea>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-label-width">公司網址:</label>
                        <div class="layui-input-inline">
                            <input type="text" name="web" id="web1" value="${company.web}" lay-verify="required"
                                   autocomplete="off" placeholder="请輸入公司網址"
                                   class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-label-width">權重分值:</label>
                        <div class="layui-input-inline">
                            <input type="text" name="identityscore" id="identityscore1" value="${company.identityscore}"
                                   lay-verify="required" autocomplete="off" placeholder="请輸入公司權重分值"
                                   onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9]+/,'');if(this.value>200){this.value=200};if(this.value.substring(0,1)=='0'){this.value=0}}).call(this)" onblur="this.v();"
                                   class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-label-width">公司狀態:</label>

                        <div class="layui-input-inline">
                            <select name="status" id="status" value="${company.status}" style="width: 270px ;height: 38px">
                                <option value="Normal" <c:if test="${'Normal' eq company.status}">selected</c:if>>正常
                                </option>
                                <option value="Disable" <c:if test="${'Disable' eq company.status}">selected</c:if>>停用
                                </option>
                            </select>
                        </div>

                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <div class="layui-input-block" style="width: 943px" align="center">
                            <input type="button" class="layui-btn" value="保存" id="detSubmit">
                            <button type="button" id="reset" class="layui-btn layui-btn-primary">取消</button>
                        </div>
                    </div>
                </div>
            </form>

        </div>
    </div>
</div>
<jsp:include page="../../include/footer.jsp"/>
</body>
<script src="/static-res/js/company/companyManage/companyManage.js?v=<%=System.currentTimeMillis() %>"></script>
<script>

        $(function () {

        $('#mf').bootstrapValidator({
            // message: 'This value is not valid',
            /* feedbackIcons: {
                 valid: 'glyphicon glyphicon-ok',
                 invalid: 'glyphicon glyphicon-remove',
                 validating: 'glyphicon glyphicon-refresh'
             },*/
            excluded : [':disabled'],
            live: 'enabled', //验证时机，enabled是内容有变化就验证（默认），disabled和submitted是提交再验证
            fields: {
                address: {
                    validators: {
                        notEmpty: {
                            message: '中文地址不能为空'
                        }
                    }
                },
                addressen: {
                    validators: {
                        notEmpty: {
                            message: '英文地址不能为空'
                        }
                    }
                },
                telephone: {
                    validators: {
                        notEmpty: {
                            message: '電話不能为空'
                        }
                    }
                },
                companylicense: {
                    validators: {
                        notEmpty: {
                            message: '經濟牌照不能为空'
                        }
                    }
                },
                area: {
                    validators: {
                        callback: {
                            message: '區域未選擇',
                            //返回true/false
                            callback: function (value, validator) {

                                if (value == "") {
                                    return false;
                                } else {
                                    return true;

                                }

                            }

                        }
                    }

                },
                gscope: {
                    validators: {
                        callback: {
                            message: '地區未選擇',
                            //返回true/false
                            callback: function (value, validator) {

                                if (value == "") {
                                    return false;
                                } else {
                                    return true;

                                }

                            }

                        }
                    }

                },

            }
        });

    })
</script>
</html>
