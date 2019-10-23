<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>House730</title>
    <link rel="stylesheet" href="/static/css/layui.css">

    <style>
        .txtSearch{ vertical-align:middle; }

        .btnSearch{ vertical-align:middle;}
        input,img {
            vertical-align:middle;
        }
        .window1 {

            width: 400px;

            position: absolute;

            margin-left: -200px;

            margin-top: -80px;

            top: 30%;

            left: 50%;

            display: block;

            z-index: 2000;


        }
        body{
            background-image: url(/static-res/image/back4.jpg);
            top: 0;

            left: 0;

            width:100%;

            height:100%;

            min-width: 1000px;

            z-index:-10;

            zoom: 1;
        }
        #tit{
        text-align:center;
            font-family: 黑体;
            font-size: 40px;
        }

    </style>

</head>

<body >

<div class="window1">
    <div id="tit">HOUSE730後台管理系統</div>
    <br>
    <br>
    <br>
    <form class="layui-form" method="post" >

        <div class="layui-form-item" style="margin-right: 100px;margin-top: 20px; ">

            <label class="layui-form-label">用戶名：</label>

            <div class="layui-input-block">

                <input type="text" id="username" name="user" required lay-verify="required" placeholder="请输入賬戶"
                       autocomplete="off" class="layui-input">

            </div>

        </div>

        <div class="layui-form-item">

            <label class="layui-form-label">密&nbsp;&nbsp;&nbsp;&nbsp;碼：</label>

            <div class="layui-input-inline">

                <input type="password" id="password" name="password" required lay-verify="required" placeholder="請輸入密碼"
                       autocomplete="off" class="layui-input ">

            </div>

        </div>

        <div class="layui-form-item" style="width: 500px">

            <label class="layui-form-label">驗證碼：</label>

            <div class="layui-input-inline">

                <input type="text"  id="code" name="code" required lay-verify="required" placeholder="请输入驗證碼"
                       autocomplete="off" class="layui-input  txtSearch">

            </div>
            <img src="/codeServlet" alt="驗證碼" class="btnSearch" style="cursor: pointer" onclick="change(this);">
        </div>

        <div class="layui-form-item">



            <div style="text-align: center;">

                <input type="submit" id="loginBtn" name="loginBtn" class="layui-btn"
                       value="登&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;录"/>

            </div>

        </div>

    </form>

</div>

</body>
<script type="text/javascript" src="/static-res/js/jquery/jquery-3.4.0.min.js"></script>
<script>
    function change(obj) {
        //get请求  使用?拼接参数
        obj.src = "/codeServlet?"+new Date().getTime();
    }
    $("#loginBtn").click(function () {
        var username = $.trim($("#username").val());
        var password = $.trim($("#password").val());
        var code = $.trim($("#code").val());
        if (username == "") {
            alert("请输入用户名");
            return false;
        } else if (password == "") {
            alert("请输入密码");
            return false;
        }
        //ajax去服务器端校验
        var data = {username: username, password: password,code:code};
        $.ajax({
            type: "POST",
            url: "login",
            data: data,
            success: function (data) {
                if (data == "200") {
                    window.location.href = "/index"
                }
                else if(data=="請輸入驗證碼"){
                    alert("請輸入驗證碼")
                }else if(data=="驗證碼不正確"){
                    alert("驗證碼不正確")
                }
            }
            , error(data) {
                alert("請重新輸入賬號密碼")
            }

        });
        return false;
    });
</script>

</html>