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
    <title>House730</title>
    <link rel="stylesheet" href="/static/css/layui.css">
    <script type="text/javascript" src="/static-res/js/jquery/jquery-3.4.0.min.js"></script>
</head>
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
    .layui-input{
        width:270px!important;
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
</style>
<jsp:include page="../../include/header.jsp"/>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>代理公司管理</legend>
            </fieldset>
            <div class="layui-row">

                <div class="layui-col-xs6 layui-col-md12">
                    <div class="grid-demo grid-demo-bg2"
                         style="background-color:#52cdec;line-height:50px;padding:0 30px;font-size:18px;color:white;">
                        添加代理公司
                    </div>
                </div>
            </div>
            <form class="layui-form" action="">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-label-width">代理公司中文名稱:</label>
                        <div class="layui-input-inline">
                            <input type="text" name="companyname" id="companyname" lay-verify="required" autocomplete="off" placeholder="请输入公司中文名稱"
                                   class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-label-width">代理公司英文名稱:</label>
                        <div class="layui-input-inline">
                            <input type="text" name="companynameen" id="companynameen" lay-verify="required" autocomplete="off" placeholder="请输入公司英文名稱"
                                   class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-label-width">中文地址:</label>
                        <div class="layui-input-inline">
                            <input type="text" name="address" id="address" lay-verify="required" autocomplete="off" placeholder="请输入公司中文地址"
                                   class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-label-width">英文地址:</label>
                        <div class="layui-input-inline">
                            <input type="text" name="addressen" id="addressen" lay-verify="required" autocomplete="off" placeholder="请输入公司英文地址"
                                   class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-label-width">電話:</label>
                        <div class="layui-input-inline">
                            <input type="text" name="telephone" id="telephone" lay-verify="required" autocomplete="off" placeholder="请输入公司電話"
                                   class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-label-width">公司經紀牌照號碼:</label>
                        <div class="layui-input-inline">
                            <input type="text" name="companlicense" id="companlicense" lay-verify="required" autocomplete="off" placeholder="请输入公司經濟牌照號碼"
                                   class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-label-width">公司Logo:</label>
                        <div class="layui-input-inline">
                            <div class="layui-upload">
                                <button type="button" class="layui-btn" id="test1">上传图片</button>
                                <div class="layui-upload-list">
                                    <img class="layui-upload-img" id="demo1">
                                    <p id="demoText"></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-label-width">公司簡介中文:</label>
                        <div class="layui-input-inline">
                            <textarea placeholder="请输入内容(不超過300字)" id="introduce" class="layui-textarea" style="width: 500px;height: 200px"></textarea>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-label-width">公司簡介英文:</label>
                        <div class="layui-input-inline">
                            <textarea placeholder="请输入内容(不超過500字)" id="introduceen" class="layui-textarea" style="width: 500px;height: 200px"></textarea>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-label-width">公司網址:</label>
                        <div class="layui-input-inline">
                            <input type="text" name="web" id="web" lay-verify="required" autocomplete="off" placeholder="请输入公司網址"
                                   class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-label-width">權重分值:</label>
                        <div class="layui-input-inline">
                            <input type="text" name="identityscore" id="identityscore" lay-verify="required" autocomplete="off" placeholder="请输入公司權重分值"
                                   class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-label-width">分行上限數量:</label>

                        <div class="layui-input-inline" style="width: 270px">
                            <select name="quiz1" >
                                <option value="">请选择分行上限數量</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5" selected="">5</option>
                            </select>
                        </div>

                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block" style="width: 943px" align="center">
                        <button class="layui-btn">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<jsp:include page="../../include/footer.jsp"/>
</body>
<script src="/static-res/js/company/companyManage/getPage.js"></script>
</html>
