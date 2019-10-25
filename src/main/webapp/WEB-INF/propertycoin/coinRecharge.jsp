<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wbwuxd
  Date: 2019/7/12
  Time: 16:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
    <title>賬戶金幣儲值/賬戶儲值記錄</title>
    <link rel="stylesheet" href="/static/css/layui.css">
    <style type="text/css">
        .layui-body {
            background-color: #f3f3f4;
        }

        #layui-input-width {
            width: 250px;
        }

        .layui-label-width {
            width: 160px !important;
        }

        .layui-label1-width {

            width: 100px !important;
        }
        .layui-label2-width {

            width: 60px !important;
        }

        .layui-label-ck {
            width: 0 !important;
        }
        .score{
            width: 480px;
            height: 330px;
        }
        .layui-inline-width {
            width: 120px !important;
        }
        .layui-label1-width1{

            width:70px !important;
        }
        .layui-form-label1{

            float: left;
            display: block;
            padding: 9px 2px;
            width: 120px;
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
                <legend>賬戶金幣儲值/賬戶儲值記錄</legend>
            </fieldset>


            <div class=" layui-row layui-col-space15">

                <div class="layui-card">
                    <!-- <div class="layui-card-header">卡片面板</div> -->

                    <form class="layui-form" id="myform" action="">

                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <input type="tel" id="email" name="email" placeholder="請輸入賬戶電郵"
                                           autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-inline" >
                                <div class="layui-input-inline">
                                    <select name="modules"  lay-search="" id="companyname" >
                                        <option value="">請選擇/輸入代理公司</option>
                                        <c:if test="${companyname != null}">
                                            <c:forEach var="iter" items="${companyname}">
                                                <option value="${iter.CompanyName}">${iter.CompanyName} / ${iter.CompanyNameEN}</option>
                                            </c:forEach>
                                        </c:if>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <!-- <label class="layui-form-label">分组选择框</label> -->
                                <div class="layui-input-inline">
                                    <select name="account" id="account">
                                        <option value="">請選擇賬戶類型</option>
                                        <option value="user">普通會員</option>
                                        <option value="pms">PMS</option>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <select name="item" id="item">
                                    </select>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <input type="text" name="startTime" id="date" placeholder="儲值時間-起始時間"
                                           autocomplete="off" class="layui-input">
                                </div>
                                <label class="layui-form-label"
                                       style="width:10px;padding:10px 0 10px 0;text-align: left;">-</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="endTime" id="date1" placeholder="儲值時間-結束時間"
                                           autocomplete="off" class="layui-input">
                                </div>
                                <div class="layui-input-inline " style="width: 30px;">
                                    <input type="button" value="查找" class="layui-btn" id="searchBtn"></input>
                                </div>
                            </div>
                           <%-- <div class="layui-inline">

                            </div>--%>
                        </div>
                    </form>
                    <table class="layui-table" id="demo"  lay-size="lg" lay-filter="test">

                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../include/footer.jsp"/>
</body>
<script src="/static-res/js/propertycoin/propertycoin.js?v=<%=System.currentTimeMillis() %>"></script>
<script type="text/javascript"></script>

</body>
</html>
