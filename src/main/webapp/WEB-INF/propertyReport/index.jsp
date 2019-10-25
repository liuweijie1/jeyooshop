<%--
  Created by IntelliJ IDEA.
  User: wbliuwj
  Date: 2019/4/23
  Time: 11:38
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
    <title>房源檢舉管理/房源檢舉列表</title>
    <link rel="stylesheet" href="/static/css/layui.css">
    <style type="text/css">
        .layui-body{
            background-color:  	#f3f3f4;
        }
        #layui-input-width{
            width:250px;
        }
        .layui-label-width{
            width:130px !important;
        }
        .layui-label1-width{

            width:120px !important;
        }
        .layui-label-ck{
            width:0 !important;
        }
        .layui-inline-width{
            width:120px !important;
        }
        .layui-input-inline{
            width:170px !important;

        }
        .innerDemo{
            width:90px !important;
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
                <legend>房源檢舉管理/房源檢舉列表</legend>
            </fieldset>

           
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <!-- <div class="layui-card-header">卡片面板</div> -->
                        <div class="layui-card-body">
                        
                        
                            <form class="layui-form" action="" id="formDemo">

                                <div class="layui-form-item">
                                    <div class="layui-inline">
                                      <!--   <label class="layui-form-label layui-label-width" >請輸入房源編號:</label> -->
                                        <div class="layui-input-inline">
                                            <input type="tel" name="propertyID" id="propertyID" placeholder="請輸入樓盤編號"  autocomplete="off" class="layui-input">
                                        </div>
                                    </div>

                                 
                                    <div class="layui-inline">
                                        <!-- <label class="layui-form-label layui-label1-width" >檢舉時間</label> -->
                                        <div class="layui-input-inline">
                                            <input type="text" name="startTime" id="startTime" lay-verify="date" placeholder="檢舉-起始時間" autocomplete="off" class="layui-input">
                                        </div>
                                        <label class="layui-form-label" style="width:10px;padding:10px 0 10px 0;text-align: left;">-</label>
                                        <div class="layui-input-inline">
                                            <input type="text" name="endTime" id="endTime" lay-verify="date" placeholder="檢舉-結束時間" autocomplete="off" class="layui-input">
                                        </div>
                                        <input type="button" value="查找" class="layui-btn" id="searchBtn"></input>
                                    </div>
                                  
                                </div>
                                
                                
                                
                            </form>
                            <%--<div class="layui-inline innerDemo">--%>
                                        <%--<div class="layui-input-inline ">--%>
                                            <%--<button class="layui-btn innerDemo" id="searchBtn" lay-submit="" lay-filter="demo">查找</button>--%>
                                          <%--</div>--%>
                                    <%--</div>--%>
                                    <%--<div class="layui-inline ">--%>
                                        <%--<div class="layui-input-inline">--%>
                                            <%--<button class="layui-btn innerDemo" style="display: none;" id="daochu" lay-submit="" lay-filter="demo1">導出</button>--%>
                                            <%--<iframe id="ifile" style="display:none"></iframe>--%>
                                            <%--</div>--%>
                                    <%--</div>--%>
                            
                                    
                        </div>
                    </div>
                </div>


            </div>

            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <table class="layui-hide" id="demo1" lay-filter="test"></table>

                    <table class="layui-table" id="propertyreport"  lay-size="lg">
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../include/footer.jsp"/>
</body>
<!-- <script src="/static/layui.js"></script> -->
<script src="/static-res/js/propertyReport/getPage.js?v=<%=System.currentTimeMillis() %>"></script>
</body>
</html>
