<%--
  Created by IntelliJ IDEA.
  User: wbliuwj
  Date: 2019/4/23
  Time: 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <title>聯絡我們管理/聯絡我們列表</title>
    <link rel="stylesheet" href="/static/css/layui.css">
    <style type="text/css">
        .layui-body{
            background-color:  	#f3f3f4;
        }

        #layui-input-width{
            width:250px;
        }
        .layui-label-width{
            width:130px !important;
        }
        .layui-label1-width{

            width:120px !important;
        }
        .layui-label-ck{
            width:0 !important;
        }
        .layui-inline-width{
            width:120px !important;
        }
        .layui-input-inline{
            width:170px !important;

        }
        .innerDemo{
            width:90px !important;
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
                <legend>聯絡我們管理/聯絡我們列表</legend>
            </fieldset>

            
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <!-- <div class="layui-card-header">卡片面板</div> -->
                        <div class="layui-card-body">
                        
                        
                            <form class="layui-form" action="" id="formDemo">

                                <div class="layui-form-item">
                                   

                                    <div class="layui-inline">
                                        <!-- <label class="layui-form-label">分组选择框</label> -->
                                        <div class="layui-input-inline">
                                            <select name="helptopic" id="helptopic">
                                            <option value="">請選擇上傳資料分類</option>
                                                <!-- 
                                                <option value="1">付款</option>
                                                <option value="2">其他</option>
                                                <option value="3">廣告 (Advertisement) / 商業廣告 (Banner)</option>
                                                <option value="4">廣告 (Advertisement) / 地產代理廣告 (Agency)</option>
                                                <option value="5">廣告 (Advertisement) / 審批新盤登記資料</option>
                                                <option value="6">支援 (Technical Support) / 修改樓盤 (Property Edit)</option>
                                                <option value="7">支援 (Technical Support) / 回覆管理員 (Reply to Admin)</option>
                                                <option value="8">支援 (Technical Support) / 傢俱問題 (Household)</option>
                                                <option value="9">支援 (Technical Support) / 審批代理聯絡資料</option>
                                                <option value="10">支援 (Technical Support) / 提供改善意見 (Advise to us)</option>
                                                <option value="11">支援 (Technical Support) / 更改會員資料 (Member Info)</option>
                                                <option value="12">支援 (Technical Support) / 服務式住宅</option>
                                                <option value="13">支援 (Technical Support) / 樓盤檢舉 (Report Abuse in property)</option>
                                                <option value="14">支援 (Technical Support) / 留言檢舉 (Report message abuse)</option>
                                                <option value="15">支援 (Technical Support) / 要求加入新屋苑名稱 (Ask for add new build)</option>
                                                <option value="16">系統 / 新盤價單有更新</option> -->
                                                 <c:forEach var="it" items="${helptopic}"  varStatus="stauts">
													 <option value="${it.dictionaryvalue}">${it.dictionaryname}</option>
                                                 </c:forEach>

                                            </select>
                                        </div>
                                    </div>
                                    <div class="layui-inline">
                                       <!--  <label class="layui-form-label layui-label1-width" >上傳時間：</label> -->
                                        <div class="layui-input-inline">
                                            <input type="text" name="startTime" id="startTime" lay-verify="date"  onmouseout="checkdate(this.value)" placeholder="上傳-起始時間" autocomplete="off" class="layui-input">
                                        </div>
                                        <label class="layui-form-label" style="width:10px;padding:10px 0 10px 0;text-align: left;">-</label>
                                        <div class="layui-input-inline">
                                            <input type="text" name="endTime" id="endTime" lay-verify="date"  onmouseout="checkdateend(this.value)" placeholder="上傳-結束時間" autocomplete="off" class="layui-input">
                                        </div>
                                        <input type="button" value="查找" class="layui-btn" id="searchBtn"></input>
                                    </div>
                                  
                                </div>
                                
                                
                                
                            </form>
                            <%--<div class="layui-inline innerDemo">--%>
                                        <%--<div class="layui-input-inline ">--%>
                                            <%--<button class="layui-btn innerDemo" id="searchBtn" lay-submit="" lay-filter="demo">查找</button>--%>
                                          <%--</div>--%>
                                    <%--</div>--%>
                                    <%--<div class="layui-inline ">--%>
                                        <%--<div class="layui-input-inline">--%>
                                            <%--<button class="layui-btn innerDemo" style="display: none;" lay-submit="" lay-filter="demo1">導出</button>--%>
                                            <%--</div>--%>
                                    <%--</div>--%>
                            
                                    
                        </div>
                    </div>
                </div>


            </div>

            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12  ">
                  

                    <table class="layui-table-cell" style="height:inherit;" id="usercontact"  lay-size="lg" lay-filter="usertool">
                    
                    <script type="text/html" id="barDemo">
									<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail" target="_Blank" >查看</a>
								
									
							</script>
                    </table>
                </div>
            </div>
            
            
            
        </div>
    </div>
</div>
<jsp:include page="../include/footer.jsp"/>
</body>
<!-- <script src="/static/layui.js"></script> -->
<script src="/static-res/js/userContact/getPage.js?v=<%=System.currentTimeMillis() %>"></script>

</html>
