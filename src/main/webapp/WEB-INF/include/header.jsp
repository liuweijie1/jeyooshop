<%@ page import="com.house730.admin.pojo.AdminEmployee" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>House730</title>
    <link rel="stylesheet" href="/static/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">House730後台管理</div>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="/static-res/image/admin.jpg" class="layui-nav-img">
                    ${sessionScope.admin.employeename}
                </a>
            </li>
            <li class="layui-nav-item"><a href="javascript:void(0)" onclick="logout()">退出登錄</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
            	<li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="/index">首頁</a>
                    
                </li>
                <li class="layui-nav-item" id="companya">
                    <a class="" href="javascript:;">代理公司管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/company/manage/company">公司管理</a></dd>
                        <dd><a href="javascript:;">查看分行</a></dd>
                        <dd><a href="javascript:;">查看分行聯絡人</a></dd>
                        <dd><a href="javascript:;">查看分行聯絡人</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">經紀人管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">列表一</a></dd>
                        <dd><a href="javascript:;">列表二</a></dd>
                        <dd><a href="">超链接</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="/trade/process">交易管理</a></li>
                <li class="layui-nav-item" id="fangpan"><a href="javascript:;">放盤管理</a>
                    <dl class="layui-nav-child">
                        <dd id="audit"><a href="javascript:;">附加審核</a>
                            <ol class="layui-nav-child">
                                <li><a href="/property/audit/index" >驗證標籤</a></li>
                                <li><a href="/property/self/index" >自建樓盤</a></li>
                            </ol></dd>
                        <dd><a href="/property/release">放盤審核</a></dd>
                        <dd><a href="/property/process">放盤列表</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="/user/query">會員管理</a></li>
                
                 <li class="layui-nav-item" id="information"><a href="javascript:;">資訊管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/infomationmanage/category">一級分類列表</a>
                        <dd><a href="/infomationmanage/subcategory">二級分類列表</a></dd>
                        <dd><a href="/infomationmanage/infomation">資訊列表</a></dd>
                    </dl>
                </li>
               
                <li class="layui-nav-item"><a href="/propertyreportmanage/process">檢舉管理</a></li>
                <li class="layui-nav-item"><a href="/coinset/process">屋幣配置</a></li>
                <li class="layui-nav-item"><a href="/usercontactmanage/process">聯絡我們管理</a></li>
                <li class="layui-nav-item"><a href="/admin/message">留言反饋管理</a></li>
            </ul>
        </div>
    </div>
</div>
<script src="/static/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });

</script>
<script>
    function logout() {
        $.ajax({
            url: "logout",
            type : "GET",
            success:function () {
                window.location.href = "/redirect";
            }



        });

    }
</script>
</body>
</html>