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
    <title>附加審核/驗證標籤樓盤</title>
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

            width:100px !important;
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
<jsp:include page="../../../include/header.jsp"/>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>附加審核/驗證標籤樓盤</legend>
            </fieldset>
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <!-- <div class="layui-card-header">卡片面板</div> -->
                        <div class="layui-card-body">
                            <form class="layui-form" action="">

                                <div class="layui-form-item">
                                    <div class="layui-inline">
                                        <div class="layui-input-inline">
                                            <input id="propertyid" placeholder="請輸入樓盤編號"  type="tel"  autocomplete="off" class="layui-input" value="">
                                        </div>
                                    </div>

                                    <div class="layui-inline">
                                        <!-- <label class="layui-form-label">分组选择框</label> -->
                                        <div class="layui-input-inline">
                                            <select name="propertytype" id="propertytype">
                                                <option value="">請選擇盤源類型</option>
                                                <option value="1">業主盤</option>
                                                <option value="2">代理盤</option>
                                                <option value="accountid">PMS</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="layui-inline">
                                        <!-- <label class="layui-form-label">分组选择框</label> -->
                                        <div class="layui-input-inline">
                                            <select name="isverifylabel" id="isverifylabel">
                                                <option value="">請選擇驗證標籤狀態</option>
                                                <option value="1">已通過</option>
                                                <option value="0">未審核</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="layui-inline">
                                        <div class="layui-input-inline layui-inline-width" >
                                            <input type="text" name="startTime" id="startTime"  placeholder="放盤-起始日期" autocomplete="off" class="layui-input">
                                        </div>
                                        <label class="layui-form-label" style="width:10px;padding:10px 0 10px 0;text-align: left;">-</label>
                                        <div class="layui-input-inline layui-inline-width" >
                                            <input type="text" name="endTime" id="endTime"  placeholder="放盤-結束日期" autocomplete="off" class="layui-input">
                                        </div>
                                        <input type="button" value="查找" class="layui-btn" id="searchBtn"></input>
                                    </div>
                                </div>
                            </form>
                            <%--<div class="layui-form-item">--%>
                                <%--<div class="layui-input-block">--%>
                                    <%--<button class="layui-btn"  id="searchBtn">查找</button>--%>
                                    <%--<button type="reset" class="layui-btn layui-btn-primary" style="display: none">導出</button>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        </div>
                    </div>
                </div>
            </div>
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <table class="layui-table" id="demo" lay-size="lg" lay-filter="test">
                    </table>
                    <script type="text/html" id="barDemo">
                        <a class="layui-btn layui-btn-xs"  id="manageclick" lay-event="edit" style="width:50px;">管理</a>
                    </script>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../../../include/footer.jsp"/>
</body>
<script src="/static-res/js/propertyManager/propertyAudit/checkLabel/checkLabel.js?v=<%=System.currentTimeMillis() %>"></script>
<script type="text/javascript"></script>
</body>
</html>