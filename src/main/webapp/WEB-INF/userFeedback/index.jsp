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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Expires" content="0">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-control" content="no-cache">
    <meta http-equiv="Cache" content="no-cache">
    <title>留言反饋管理/留言反饋列表</title>
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
                <legend>留言反饋管理/留言反饋列表</legend>
            </fieldset>

            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <!-- <div class="layui-card-header">卡片面板</div> -->
                        <div class="layui-card-body">
                            <form class="layui-form" id="myform" action="">

                                <div class="layui-form-item">
                                    <div class="layui-inline">
                                        <!-- <label class="layui-form-label">分组选择框</label> -->
                                        <div class="layui-input-inline">
                                            <select name="source" id="source">
                                                <option value="">請選擇留言反饋來源</option>
                                                <option value="Android">Android</option>
                                                <option value="IOS">IOS</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="layui-inline">
                                        <div class="layui-input-inline">
                                            <input type="text" name="startTime" id="date" placeholder="留言反饋-起始時間"
                                                   autocomplete="off" class="layui-input">
                                        </div>
                                        <label class="layui-form-label"
                                               style="width:10px;padding:10px 0 10px 0;text-align: left;">-</label>
                                        <div class="layui-input-inline">
                                            <input type="text" name="endTime" id="date1" placeholder="留言反饋-結束時間"
                                                   autocomplete="off" class="layui-input">
                                        </div>
                                        <input type="button" class="layui-btn" value="查找" id="search"></input>
                                    </div>




                                </div>

                            </form>
                            <%--<div class="layui-inline " align="right">--%>
                                <%--<div class="layui-input-block">--%>
                                    <%--<button class="layui-btn" id="searchBtn">查找</button>--%>
                                    <%--<button type="reset" id="daochu" class="layui-btn layui-btn-primary" style="display: none;">導出</button>--%>
                                    <%--<iframe id="ifile" style="display:none"></iframe>--%>
                                <%--</div>--%>
                            <%--</div>--%>

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
<script src="/static-res/js/userFeedback/userFeedback.js?v=<%=System.currentTimeMillis() %>"></script>

<script type="text/javascript"></script>

</body>
</html>
