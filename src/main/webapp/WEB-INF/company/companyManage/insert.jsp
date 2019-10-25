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
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Expires" content="0">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-control" content="no-cache">
    <meta http-equiv="Cache" content="no-cache">
    <title>代理公司管理/添加代理公司</title>
    <link rel="stylesheet" href="/static/css/layui.css" media="all">
    <script type="text/javascript" src="/static-res/bootstrap/jquery.min.js"></script>
    <link href="/static-res/bootstrap/bootstrap.css" rel="stylesheet" />

    <script src="/static-res/bootstrap/bootstrapValidator.min.js"></script>
    <script src="/static-res/bootstrap/bootstrap.js"></script>
    <link href="/static-res/bootstrap/bootstrapValidator.min.css" rel="stylesheet" />
</head>
<style type="text/css">
    .layui-body {
        background-color: #f3f3f4;
    }

    #layui-input-width {
        width: 250px;
    }
    .bor{
        border:1px dashed #9F9F9F;
        width:152px;height:102px;
        margin-top:10px
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
    input::-webkit-input-placeholder {
        text-align: center;
    }
</style>
<jsp:include page="../../include/header.jsp"/>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin container">
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>代理公司管理/添加代理公司</legend>
            </fieldset>
            <form class="layui-form" id="mf" action="">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-label-width"><span style="color: red">*</span>公司中文名稱:</label>
                        <div class="layui-input-inline">
                            <div class="form-group">
                            <input type="text" name="companyname" id="companyname" lay-verify="recompanyname"
                                   autocomplete="off" placeholder="请輸入公司中文名稱"
                                   class=" form-control layui-input" maxlength="50"/>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-label-width"><span style="color: red">*</span>公司英文名稱:</label>
                        <div class="layui-input-inline">
                            <div class="form-group">
                            <input type="text" name="companynameen" id="companynameen" lay-verify="recompanynameen"
                                   autocomplete="off" placeholder="请輸入公司英文名稱"
                                   class="form-control layui-input" maxlength="50">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-label-width"><span style="color: red">*</span>所屬區域:</label>
                        <div class="layui-input-inline">
                            <div style="width: 270px"  >
                                <div class="form-group">
                                <select id="area" name="area" class="selectpicker form-control"   lay-search="" lay-filter="area" >
                                    <option value="">請選擇/輸入區域</option>
                                    <c:if test="${regionname != null}">
                                        <c:forEach var="region" items="${regionname}">
                                            <option value="${region}" >${region}</option>
                                        </c:forEach>
                                    </c:if>
                                </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-label-width"><span style="color: red">*</span>所屬地區:</label>
                        <div class="layui-input-inline">
                            <div   style="width: 270px">
                                <div class="form-group">
                                <select id="gscope" name="gscope"  class="selectpicker form-control"  lay-search=""   >
                                    <option value="">請選擇/輸入地區</option>
                                </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-label-width"><span style="color: red">*</span>中文地址:</label>
                        <div class="layui-input-inline">
                            <div class="form-group">
                            <input type="text" name="address" id="address" lay-verify="readdress" autocomplete="off"
                                   placeholder="请輸入公司中文地址"
                                   class="form-control layui-input" maxlength="100">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-label-width"><span style="color: red">*</span>英文地址:</label>
                        <div class="layui-input-inline">
                            <div class="form-group">
                            <input type="text" name="addressen" id="addressen" lay-verify="readdressen" autocomplete="off"
                                   placeholder="请輸入公司英文地址"
                                   class="form-control layui-input" maxlength="300">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-label-width"><span style="color: red">*</span>公司電話:</label>
                        <div class="layui-input-inline">
                            <div class="form-group">
                            <input type="text" name="telephone" id="telephone" lay-verify="number" autocomplete="off"
                                   placeholder="请輸入公司電話"
                                   class="form-control layui-input"
                                   onkeyup="this.value=this.value.replace(/[^(\-?)\d+]/ig,'');if(this.value.substring(0,1)=='0'||this.value.substring(0,1)=='1'){this.value=''}"  onafterpaste="this.value=this.value.replace(/[^(\-?)\d+]/ig,'')" maxlength="20" >
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-label-width"><span
                                style="color: red">*</span>公司地產代理牌照:</label>
                        <div class="layui-input-inline">
                            <div class="form-group">
                            <input type="text" name="companylicense" id="companylicense" lay-verify="recompanylicense"
                                   autocomplete="off" placeholder="请輸入公司經濟牌照號碼"
                                   class="form-control layui-input"
                                     maxlength="20" >
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-label-width"><span
                                style="color: red">*</span>公司標誌:</label>
                        <div class="layui-input-inline">
                            <form name="form1" id="form1">
                                <div class="parent">
                                    <input type="file" class="file" name="file" id="file" >
                                        <div class="bor"><div align="center" style="position: relative;"><img id="photourlShow"  style="max-width: 150px ;max-height: 100px;position: relative;"/></div></div>
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

                            <textarea placeholder="请輸入内容(不多餘300字)" id="introduce" name="checknum"
                                      class="layui-textarea" style="width: 500px;height: 200px" onkeydown="checknum300(this)"
                                      onkeyup="checknum300(this)"></textarea>

                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-label-width">公司簡介英文:</label>
                        <div class="layui-input-inline">

                            <textarea placeholder="请輸入内容(不多餘500字)" id="introduceen" name="checknumen"
                                      class="layui-textarea" style="width: 500px;height: 200px" onkeydown="checknum500(this)"
                                      onkeyup="checknum500(this)"></textarea>

                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-label-width">主要專營地區中文:</label>
                        <div class="layui-input-inline">

                            <textarea placeholder="请輸入内容(不多餘300字)" id="monopolyarea" name="checknum"
                                      class="layui-textarea" style="width: 500px;height: 200px"
                                      onkeydown="checknum300(this)"
                                      onkeyup="checknum300(this)"></textarea>

                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-label-width">主要專營地區英文:</label>
                        <div class="layui-input-inline">

                            <textarea placeholder="请輸入内容(不多餘500字)" id="monopolyareaen" name="checknumen"
                                      class="layui-textarea" style="width: 500px;height: 200px"
                                      onkeydown="checknum500(this)"
                                      onkeyup="checknum500(this)"></textarea>

                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-label-width">公司網址:</label>
                        <div class="layui-input-inline">

                            <input type="text" name="web" id="web" lay-verify="required" autocomplete="off"
                                   placeholder="请輸入公司網址"
                                   class="layui-input">

                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-label-width">權重分值:</label>
                        <div class="layui-input-inline">

                            <input type="text" name="identityscore" id="identityscore" value="${company.identityscore}"
                                   lay-verify="required" autocomplete="off" placeholder="请輸入公司權重分值"
                                   onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9]+/,'');if(this.value>200){this.value=200};if(this.value.substring(0,1)=='0'){this.value=0}}).call(this)" onblur="this.v();"
                                   class="layui-input">

                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block" style="width: 943px" align="center">
                        <input type="button" class="layui-btn"  value="保存" id="insertSubmit">
                        <button type="reset" id="close" class="layui-btn layui-btn-primary">取消</button>
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
                companyname: {
                    validators: {
                        notEmpty: {
                            message: '中文名稱不能为空'
                        },
                        remote: { //ajax验证。server result:{"valid",true or false} （返回前台类型）
                            url: "/company/checkexist",
                            message: '中文名稱已存在,请重新輸入',
                            delay: 500, //ajax刷新的时间是0.5秒一次
                            type: 'POST',
                            //自定义提交数据，默认值提交当前input value
                        },
                    }
                },
                companynameen: {
                    validators: {
                        notEmpty: {
                            message: '英文名稱不能为空'
                        },
                        remote: { //ajax验证。server result:{"valid",true or false} （返回前台类型）
                            url: "/company/checkexist",
                            message: '英文名稱已存在,请重新輸入',
                            delay: 500, //ajax刷新的时间是0.5秒一次
                            type: 'POST',
                        },
                    }
                },
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

                                if (value === "") {
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

                                if (value === "") {
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
