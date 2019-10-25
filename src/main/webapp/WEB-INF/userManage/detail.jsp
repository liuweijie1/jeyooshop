<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ime-mode" uri="http://www.springframework.org/tags/form" %>
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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Expires" content="0">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-control" content="no-cache">
    <meta http-equiv="Cache" content="no-cache">
    <title>會員管理/會員資料詳情</title>
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
        .layui-label-width1 {
            width: 800px !important;
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
            width: 380px;

            padding-top: 10px;
            height: 100px;
        }
        #score .line{
            margin-top: 15px;
        }
        .layui-layer-title{
            text-align: center;
            padding: 0 ;
        }
        input::-webkit-input-placeholder {
            text-align: center;
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
                <legend>會員管理/會員資料詳情</legend>
            </fieldset>
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
                                            <label class="layui-form-label layui-label-width" id="userid" >${user.UserID}</label>
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
                                        <label class="layui-form-label layui-label-width">電話:</label>
                                        <div class="layui-input-inline">
                                            <label class="layui-form-label layui-label-width" >${user.Telephone}</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <div class="layui-inline">
                                        <label class="layui-form-label layui-label-width" >用戶名:</label>
                                        <div class="layui-input-inline">
                                            <label class="layui-form-label layui-label-width" >${user.NickName}</label>
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
                                            <label class="layui-form-label layui-label-width" >${empty user.salary?"/":user.salary}</label>
                                        </div>
                                    </div>
                                </div>
                                <c:if test="${!empty user.live}">
                                <div class="layui-form-item">
                                    <div class="layui-inline">
                                        <label class="layui-form-label layui-label-width" >居所:</label>
                                        <div class="layui-input-inline">
                                            <label class="layui-form-label layui-label-width" >${user.live}</label>
                                        </div>
                                    </div>
                                </div>
                                </c:if>
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
                                                <label class="layui-form-label layui-label-width1" >${user.CompanyNameCN}<c:if test="${! empty user.CompanyNameCN and ! empty user.CompanyNameEN }">/</c:if>${user.CompanyNameEN}</label>
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
                                        <div class="layui-inline" >
                                            <label class="layui-form-label layui-label-width" >代理公司地址:</label>
                                            <div class="layui-input-inline" >
                                                <label class="layui-form-label layui-label-width1" >${user.CompanyAddress}</label>
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
                                    <div class="layui-form-item">
                                        <div class="layui-inline">
                                            <label class="layui-form-label layui-label-width" >個人簽名檔:</label>
                                            <div class="layui-input-inline">
                                                <label class="layui-form-label layui-label-width1" >${empty user.Signature?"/":user.Signature}</label>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>


                                <div class="layui-form-item">
                                    <div class="layui-inline">
                                        <label class="layui-form-label layui-label-width" >會員資料審核:</label>
                                        <div class="layui-input-inline">
                                            <c:choose>
                                                <c:when test="${user.ApprovalStatus eq 'PassApproval'}">
                                                    <label class="layui-form-label layui-label-width" >已通過</label>
                                                </c:when>
                                                <c:when test="${user.ApprovalStatus eq 'NotPassApproval'}">
                                                    <label class="layui-form-label layui-label-width" >未通過</label>
                                                </c:when>
                                                <c:when test="${user.ApprovalStatus eq 'UnderApproval'}">
                                                    <label class="layui-form-label layui-label-width" >未審核</label>
                                                </c:when>
                                                <c:otherwise>
                                                    <label class="layui-form-label layui-label-width" >/</label>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <div class="layui-inline">
                                        <label class="layui-form-label layui-label-width" >賬戶狀態:</label>
                                        <div class="layui-input-inline">
                                            <c:choose>
                                                <c:when test="${user.Status eq 'Normal'}">
                                                    <label class="layui-form-label layui-label-width" >正常</label>
                                                </c:when>
                                                <c:when test="${user.Status eq 'Disable'}">
                                                    <label class="layui-form-label layui-label-width" >停用</label>
                                                </c:when>
                                                <c:when test="${user.Status eq 'PendingCheck'}">
                                                    <label class="layui-form-label layui-label-width" >待驗證</label>
                                                </c:when>
                                                <c:otherwise>
                                                    <label class="layui-form-label layui-label-width" >/</label>
                                                </c:otherwise>
                                            </c:choose>
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
                        </div>
                    </div>
                </div>

            </div>
            <div class="layui-row" style="height: 150px;text-align: center;line-height: 100px;">

                        <div class="layui-input-inline">
                            <c:if test="${user.ApprovalStatus eq 'UnderApproval'}">
                            <button class="layui-btn" onclick="approval('${user.ApprovalStatus}',${user.UserID})" style="width: 110px;" >資料審核</button>
                            </c:if>
                            <button class="layui-btn" onclick="account('${user.Status}',${user.UserID})" style="width: 110px;" >${user.Status eq 'Normal'?'停用賬號':'解封賬號'}</button>

                            <button class="layui-btn" data-align="center" onclick="score(${user.UserID})" style="width: 110px;" >權重分值管理</button>

                            <button class="layui-btn  layui-btn-normal"  id="closePage" style="width:110px;" onclick="back()">取消</button>
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
    <label>是否停用?</label>
</div>
    <div id="score" class="score">
        <div class="layui-inline" style="width: 230px">
            <label class="layui-form-label ">會員編號：</label>
            <div class="layui-input-inline">
                <label class="layui-form-label " style="font-weight: bold; font-size: medium" >${user.UserCode}</label>
            </div>
        </div>
        <div class="layui-inline" style="width: 230px">
            <label class="layui-form-label " >權重分值：</label>
            <div class="layui-input-inline">
                <label class="layui-form-label " ><input id="quan"  placeholder="請錄入權重分值" style="height: 25px;border:black 1px solid;" type="text" maxlength="3"  onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9]+/,'');if(this.value>200){this.value=200};if(this.value.substring(0,1)=='0'){this.value='0'}}).call(this)" onblur="this.v();"></label> <br>

            </div>

        </div>
        <label class="layui-form-label " style="width: 300px">權重分值在0~200之間，默認值100</label>
    </div>
<script src="/static-res/js/userManage/userManage.js?v=<%=System.currentTimeMillis() %>"></script>
<script type="text/javascript"></script>
<script>
    function  back() {
        window.close();
    }

</script>
</body>
</html>
