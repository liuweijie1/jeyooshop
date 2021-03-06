<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
    <title>代理公司管理/查看分行人員</title>
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

            width:70px !important;
        }
        .layui-label-ck{
            width:0 !important;
        }
        .layui-inline-width{
            width:160px !important;
        }
    </style>

    <script type="text/javascript" src="/static-res/js/jquery/jquery-3.4.0.min.js"></script>
</head>
<jsp:include page="../../include/header.jsp"/>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>代理公司管理/查看分行人員</legend>
            </fieldset>
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <!-- <div class="layui-card-header">卡片面板</div> -->
                        <div class="layui-card-body">
                            <input style="display: none" value="${departmentid}" id="getDepartmentid"></input>
                            <form class="layui-form" action="">

                                <div class="layui-form-item">
                                    <div class="layui-inline">
                                        <div class="layui-inline" style="width: 190px">
                                            <select  id="roleid">
                                                <option value="">請選擇人員分類</option>
                                                <option value="4">經紀人</option>
                                                <option value="3">放盤人</option>
                                                <option value="2">管理員</option>
                                            </select>
                                        </div>
                                        <input type="button" value="查找" class="layui-btn" id="searchBtn"></input>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <table class="layui-table" id="demo" lay-size="lg" lay-filter="test">
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../../include/footer.jsp"/>
</body>
<script src="/static-res/js/company/branch/agent.js?v=<%=System.currentTimeMillis() %>"></script>
</body>
</html>