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
    <title>會員管理/會員列表</title>
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
                <legend>會員管理/會員列表</legend>
            </fieldset>


            <div class=" layui-row layui-col-space15">

                    <div class="layui-card">
                        <!-- <div class="layui-card-header">卡片面板</div> -->

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
                                                <option value="pc">web</option>

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
                                    <div class="layui-inline" style="display: none">
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
                                        <div class="layui-input-inline">
                                            <input type="text" name="startTime" id="date" placeholder="註冊-起始時間"
                                                   autocomplete="off" class="layui-input">
                                        </div>
                                        <label class="layui-form-label"
                                               style="width:10px;padding:10px 0 10px 0;text-align: left;">-</label>
                                        <div class="layui-input-inline">
                                            <input type="text" name="endTime" id="date1" placeholder="註冊-結束時間"
                                                   autocomplete="off" class="layui-input">
                                        </div>

                                            <%--<button type="reset" id="daochu" class="layui-btn layui-btn-primary " style="display: none;" >導出</button>--%>
                                            <%--<iframe id="ifile" style="display:none"></iframe>--%>
                                    </div>
                                    <div class="layui-inline">
                                        <!-- <label class="layui-form-label">分组选择框</label> -->
                                        <div class="layui-input-inline">
                                            <select name="status" id="status">
                                                <option value="">請選擇賬號狀態</option>
                                                <option value="Normal">正常</option>
                                                <option value="Disable">停用</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="layui-inline">
                                        <div class="layui-input-inline">
                                            <input type="tel" id="email" name="email" placeholder="請輸入賬戶郵箱"
                                                   autocomplete="off" class="layui-input">
                                        </div>
                                    </div>
                                    <div class="layui-inline">
                                        <!-- <label class="layui-form-label">分组选择框</label> -->
                                        <div class="layui-input-inline">
                                    <input type="button" value="查找" class="layui-btn" id="searchBtn"></input>
                                        </div>
                                    </div>
                                </div>
                            </form>
                                <table class="layui-table" id="demo"  lay-size="lg" lay-filter="test">
                                    <script type="text/html" id="barDemo">
                                        <a class="layui-btn layui-btn-xs" style="width:50px;"  lay-event="edit">管理</a>
                                        <a class="layui-btn layui-btn-xs" style="width:50px;"   lay-event="recharge">儲值</a>
                                    </script>
                                    <script type="text/html" id="barstatus">

                                    </script>
                                </table>
                        </div>
                </div>
        </div>
    </div>
</div>
<div id="money" class="score">
    <div style="height: 75px;line-height: 75px;text-align: center;font-size: 20px;">金幣儲值</div>
    <div align="center" >
    <div style="padding:0 15px;">
        <form class="layui-form" action="">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label1" >儲值賬號：</label>
                    <div class="layui-input-inline">
                        <label class="layui-form-label" style="text-align: left;" id="emaillabel"></label>
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
<jsp:include page="../include/footer.jsp"/>
</body>
<script src="/static-res/js/userManage/userManage.js?v=<%=System.currentTimeMillis() %>"></script>
<script type="text/javascript"></script>

</body>
</html>
