<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Expires" content="0">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-control" content="no-cache">
    <meta http-equiv="Cache" content="no-cache">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>代理公司管理/代理公司列表</title>
    <link rel="stylesheet" href="/static/css/layui.css">

    <style type="text/css">
        td{
            height: 67px;
        }
        .layui-body{
            background-color:  	#f3f3f4;
        }
        .score{
            width: 490px;
            height: 330px;
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
<jsp:include page="../../include/header.jsp"/>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>代理公司管理/代理公司</legend>
            </fieldset>
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <!-- <div class="layui-card-header">卡片面板</div> -->
                        <div class="layui-card-body">
                            <form class="layui-form" action="">

                                <div class="layui-form-item">
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
                                    <div class="layui-inline"  >
                                        <div class="layui-input-inline">
                                        <select id="area" name="modules"  lay-search="" lay-filter="area" >
                                            <option value="">請選擇/輸入區域</option>
                                            <c:if test="${regionname != null}">
                                                <c:forEach var="region" items="${regionname}">
                                                    <option value="${region}" >${region}</option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </div>
                                    </div>
                                    <div class="layui-inline" >
                                        <div class="layui-input-inline">
                                        <select id="gscope" name="modules"   lay-search=""   >
                                            <option value="">請選擇/輸入地區</option>
                                        </select>
                                    </div>
                                    </div>
                                    <div class="layui-inline">
                                        <div class="layui-input-inline">
                                            <select name="status" id="status">
                                                <option value="">請選擇公司狀態</option>
                                                <option value="Normal">正常</option>
                                                <option value="Disable">停用</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="layui-inline">
                                        <div class="layui-input-inline " >
                                            <input type="text" name="startTime" id="startTime"   placeholder="創建-起始日期" autocomplete="off" class="layui-input">
                                        </div>
                                        <label class="layui-form-label"
                                               style="width:10px;padding:10px 4px 10px 0;text-align: left;">-</label>
                                        <div class="layui-input-inline " >
                                            <input type="text" name="endTime" id="endTime"  placeholder="創建-結束日期" autocomplete="off" class="layui-input">
                                        </div>
                                    </div>
                                    <div class="layui-inline">
                                        <div class="layui-input-inline " >
                                            <input type="text" name="startTime" id="updatestartTime"  placeholder="修改-起始日期" autocomplete="off" class="layui-input">
                                        </div>
                                        <label class="layui-form-label"
                                               style="width:10px;padding:10px 4px 10px 0;text-align: left;">-</label>
                                        <div class="layui-input-inline " >
                                            <input type="text" name="endTime" id="updateendTime"  placeholder="修改-結束日期" autocomplete="off" class="layui-input">
                                        </div>
                                        <label class="layui-form-label"
                                               style="width:10px;padding:10px 4px 10px 0;text-align: left;"></label>
                                        <input type="button" value="查找" class="layui-btn" id="searchBtn"></input>
                                        <input type="button" value="添加代理公司" class="layui-btn" id="addBtn"></input>
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
                    <script type="text/html" id="barDemo">
                        <a class="layui-btn layui-btn-xs"  id="manageclick" lay-event="edit" style="width:50px;" >管理</a>
                        <a class="layui-btn layui-btn-xs"  id="deleteclick" lay-event="query" style="width:50px;">查看</a>
                        <a class="layui-btn layui-btn-xs" style="width:50px;"   lay-event="recharge">儲值</a>
                    </script>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="money" class="score">
    <div style="height: 75px;line-height: 75px;text-align: center;font-size: 20px;">金幣儲值</div>
    <div align="center" >
        <div style="padding:0 15px;">
            <!-- <fieldset class="layui-elem-field layui-field-title" style="text-align: center;">
                  <legend>權重分值管理</legend>
                </fieldset> -->
            <form class="layui-form" id="moneyform" action="">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label1" >儲值賬號：</label>
                        <div class="layui-input-inline">
                            <label class="layui-form-label" style="text-align: left; width: 180px" id="namelabel"></label>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label1" >事項：</label>
                        <div class="layui-input-inline ">
                            <select name="moneytype" id="moneytype">
                            </select>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label1" >儲值金幣數量：</label>
                        <div class="layui-input-inline">
                            <input id="propertycoinnumber" placeholder="請輸入金幣數量"   autocomplete="off"  class="layui-input"  onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9]+/,'');if(this.value.substring(0,1)=='0'){this.value=0}}).call(this)" onblur="this.v();">
                        </div>
                    </div>
                </div>

            </form>
        </div>
    </div>
</div>
<div id="btnsuccess" >

    <div class="layui-form-item">
        <div class="layui-inline">
            <div class="layui-input-inline">
                <input type="button" class="layui-btn"  id="emailddlabel" value="查看储值记录"></input>
            </div>
            <div class="layui-input-inline">
                <input type="button" class="layui-btn"  id="emaifffllabel" value="继续储值"></input>
            </div>

        </div>
    </div>

</div>
<jsp:include page="../../include/footer.jsp"/>
</body>
<script src="/static-res/js/company/companyManage/companyManage.js?v=<%=System.currentTimeMillis() %>"></script>
</body>
<script>

</script>
</html>
