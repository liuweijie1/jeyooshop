<%@ page import="com.jeyoo.pojo.AdminEmployee" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="icon" href="/static/images/logo.png" type="image/png">
    <style type="text/css">
    	.layui-a-parent{
    		font-size:16px !important;
    	}
    	dd a{
    		font-size: 14px !important;
    		/* color: black !important; */
    		/* margin-left: 30px !important; */
    		padding: 0 0 0 40px !important;
    	}
    	.layui-nav-itemed>.layui-nav-child{
    		background-color: rgba(0,0,0,.3) !important;
    	}
    	.layui-this a{
    		color: white !important;
    	}
    	.layui-nav-child dd:hover{
    		background-color: #4E5465 !important;
    	}
    	/*.layui-this{
    		pointer-events: none !important;
    	}*/
    	.layui-nav-itemed>a,.layui-nav-tree .layui-nav-title a,.layui-nav-tree .layui-nav-title a:hover{
    		color:rgba(255,255,255,.7)  !important;
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
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">House730後台管理</div>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="/static-res/image/house730.png" class="layui-nav-img">
                    <label id="name"></label>
                </a>
            </li>
            <li class="layui-nav-item"><a href="javascript:void(0)" onclick="editPassword()">修改密碼</a></li>
            <li class="layui-nav-item"><a href="javascript:void(0)" onclick="logout()">退出登入</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="leftNav" style="margin-bottom: 100px;">
            	<li class="layui-nav-item" id="lay-user"><a class="layui-a-parent" href="/user/index">會員管理</a></li>
                <li class="layui-nav-item" id="companya">
                    <a id="companyaUrl" class="layui-a-parent" href="javascript:;">代理公司管理</a>
                    <dl class="layui-nav-child">
                        <dd id="lay-company"><a href="/company/manage/company">公司管理</a></dd>
                        <dd id="lay-account"><a href="/usercompanyaccount/process">賬戶管理</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item" id="lay-trade"><a class="layui-a-parent" href="/trade/process">交易管理</a></li>
                <li class="layui-nav-item" id="fangpan"><a id="fangpanUrl" class="layui-a-parent" href="javascript:;">放盤管理</a>
                    <dl class="layui-nav-child">
                        <dd id="lay-audit"><a href="/property/audit/index">附加審核</a></dd>
                        <dd id="lay-release"><a href="/property/release">放盤審核</a></dd>
                        <dd id="lay-propertylist"><a href="/property/process">放盤列表</a></dd>
                    </dl>
                </li>
                
                
                 <li class="layui-nav-item" id="information"><a id="informationUrl" class="layui-a-parent" href="javascript:;">資訊管理</a>
                    <dl class="layui-nav-child">
                        <dd id="lay-category"><a href="/infomationmanage/category">一級分類列表</a>
                        <dd id="lay-subcategory"><a href="/infomationmanage/subcategory">二級分類列表</a></dd>
                        <dd id="lay-information"><a href="/infomationmanage/infomation">資訊列表</a></dd>
                    </dl>
                </li>
               
                <li class="layui-nav-item" id="lay-report"><a class="layui-a-parent" href="/propertyreportmanage/process">檢舉管理</a></li>
                <li class="layui-nav-item" id="lay-coinset"><a class="layui-a-parent" href="/coinset/process">金幣配置</a></li>
                <li class="layui-nav-item" id="lay-label"><a class="layui-a-parent" href="/label/process">標籤詞管理</a></li>
                <li class="layui-nav-item" id="lay-usercontactmanage"><a class="layui-a-parent" href="/usercontactmanage/process">聯絡我們管理</a></li>
                <li class="layui-nav-item" id="lay-msg"><a class="layui-a-parent" href="/msg/message">留言反饋管理</a></li>
                <li class="layui-nav-item" id="lay-propertycoin"><a class="layui-a-parent" href="/propertycoin/coin">賬戶金幣儲值記錄</a></li>
                <li class="layui-nav-item" id="lay-admin" style="display: none"><a class="layui-a-parent" href="/admin/accountindex">管理員賬號</a></li>
            </ul>
        </div>
    </div>
</div>

<script src="/static/layui.js"></script>
<script src="/static-res/js/include/header.js?v=<%=System.currentTimeMillis() %>"></script>
</body>
<div id="editAccount">
    <div style="height: 75px;line-height: 75px;text-align: center;font-size: 20px;">修改密碼</div>
    <div align="center">
        <div style="padding:0 15px;">
            <form class="layui-form" id="accountform" action="">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label1">管理員賬號：</label>
                        <div class="layui-input-inline">
                            <label class="layui-form-label" style="text-align: left; width: 180px" id="account"></label>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label1">原密碼：</label>
                        <div class="layui-input-inline">
                            <input type="password" id="pwd" name="pwd"  maxlength="20"
                                   class="layui-input " placeholder="輸入原密碼">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label style="color: red;" id="pwdLab"></label>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label1">新密碼：</label>
                        <div class="layui-input-inline">
                            <input type="password" id="pwd1" name="pwd1"  maxlength="20"
                                   class="layui-input " placeholder="輸入密碼">

                        </div>
                    </div>
                    <div class="layui-inline">
                        <label style="color: red;" id="pwd1Lab"></label>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label1">確認密碼：</label>
                        <div class=" layui-input-inline">
                            <input type="password" id="pwd2" name="pwd2" maxlength="20"
                                   class=" layui-input " placeholder="再次確認密碼">

                        </div>
                    </div>
                    <div class="layui-inline">
                        <label style="color: red;" id="pwd2Lab"></label>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label1" style="color:#009688;width: 400px;padding-left: 55px">(必須為6-20位英文數字組合，修改密碼後，需要重新登錄)</label>
                    </div>
                </div>

            </form>
        </div>
    </div>
</div>
