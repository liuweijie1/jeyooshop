<%--
  Created by IntelliJ IDEA.
  User: wbwuxd
  Date: 2019/4/19
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
    <title>House730</title>
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

        .layui-inline-width {
            width: 120px !important;
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
                <legend>會員管理</legend>
            </fieldset>

            <div class="layui-row">

                <div class="layui-col-xs6 layui-col-md12">
                    <div class="grid-demo grid-demo-bg2"
                         style="background-color:#52cdec;line-height:50px;padding:0 30px;font-size:18px;">會員列表
                    </div>
                </div>
            </div>

            <div class=" layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <!-- <div class="layui-card-header">卡片面板</div> -->
                        <div class="layui-card-body">
                            <form class="layui-form" id="myform" action="">

                                <div class="layui-form-item">
                                    <div class="layui-inline">
                                        <div class="layui-input-inline">
                                            <input type="tel" id="userCode" name="userCode" placeholder="請輸入會員編號"
                                                   autocomplete="off" class="layui-input">
                                        </div>
                                    </div>

                                    <div class="layui-inline">
                                        <!-- <label class="layui-form-label">分组选择框</label> -->
                                        <div class="layui-input-inline">
                                            <select name="source" id="source">
                                                <option value="">請選擇註冊渠道</option>


                                                <option value="app">app</option>
                                                <option value="wap">wap</option>
                                                <option value="pc">官網</option>

                                            </select>
                                        </div>
                                    </div>
                                    <div class="layui-inline">
                                        <!-- <label class="layui-form-label">分组选择框</label> -->
                                        <div class="layui-input-inline">
                                            <select name="ispropertyagent" id="ispropertyagent">
                                                <option value="">請選擇會員類型</option>
                                                <option value="0">普通用戶</option>
                                                <option value="1">地產代理</option>

                                            </select>
                                        </div>
                                    </div>
                                    <div class="layui-inline">
                                        <!-- <label class="layui-form-label">分组选择框</label> -->
                                        <div class="layui-input-inline">
                                            <select name="registry" id="registry">
                                                <option value="">請選擇註冊方式</option>
                                                <option value="730">730</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="layui-inline">
                                        <!-- <label class="layui-form-label">分组选择框</label> -->
                                        <div class="layui-input-inline">
                                            <select name="approvalStatus" id="approvalStatus">
                                                <option value="">請選擇會員資料審核狀態</option>
                                                <option value="NotPassApproval">未通過</option>
                                                <option value="PassApproval">已通過</option>
                                                <option value="UnderApproval">未審核</option>
                                            </select>
                                        </div>
                                    </div>




                                    <div class="layui-inline">
                                        <!-- <label class="layui-form-label">分组选择框</label> -->
                                        <div class="layui-input-inline">
                                            <select name="status" id="status">
                                                <option value="">請選擇賬號狀態</option>
                                                <option value="Normal">正常</option>
                                                <option value="Disable">已封</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="layui-inline">
                                        <label class="layui-form-label">註冊時間</label>
                                        <div class="layui-input-inline">
                                            <input type="text" name="startTime" id="date" placeholder="開始時間"
                                                   autocomplete="off" class="layui-input">
                                        </div>
                                        <label class="layui-form-label"
                                               style="width:10px;padding:10px 0 10px 0;text-align: left;">-</label>
                                        <div class="layui-input-inline">
                                            <input type="text" name="endTime" id="date1" placeholder="結束時間"
                                                   autocomplete="off" class="layui-input">
                                        </div>
                                            <input type="button" value="查找" class="layui-btn" id="searchBtn"></input>
                                            <%--<button type="reset" id="daochu" class="layui-btn layui-btn-primary " style="display: none;" >導出</button>--%>
                                            <%--<iframe id="ifile" style="display:none"></iframe>--%>
                                    </div>
                                </div>
                            </form>
         <%--                   <div class="layui-inline " align="right">
                                <div class="layui-input-block">
                                    <button class="layui-btn" id="searchBtn">查找</button>
                                    <button type="reset" id="daochu" class="layui-btn layui-btn-primary " style="display: none;" >導出</button>
                                    <iframe id="ifile" style="display:none"></iframe>
                                </div>
                                </div>--%>


                                <%-- <div class="layui-form-item">
                                     <div class="layui-input-block">
                                         <button class="layui-btn" lay-submit="" lay-filter="demo1">查找</button>
                                         <button type="reset" class="layui-btn layui-btn-primary">導出</button>
                                     </div>
                                 </div>--%>


                            </div>
                        </div>
                    </div>


                </div>

            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <table class="layui-table" id="demo"  lay-size="lg" lay-filter="test">
                        <script type="text/html" id="barDemo">
                            <a class="layui-btn layui-btn-xs" lay-event="edit">管理</a>
                        </script>
                        <script type="text/html" id="barstatus">
                            <a class="layui-btn layui-btn-xs"  lay-event="del">查看</a>
                        </script>
                    </table>
                </div>
            </div>

        </div>
    </div>
</div>
<jsp:include page="../include/footer.jsp"/>
</body>
<%--<%
    Object admin = request.getSession().getAttribute("admin");
    if(admin==null){%>
<script type="text/javascript">
    window.location.href="login.jsp";
</script>
<% }
%>--%>
<script src="/static-res/js/userManage/getPage.js"></script>
<script type="text/javascript"></script>

</body>
</html>
