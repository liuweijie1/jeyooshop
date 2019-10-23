<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>House730</title>
    <link rel="stylesheet" href="/static/css/layui.css">
    <link rel="stylesheet" href="/static-res/viewer/css/viewer.min.css">
    <style type="text/css">
        .score {
            width: 350px;
            text-align: center;
            padding-top: 10px;
            height: 100px;
        }

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
            width: 250px !important;
            text-align: left !important;
            background-color: #c4d4e5;
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

        .checkOrder {
            width: 500px !important;
        }

        .checkOrder1 {
            width: 300px !important;
        }

        .layui-row1 {
            border-bottom: 1px solid #C0C0C0;
        }

        .carousel-ul li {
            float: left;
        }

        .carousel-ul {
            text-align: center;
        }
    </style>

    <script type="text/javascript" src="/static-res/js/jquery/jquery-3.4.0.min.js"></script>
</head>
<jsp:include page="../../../include/header.jsp"/>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>放盤管理</legend>
            </fieldset>
            <div class="layui-row">

                <div class="layui-col-xs6 layui-col-md12">
                    <div class="grid-demo grid-demo-bg2"
                         style="background-color:#52cdec;line-height:50px;padding:0 30px;font-size:18px;color:white;">
                        自建樓盤
                    </div>
                </div>
            </div>
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md8">
                    <div class="layui-card">
                        <!-- <div class="layui-card-header">卡片面板</div> -->
                        <div class="layui-card-body">
                            <label style="font-weight:bold;margin-left:15px;">${releaseResult.regionname}</label>    <label style="font-weight:bold;margin-left:15px;">${releaseResult.estatename}</label> <label style="font-weight:bold;margin-left:15px;">${releaseResult.rentaltype==1?"出租":"出售"}</label> <label style="font-weight:bold;margin-left:15px;">${releaseResult.titlecn}</label>
                            <div class="layui-row layui-row1">
                                <div class="layui-inline">
                                    <label class="layui-form-label layui-label-width1">HOUSE730樓盤編號：</label>
                                    <div class="layui-input-inline">
                                        <!-- <label class="layui-form-label layui-label-width" >會員編號:</label> -->
                                        <%-- <input type="tel" name="userid"  autocomplete="off" class="layui-input checkOrder" value="${userOrder.userid }" > --%>
                                        <label class="layui-form-label layui-label-width">${releaseResult.estateid }</label>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-row layui-row1">
                                <div class="layui-inline">
                                    <label class="layui-form-label layui-label-width1">樓盤狀態：</label>
                                    <div class="layui-input-inline">
                                        <%-- <input type="tel" name="orderid"  autocomplete="off" class="layui-input checkOrder" value="${userOrder.orderid }"> --%>
                                        <label class="layui-form-label layui-label-width">${releaseResult.propertystatus }</label>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-row layui-row1">
                                <div class="layui-inline">
                                    <label class="layui-form-label layui-label-width1">出租價：</label>
                                    <div class="layui-input-inline">
                                        <%-- <input type="tel" name="item"  autocomplete="off" class="layui-input checkOrder" value="${userOrder.item }"> --%>
                                        <label class="layui-form-label layui-label-width">$ ${releaseResult.rentprice }</label>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-row layui-row1">
                                <div class="layui-inline">
                                    <label class="layui-form-label layui-label-width1">呎價(實用)：</label>
                                    <div class="layui-input-inline">
                                        <%-- <input type="tel"   autocomplete="off" class="layui-input checkOrder" value="<c:if test='${userOrder.orderstatus=="0"}'>未支付</c:if><c:if test='${userOrder.orderstatus=="1"}'>已支付</c:if>"> --%>
                                        <label class="layui-form-label layui-label-width">${releaseResult.saleableavgprice}</label>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-row layui-row1">
                                <div class="layui-inline">
                                    <label class="layui-form-label layui-label-width1">座數及單位：</label>
                                    <div class="layui-input-inline">
                                        <%-- <input type="tel"   autocomplete="off" class="layui-input checkOrder" value="<c:if test='${userOrder.orderstatus=="0"}'>未支付</c:if><c:if test='${userOrder.orderstatus=="1"}'>已支付</c:if>"> --%>
                                        <label class="layui-form-label layui-label-width">${releaseResult.buildingname}</label>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-row layui-row1">
                                <div class="layui-inline">
                                    <label class="layui-form-label layui-label-width1">層數：</label>
                                    <div class="layui-input-inline">
                                        <%-- <input type="tel"  autocomplete="off" class="layui-input checkOrder" value="<c:if test='${userOrder.paymenttype=="0"}'>信用卡</c:if><c:if test='${userOrder.paymenttype=="1"}'>銀行轉賬</c:if>"> --%>
                                        <label class="layui-form-label layui-label-width">${releaseResult.unitfloor}</label>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-row layui-row1">
                                <div class="layui-inline">
                                    <label class="layui-form-label layui-label-width1">房間：</label>
                                    <div class="layui-input-inline">
                                        <%-- <input type="tel" name="money"  autocomplete="off" class="layui-input checkOrder" value="${userOrder.money }"> --%>
                                        <label class="layui-form-label layui-label-width">${releaseResult.roomnumber}</label>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-row layui-row1">
                                <div class="layui-inline">
                                    <label class="layui-form-label layui-label-width1">實用面積(呎)：</label>
                                    <div class="layui-input-inline">
                                        <%-- <input type="tel" name="money"  autocomplete="off" class="layui-input checkOrder" value="${userOrder.money }"> --%>
                                        <label class="layui-form-label layui-label-width">${releaseResult.saleablearea }</label>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-row layui-row1">
                                <div class="layui-inline">
                                    <label class="layui-form-label layui-label-width1">物業地址：</label>
                                    <div class="layui-input-inline">
                                        <%-- <input type="tel" name="money"  autocomplete="off" class="layui-input checkOrder" value="${userOrder.money }"> --%>
                                        <label class="layui-form-label layui-label-width">${releaseResult.estateaddress }</label>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-row layui-row1">
                                <div class="layui-inline">
                                    <label class="layui-form-label layui-label-width1">瀏覽人次：</label>
                                    <div class="layui-input-inline">
                                        <%-- <input type="tel" name="money"  autocomplete="off" class="layui-input checkOrder" value="${userOrder.money }"> --%>
                                        <label class="layui-form-label layui-label-width">${releaseResult.browsenumber }</label>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-row layui-row1">
                                <div class="layui-inline">
                                    <label class="layui-form-label layui-label-width1">收藏人次：</label>
                                    <div class="layui-input-inline">
                                        <%-- <input type="tel" name="money"  autocomplete="off" class="layui-input checkOrder" value="${userOrder.money }"> --%>
                                        <label class="layui-form-label layui-label-width">${releaseResult.collectionnumber }</label>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-row layui-row1">
                                <div class="layui-inline">
                                    <label class="layui-form-label layui-label-width1">刊登或續期日：</label>
                                    <div class="layui-input-inline">
                                        <%-- <input type="tel" name="money"  autocomplete="off" class="layui-input checkOrder" value="${userOrder.money }"> --%>
                                        <label class="layui-form-label layui-label-width"><fmt:formatDate
                                                value='${releaseResult.publictime }'
                                                pattern='yyyy-MM-dd hh:mm:ss'/></label>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-row layui-row1">
                                <div class="layui-inline">
                                    <label class="layui-form-label layui-label-width1">記錄更新：</label>
                                    <div class="layui-input-inline">
                                        <%-- <input type="tel" name="money"  autocomplete="off" class="layui-input checkOrder" value="${userOrder.money }"> --%>
                                        <label class="layui-form-label layui-label-width"><fmt:formatDate
                                                value='${releaseResult.updatetime }'
                                                pattern='yyyy-MM-dd hh:mm:ss'/></label>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-row layui-row1">
                                <div class="layui-inline">
                                    <label class="layui-form-label layui-label-width1">放盤到期日：</label>
                                    <div class="layui-input-inline">
                                        <%-- <input type="tel" name="money"  autocomplete="off" class="layui-input checkOrder" value="${userOrder.money }"> --%>
                                        <label class="layui-form-label layui-label-width"><fmt:formatDate
                                                value='${releaseResult.expiretime }'
                                                pattern='yyyy-MM-dd hh:mm:ss'/></label>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-row" style="height: 50px;line-height: 50px;">
                                <span>單位特色 | 檢舉樓盤</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-col-md4">
                    <div class="layui-carousel" id="imgCarousel">
                        <div carousel-item>
                            <c:forEach items="${releaseResult.proimg}" var="list" varStatus="s">
                                <div>
                                    <img alt="" src="${list}" style="width: 100% ; height: 100%;">
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>

                <div class="layui-col-md12">
                    <div class="layui-row">
                        <div class="layui-col-xs6 layui-col-md12">
                            <div class="grid-demo grid-demo-bg2 "
                                 style="background-color:#2F4056;line-height:40px;padding:0 30px;font-size:16px;color:white;">
                                單位特色
                            </div>
                        </div>
                    </div>
                    <div class="layui-card">
                        <div class="layui-card-body">

                            <div class="layui-row">
                                <div class="layui-block">
                                    <label class="" style="font-weight:bold;margin-left:15px;">${releaseResult.category}</label>
                                    <c:forEach items="${releaseResult.subcategory}" var="list" varStatus="s">
                                        <label class=""style="font-weight:bold;margin-left:15px;">${list}</label>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="layui-row">
                                <div class="layui-block">
                                    <label style="font-weight:bold;margin-left:15px;">${releaseResult.regionname}</label>  <label style="font-weight:bold;margin-left:15px;">${releaseResult.estatename}</label> <label style="font-weight:bold;margin-left:15px;">${releaseResult.rentaltype==1?"出租":"出售"}</label>
                                </div>
                            </div>
                            <div class="layui-row">
                                <div class="layui-block">
                                    <div class="layui-block" style="font-weight:bold;margin-left:15px;">${releaseResult.titlecn}</div>
                                </div>
                            </div>
                            <div class="layui-row">
                                <div class="layui-block">
                                    <label class="layui-form-label " style="width: 150px;">起租日：</label>
                                    <div class="layui-block">
                                        <label class="layui-form-label layui-label-width"><fmt:formatDate value="${releaseResult.beginrenttime}" type="date" pattern="yyyy-MM-dd HH:mm"/></label>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-row">
                                <div class="layui-block">
                                    <label class="layui-form-label" style="width: 150px;">${releaseResult.saleform==1?"綠表價/白表價":"已補地價,自由市場"}</label>
                                </div>
                            </div>
                            <div class="layui-row">
                                <div class="layui-block">
                                    <label class="layui-form-label" style="width: 150px;">是否連車位：</label>
                                    <div class="layui-block">
                                        <label class="layui-form-label layui-label-width">${releaseResult.islinkparking?"是":"否"}</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="layui-row">
                            <div class="layui-block" style="padding: 9px 35px;">
                                <hr>
                            </div>
                        </div>
                        <div class="layui-row">
                            <div class="layui-block">
                                <label style="padding: 9px 25px;">${releaseResult.introduceCN}</label>
                            </div>
                        </div>
                        <div class="layui-row">
                            <div class="layui-block" style="padding: 9px 35px;">
                                <hr>
                            </div>
                        </div>
                        <c:if  test="${releaseResult.similar!=null}">
                            <label>代理的臨近單位：</label>
                            <div class="layui-row">
                                <div class="layui-block">
                                    <label class="layui-form-label">單位備註：</label>
                                    <div class="layui-block">
                                        <label class="layui-form-label layui-label-width">${releaseResult.similar.unitremark}</label>
                                    </div>
                                </div>
                            </div>

                            <div class="layui-row">
                                <div class="layui-block">
                                    <label class="layui-form-label">售價：</label>
                                    <div class="layui-block">
                                        <label class="layui-form-label layui-label-width">$ ${releaseResult.similar.saleprice}萬</label>
                                    </div>
                                </div>
                            </div>

                            <div class="layui-row">
                                <div class="layui-block">
                                    <label class="layui-form-label">租價：</label>
                                    <div class="layui-block">
                                        <label class="layui-form-label layui-label-width">$ ${releaseResult.similar.rentprice}</label>
                                    </div>
                                </div>
                            </div>

                            <div class="layui-row">
                                <div class="layui-block">
                                    <label class="layui-form-label">建築面積：</label>
                                    <div class="layui-block">
                                        <label class="layui-form-label layui-label-width">${releaseResult.similar.buildingarea}呎</label>
                                    </div>
                                </div>
                            </div>

                            <div class="layui-row">
                                <div class="layui-block">
                                    <label class="layui-form-label">實用面積：</label>
                                    <div class="layui-block">
                                        <label class="layui-form-label layui-label-width">${releaseResult.similar.saleablearea} 呎</label>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
            <c:forEach items="${releaseResult.user}" var="list" varStatus="s">
                <div class="layui-col-md12">
                    <div class="layui-row">
                        <div class="layui-col-xs6 layui-col-md12">
                            <div class="grid-demo grid-demo-bg2 "
                                 style="background-color:#2F4056;line-height:40px;padding:0 30px;font-size:16px;color:white;">
                                聯絡方法
                            </div>
                        </div>
                    </div>
                    <div class="layui-card" style="height: 300px;">
                        <div class="layui-card-body">
                            <div class="layui-col-md2">
                                <img alt="" src="${list.imagepath==null?"/static-res/image/touxiang.jpg":list.imagepath}" style="height: 200px;max-width: 200px;">
                            </div>
                            <div class="layui-col-md10">
                                <div class="layui-row">
                                    <div class="layui-block">
                                        <label class="layui-form-label">聯繫人：</label>
                                        <div class="layui-block">
                                            <label class="layui-form-label ">${list.contactnamecn}</label>
                                            <label class="layui-form-label ">${list.contactnameen}</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-row">
                                    <div class="layui-block">
                                        <div class="layui-block">
                                            <label class="layui-form-label layui-label-width">${list.companynamecn}</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-row">
                                    <label class="layui-form-label"><img alt="" src="/static-res/image/timg.jpg"
                                                                         style="width: 70px;height: 70px;"></label>
                                    <c:if test="${list.isshowtel}">
                                        <label class="layui-form-label"
                                               style="height: 70px;line-height: 70px;font-size: 20px;width: 300px;text-align: left;">TEL：${list.telphone }</label>
                                    </c:if>
                                    <c:if test="${!list.isshowtel}">
                                        <label class="layui-form-label"
                                               style="height: 70px;line-height: 70px;font-size: 20px;width: 300px;text-align: left;">TEL：/</label>
                                    </c:if>
                                    <c:if test="${list.approvalstatus=='PassApproval'}">
                                        <label class="layui-form-label"
                                               style="height: 70px;color: #5FB878; line-height: 70px;font-size: 20px;width: 300px;text-align: left;">代理人資料已通過審核</label>
                                    </c:if>
                                </div>
                            </div>
                            <div class="layui-row">
                                <div class="layui-block" style="height: 50px;line-height: 50px;">
                                    <label class=""
                                           style="color: red;font-size: 16px;">溫馨提示：在未睇樓及未簽約前，請勿付款給業主或代理！</label>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </c:forEach>
            <div class="layui-col-md12">
                <div class="layui-card">
                    <div class="layui-card-body">
                        <div class="layui-row">
                            <div class="layui-block">
                                <label class="layui-form-label layui-label-width">審核狀態：</label>
                                <div class="layui-block">
                                    <%-- <input type="tel" name="money"  autocomplete="off" class="layui-input checkOrder" value="${userOrder.money }"> --%>
                                    <label class="layui-form-label layui-label-width">${releaseResult.approvalstatus==1?"已通過":"未通過/未審核"}</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="layui-row" style="height: 150px;text-align: center;line-height: 100px;">
            <div class="layui-card">
                <div class="layui-card-body">
                    <div class="layui-input-inline">
                        <button class="layui-btn" id="checkBtn"
                                onclick="check(${releaseResult.approvalstatus},${releaseResult.propertyid})"
                                style="width: 100px;">審核
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>


</div>
</div>
<div id="checkContent" class="score">
    <label>是否通過審核?</label>
</div>
<jsp:include page="../../../include/footer.jsp"/>
</body>
<script src="/static-res/js/propertyManager/propertyAudit/selfProperty/getPage.js"></script>
<script src="/static-res/viewer/js/viewer-jquery.min.js"></script>
<script type="text/javascript"></script>
</body>
</html>