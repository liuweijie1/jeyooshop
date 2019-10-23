<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.house730.admin.pojo.User" %><%--
  Created by IntelliJ IDEA.
  User: wbwuxd
  Date: 2019/4/25
  Time: 14:23
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
            width: 200px !important;
            text-align: left !important;
            margin-left: 50px;
        }

        .layui-label1-width {

            width: 100px !important;
        }

        .layui-label-ck {
            width: 0 !important;
        }

        .layui-inline-width {
            width: 120px !important;
        }
        .score{
            width: 350px;
            text-align: center;
            padding-top: 10px;
            height: 100px;
        }
        #score .line{
            margin-top: 15px;
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
                         style="background-color:#52cdec;line-height:50px;padding:0 30px;font-size:18px;color:white;">
                        會員資料詳情
                    </div>
                </div>
            </div>
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <!-- <div class="layui-card-header">卡片面板</div> -->
                        <div class="layui-card-body">
                            <form class="layui-form" action="">

                                <div class="layui-form-item">
                                    <div class="layui-inline" style="display: none">
                                        <label class="layui-form-label layui-label-width" >會員ID:</label>
                                        <div class="layui-input-inline">
                                            <label class="layui-form-label layui-label-width" >${user.UserID}</label>
                                        </div>
                                    </div>
                                    <div class="layui-inline">
                                        <label class="layui-form-label layui-label-width" >會員編號:</label>
                                        <div class="layui-input-inline">
                                            <label class="layui-form-label layui-label-width" >${user.UserCode}</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <div class="layui-inline">
                                        <label class="layui-form-label layui-label-width">電郵:</label>
                                        <div class="layui-input-inline">
                                            <label class="layui-form-label layui-label-width" >${user.Email}</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <div class="layui-inline">
                                        <label class="layui-form-label layui-label-width" >用戶名:</label>
                                        <div class="layui-input-inline">
                                            <label class="layui-form-label layui-label-width" >${user.UserName}</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <div class="layui-inline">
                                        <label class="layui-form-label layui-label-width" >性別:</label>
                                        <div class="layui-input-inline">
                                            <label class="layui-form-label layui-label-width" >${user.gend}</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <div class="layui-inline">
                                        <label class="layui-form-label layui-label-width" >年齡組別:</label>
                                        <div class="layui-input-inline">
                                            <label class="layui-form-label layui-label-width" >${user.age}</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <div class="layui-inline">
                                        <label class="layui-form-label layui-label-width" >每月個人入息:</label>
                                        <div class="layui-input-inline">
                                            <label class="layui-form-label layui-label-width" >${user.salary}</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <div class="layui-inline">
                                        <label class="layui-form-label layui-label-width" >居所:</label>
                                        <div class="layui-input-inline">
                                            <label class="layui-form-label layui-label-width" >${user.live}</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <div class="layui-inline">
                                        <label class="layui-form-label layui-label-width" >會員訊息:</label>
                                        <div class="layui-input-inline">
                                            <label class="layui-form-label layui-label-width" >${user.IsReceiveMessage==true?"接收":"不接收"}</label>
                                        </div>
                                    </div>
                                </div>
                                <c:if test="${user.IsPropertyAgent==true}">
                                    <div class="layui-form-item">
                                        <div class="layui-inline">
                                            <label class="layui-form-label layui-label-width" >地產代理:</label>
                                            <div class="layui-input-inline">
                                                <label class="layui-form-label layui-label-width" >${user.IsPropertyAgent==true?"是":"否"}</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <div class="layui-inline">
                                            <label class="layui-form-label layui-label-width" >代理公司名稱:</label>
                                            <div class="layui-input-inline">
                                                <label class="layui-form-label layui-label-width" >${user.CompanyNameCN}</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <div class="layui-inline">
                                            <label class="layui-form-label layui-label-width" >代理公司電話:</label>
                                            <div class="layui-input-inline">
                                                <label class="layui-form-label layui-label-width" >${user.CompanyTelephone}</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <div class="layui-inline">
                                            <label class="layui-form-label layui-label-width" >代理公司地址:</label>
                                            <div class="layui-input-inline">
                                                <label class="layui-form-label layui-label-width" >${user.CompanyAddress}</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <div class="layui-inline">
                                            <label class="layui-form-label layui-label-width" >公司經紀牌照號碼:</label>
                                            <div class="layui-input-inline">
                                                <label class="layui-form-label layui-label-width" >${user.CompanyLicense}</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <div class="layui-inline">
                                            <label class="layui-form-label layui-label-width" >代理人牌照號碼:</label>
                                            <div class="layui-input-inline">
                                                <label class="layui-form-label layui-label-width" >${user.License}</label>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                                <div class="layui-form-item">
                                    <div class="layui-inline">
                                        <label class="layui-form-label layui-label-width" >會員資料審核:</label>
                                        <div class="layui-input-inline">
                                            <label class="layui-form-label layui-label-width" >${user.ApprovalStatus eq "PassApproval"?"已通過":"未通過"}</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <div class="layui-inline">
                                        <label class="layui-form-label layui-label-width" >賬戶狀態:</label>
                                        <div class="layui-input-inline">
                                            <label class="layui-form-label layui-label-width" >${user.Status eq "Normal"?"正常":"查封"}</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <div class="layui-inline">
                                        <label class="layui-form-label layui-label-width" >權重分值:</label>
                                        <div class="layui-input-inline">
                                            <label class="layui-form-label layui-label-width"  >${user.IdentityScore}</label>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                                <legend></legend>
                            </fieldset>
                            <div class="layui-inline" align="center">
                                <div class="layui-btn-container">
                                    <input type="button" class="layui-btn" value="資料審核"
                                           onclick="approval('${user.approvalStatus}',${user.userid})">
                                    <input type="button" class="layui-btn layui-btn-normal" value="賬號管理"
                                           onclick="account('${user.status}',${user.userid})">
                                    <input type="button" class="layui-btn layui-btn-warm" value="權重分值管理"
                                           onclick="score(${user.userid})">
                                </div>
                            </div>

                        </div>
                    </div>
                </div>


            </div>

        </div>


    </div>
</div>


<jsp:include page="../include/footer.jsp"/>
</body>
<div class="score" id="approval1">
    <h5 align="center">是否通過審核?</h5>

</div>


    <div id="account" class="score">
    <label>是否查封?</label>
</div>
    <div id="score" class="score">
        <div class="inline " >
            <label >會員編號：</label>
            <label >${user.usercode}</label>
        </div>
        <div class="line">
            <label >輸入權重分值：</label>
            <input id="quan" type="text"  onkeyup="if(value.length==1){value=value.replace(/[^(\-?)\d+]/ig,'')}else{value=value.substring(0,1)+value.substring(1,value.length).replace(/[^\d+]/ig,'');}">
        </div>
    </div>

<script src="/static-res/js/userManage/getPage.js"></script>
<script type="text/javascript"></script>
<script>
    /*  window.onload=function(){
        //getPage();
     }  */
</script>
</body>
</html>
