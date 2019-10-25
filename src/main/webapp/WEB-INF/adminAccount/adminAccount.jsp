<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/7/17
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>管理員賬號</title>
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

        .score {
            width: 480px;
            height: 330px;
        }

        .layui-inline-width {
            width: 120px !important;
        }

        .layui-label1-width1 {

            width: 70px !important;
        }

        .layui-form-label1 {

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
    <link href="/static-res/bootstrap/bootstrap.css" rel="stylesheet"/>

    <script src="/static-res/bootstrap/bootstrapValidator.min.js"></script>
    <script src="/static-res/bootstrap/bootstrap.js"></script>
    <link href="/static-res/bootstrap/bootstrapValidator.min.css" rel="stylesheet"/>
</head>
<jsp:include page="../include/header.jsp"/>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>管理員賬號</legend>
            </fieldset>


            <div class=" layui-row layui-col-space15">

                <div class="layui-card">
                    <!-- <div class="layui-card-header">卡片面板</div> -->

                    <form class="layui-form" id="myform" action="">

                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <input type="tel" id="EmployeeNo" name="EmployeeNo" placeholder="請輸入管理員賬號名稱"
                                           autocomplete="off" class="layui-input">
                                </div>
                                <div class="layui-input-inline">
                                    <input type="text" name="startTime" id="date" placeholder="創建時間-起始時間"
                                           autocomplete="off" class="layui-input">
                                </div>
                                <label class="layui-form-label"
                                       style="width:10px;padding:10px 0 10px 0;text-align: left;">-</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="endTime" id="date1" placeholder="創建時間-結束時間"
                                           autocomplete="off" class="layui-input">
                                </div>
                                <div class="layui-input-inline " style="width: 80px">
                                    <input type="button" value="查找" class="layui-btn" id="searchBtn"></input>
                                </div>
                                <div class="layui-input-inline ">
                                    <input type="button" value="添加管理员账号" class="layui-btn" id="insertBtn"></input>
                                </div>
                            </div>
                        </div>
                    </form>
                    <table class="layui-table" id="demo" lay-size="lg" lay-filter="test">

                    </table>
                    <script type="text/html" id="barDemo">
                        <a class="layui-btn layui-btn-xs" id="deleteclick" lay-event="delete" style="width: 70px">刪除</a>
                    </script>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="addAccount">
    <div style="height: 75px;line-height: 75px;text-align: center;font-size: 20px;">添加管理员账号</div>
    <div align="center">
        <div style="padding:0 15px;">
            <form class="layui-form" id="addaccountform" action="">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label1">管理員賬號：</label>
                        <div class="layui-input-inline">
                            <div class="form-group">
                                <input type="text" id="empno" name="empno"  maxlength="20"
                                       class="form-control layui-input " placeholder="輸入账号">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label1">密碼：</label>
                        <div class="layui-input-inline">
                            <div class="form-group">
                                <input type="password" id="addpwd1" name="addpwd1"  maxlength="20"
                                       class="form-control layui-input " placeholder="輸入密碼">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label1">確認密碼：</label>
                        <div class=" layui-input-inline">
                            <div class="form-group">
                                <input type="password" id="addpwd2" name="addpwd2"  maxlength="20"
                                       class="form-control layui-input " placeholder="再次確認密碼">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label1" style="color: #009688;width: 400px;padding-left: 55px">密碼必須是包含字母
                            數字的組合 長度6~20之间</label>
                    </div>
                </div>

            </form>
        </div>
    </div>
</div>
<jsp:include page="../include/footer.jsp"/>
</body>
<script src="/static-res/js/adminAccount/adminAccount.js?v=<%=System.currentTimeMillis() %>"></script>
<script>
    $(function () {
        $('#addaccountform').bootstrapValidator({
            excluded: [':disabled'],
            live: 'disabled', //验证时机，enabled是内容有变化就验证（默认），disabled和submitted是提交再验证
            fields: {
                empno: {
                    // verbose: false,
                    validators: {
                        notEmpty: {
                            message: '必須填寫'
                        },
                        stringLength: {
                            min:3,
                            max: 20,
                            message: '長度3-20以內'
                        },
                        remote: { //ajax验证。server result:{"valid",true or false} （返回前台类型）
                            url: "/admin/checkExist",
                            message: '賬號名重複',
                            //delay: 500, //ajax刷新的时间是0.5秒一次
                            type: 'POST',
                            //自定义提交数据，默认值提交当前input value
                        },
                    }
                },
                addpwd1: {
                    validators: {
                        notEmpty: {
                            message: '必須填寫'
                        },
                        regexp: {
                            regexp: /^(?=.*\d)(?=.*[A-Za-z])[\x20-\x7e]{6,20}$/,

                            message: '必須為6-20位英文數字組合'
                        },

                    }
                },
                addpwd2: {
                    validators: {
                        notEmpty: {
                            message: '必須填寫'
                        },
                        regexp: {
                            regexp: /^(?=.*\d)(?=.*[A-Za-z])[\x20-\x7e]{6,20}$/,
                            message: '必須為6-20位英文數字組合'
                        },
                        identical: {
                            field: 'addpwd1',
                            message: '新密碼與確認密碼不一致'
                        },
                    }
                }
            },

        });
    })
</script>
</body>
</html>
