<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>House730-Login</title>
    <link rel="stylesheet" href="/static/css/layui.css">
    <link rel="icon" href="/static/images/logo.png" type="image/png">

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
            background-image: url(/static-res/image/back3.jpg);
            top: 0;
            background-size: cover;

            overflow: hidden;

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
            font-size: 50px;
        }

    </style>

</head>

<body >

<div class="window1">
    <div id="tit">後台管理系統</div>
    <br>
    <br>
    <br>
    <br>

    <form class="layui-form"  >
        <div class="layui-form-item" style="margin-right: 100px;margin-top: 20px; ">
            <label class="layui-form-label" style="font-size: larger">用戶名：</label>

            <div class="layui-input-block">
                <input type="text" id="username1" name="user"  placeholder="请輸入賬戶"
                       autocomplete="off" class="layui-input" style="display: none">
                <input type="text" id="username" name="user" placeholder="请輸入賬戶"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"style="font-size: larger">密&nbsp;&nbsp;&nbsp;&nbsp;碼：</label>
            <div class="layui-input-inline">
                <input type="text"  class="layui-input "   id="password" name="pwd_login"  placeholder="請輸入登录密码"   autocomplete="off"  />
                <input type ='hidden' id="hiddenVal">
            </div>
        </div>
        <div class="layui-form-item" style="width: 500px">
            <label class="layui-form-label"style="font-size: larger">驗證碼：</label>
            <div class="layui-input-inline">
                <input type="text"  id="code" name="code"  lay-verify="required" placeholder="请輸入驗證碼"
                       autocomplete="off" class="layui-input  txtSearch">
            </div>
            <img src="/codeServlet" alt="驗證碼" class="btnSearch" style="cursor: pointer" id="image" onclick="change();">
        </div>
        <div class="layui-form-item">
            <div style="text-align: center;">
                <input type="button"  id="send" name="loginBtn" value="登&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;入" class="layui-btn"
                ></input>
            </div>
        </div>

    </form>
</div>

</body>

<script type="text/javascript" src="/static-res/js/jquery/jquery-3.4.0.min.js"></script>
<script src="/static/layui.js"></script>
<script>
    $(function(){
        layui.use([ 'layer'], function () {
            var layer = layui.layer
        })

            $(document).keydown(function(event){
            if(event.keyCode==13){
                $("#send").click();
            }
        });

    })
    function change() {
        //get请求  使用?拼接参数
       $("#image").attr("src","/codeServlet?"+new Date().getTime());
    }
    var username1=document.getElementById('username')
    var password1 = document.getElementById('password');
    var hiddenVal=document.getElementById('hiddenVal');
    var send = document.getElementById('send');
    password1.addEventListener('focus',function(){
        this.type="password"
    })
    password1.addEventListener('input',function(ev){
        if(ev.inputType){
            hiddenVal.value = this.value;
        }
    })
    send.onclick=function(){
        if (username1.value == "") {
            layer.msg("請輸入用戶名",{time:1*1000})
            return false;
        }
        if (password1.value == "") {
            layer.msg("請輸入密碼",{time:1*1000})
            return false;
        }
        if(!hiddenVal.value){
            layer.msg("為了您的賬號安全，請手動輸入密碼！",{time:1*1000})
            password1.value ='';
            username1.value ='';
            return false;
        }
        if($("#code").val()==""){
            layer.msg("請輸入驗證碼",{time:1*1000})
            return false;
        }

        //ajax去服务器端校验
        var data = {username: $("#username").val(), password: $("#password").val(),verifycode:$("#code").val()};
        $.ajax({
            type: "POST",
            url: "/login",
            data: data,
            contentType : "application/x-www-form-urlencoded;charset=utf-8",
            // dataType: "json",
            success: function (data) {
                if (data == "success") {
                    window.location.href = "/user/index"
                }else if(data=="error"){
                    layer.msg("用戶名密碼不匹配")
                }
                else if(data=="請輸入驗證碼"){
                    layer.msg(data,{time:1*1000})
                }else if(data=="驗證碼不正確"){
                    layer.msg(data,{time:1*1000})
                }
            }
            ,error:function() {
                layer.msg("服務器出錯了")
            }
        });
    };
</script>
</html>