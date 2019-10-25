$(function () {
    $("#companya").addClass("layui-nav-itemed");
    $("#lay-company").addClass("layui-this");

})
layui.use(['form', 'laydate', 'laypage', 'layedit', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'], function () {

    var form = layui.form
        , layer = layui.layer
        , layedit = layui.layedit
        , laydate = layui.laydate;
    form.render();//初始化下拉框


    //日期  注意：定义页面日期控件id不要重复!!!
    var start = laydate.render({
        elem: '#startTime',
        btns: ['clear', 'confirm'],
        isInitValue: false,
        max: new Date().toLocaleDateString(),
        done: function (value, date) {
            if (value !== '') {
                end.config.min = {
                    year: date.year,
                    month: date.month - 1,
                    date: date.date
                }
            } else {
                end.config.min = start.config.min
            }
        }
    });

    var end = laydate.render({
        elem: '#endTime',
        isInitValue: false,
        max: new Date().toLocaleDateString(),
        done: function (value, date) {
            if (value != '') {
                start.config.max = {
                    year: date.year,
                    month: date.month - 1,
                    date: date.date
                }
            } else {
                start.config.max = end.config.max
            }


        }
    });
    var ustart = laydate.render({
        elem: '#updatestartTime',
        btns: ['clear', 'confirm'],
        max: new Date().toLocaleDateString(),
        done: function (value, date, endDate) {
            if (value !== '') {
                uend.config.min = {
                    year: date.year,
                    month: date.month - 1,
                    date: date.date
                }
            } else {
                uend.config.min = ustart.config.min
            }
        }
    });
    var uend = laydate.render({
        elem: '#updateendTime',
        max: new Date().toLocaleDateString(),
        done: function (value, date, endDate) {
            if (value !== '') {
                ustart.config.max = {
                    year: date.year,
                    month: date.month - 1,
                    date: date.date
                }
            } else {
                ustart.config.max = uend.config.max
            }
        }
    });

    var laypage = layui.laypage //分页
        , layer = layui.layer //弹层
        , table = layui.table //表格
        , carousel = layui.carousel //轮播
        , upload = layui.upload //上传
        , element = layui.element //元素操作
        , slider = layui.slider //滑块

    var dtt = {};// 搜索条件

    res(dtt);// 页面加载的时候渲染

    $("#searchBtn").click(function () {
        //closePage();
        var companyname = $("#companyname").val();
        var area = $("#area").val();
        var gscope = $("#gscope").val();
        var status = $("#status").val();
        var createstart = $("#startTime").val();
        var createend = $("#endTime").val();
        var updatestart = $("#updatestartTime").val();
        var updateend = $("#updateendTime").val();

        dtt = {
            companyname: companyname,
            area: area,
            gscope: gscope,
            createstart: createstart,
            status: status,
            createend: createend,
            updatestart: updatestart,
            updateend: updateend

        };
        res(dtt);
    })

    // table渲染
    function res(dtt) {
        //执行一个 table 实例
        table.render({
            elem: '#demo'
            , url: '/company/manage/companylist' //数据接口
            , title: '用户表'
            , page: false //开启分页
            , totalRow: false //开启合计行
            , limit: 10
            , where: dtt
            , method: 'GET'
            , cols: [[ //表头
                {field: 'CompanyID', title: 'companyid', width: '12%', align: 'center'},
                {
                    field: 'CompanyName', title: '公司名稱', width: '10%',
                    templet: function (d) {
                        return d.CompanyName + '<br/><span>' + d.CompanyNameEN + '</span>'
                    }, align: 'center', sort: false, totalRow: true
                }
                , {field: 'RegionName', title: '區域', width: '10%', align: 'center', sort: false, totalRow: true}
                , {field: 'GscopeName', title: '地區', width: '10%', align: 'center', sort: false, totalRow: true}
                , {
                    field: 'maxdepartmentnumber',
                    title: '分行數',
                    width: '6%',
                    align: 'center',
                    sort: false,
                    totalRow: true
                }
                , {
                    field: 'Address', title: '公司地址', width: '12%',
                    templet: function (d) {
                        return d.Address + '<br/><span>' + d.AddressEN + '</span>'
                    }, align: 'center', sort: false
                }
                , {field: 'Telephone', title: '公司電話', width: '10%', align: 'center', sort: false, totalRow: true}
                , {field: 'CompanyLicense', title: '公司經濟牌照號碼', width: '12%', align: 'center'}
                , {field: 'IdentityScore', title: '權重分值', width: '7%', align: 'center', sort: false, totalRow: true}
                , {field: 'Status', title: '公司狀態', width: '7%', align: 'center', sort: false, totalRow: true}
                , {field: 'CreateTime', title: '創建時間', width: '12%', align: 'center', sort: false, totalRow: true}
                , {field: 'UpdateTime', title: '修改時間', width: '12%', align: 'center', sort: false, totalRow: true}
                , {fixed: 'right', title: '操作', width: '17%', align: 'center', toolbar: '#barDemo'}
            ]]
            , page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
                layout: ['count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
                //,curr: 5 //设定初始在第 5 页
                , groups: 5 //只显示 1 个连续页码
                , first: '首页' //不显示首页
                , last: '尾页' //不显示尾页
                , elem: 'bottomPage'
            }
            , parseData: function (res, curr, count) {
                if (res != null && res.data != null) {
                    for (var i = 0; i < res.data.length; i++) {
                        var data = res.data[i];
                        if (data.AddressEN == null) {
                            data.AddressEN = "/";
                        }
                        if (data.Address == null) {
                            data.Address = "/";
                        }
                        if (data.CompanyName == null) {
                            data.CompanyName = "/";
                        }
                        if (data.CompanyNameEN == null) {
                            data.CompanyNameEN = "/";
                        }
                        if (data.Status == "Normal") {
                            data.Status = "正常";
                        } else if (data.Status == "Disable") {
                            data.Status = "停用";
                        }

                    }
                }
            }
            , response: {
                statusName: 'code' //规定数据状态的字段名称，默认：code
                , statusCode: 0 //规定成功的状态码，默认：0
                , msgName: 'msg' //规定状态信息的字段名称，默认：msg
                , countName: 'count' //规定数据总数的字段名称，默认：count
                , dataName: 'data' //规定数据列表的字段名称，默认：data
            }
            , done: function (res, curr, count) {
                $("[data-field='CompanyID']").css('display', 'none');

            }

        });

    }

    /*form.on('select(gscopedetail)', function (data) {
        //   $("#mf").data('bootstrapValidator').resetForm();//清除当前验证的关键之处
        // $("#mf").bootstrapValidator('validate');//提交验证
    })*/

    form.on('select(area)', function (data) {
        $("#gscope > option:gt(0)").remove();//移除板块信息
        //$("#mf").data('bootstrapValidator').resetForm();//清除当前验证的关键之处
        // $("#mf").bootstrapValidator('validate');//提交验证
        $.ajax({
            type: "POST",
            dataType: "json",
            data: {area: data.value},
            url: "/company/queryGscopeCode",
            success: function (result) {
                if (result == null) {
                    $("#gscope").append("<option value=''>請選擇/輸入區域</option>");//为Select追加一个Option
                }
                else {
                    var g = $("#gscope");
                    var str = "<option value=''>請選擇/輸入區域</option>";
                    for (var i = 0; i < result.length; i++) {
                        g.append("<option value=" + result[i].GscopeCode + ">" + result[i].GscopeName + "</option>")
                    }
                    form.render('select');//select是固定写法 不是选择器
                }
            }
        });
    });

    //监听行工具事件
    table.on('tool(test)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
        var datamanage = obj.data //获得当前行数据
            , layEvent = obj.event; //获得 lay-event 对应的值
        if (layEvent === 'recharge') {
            $("#moneytype").empty();//移除信息
            $("#propertycoinnumber").val("")
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "/propertycoin/initselect",
                success: function (result) {
                    if (result == null) {
                        $("#moneytype").append("<option value=''>請選擇储值事项</option>");//为Select追加一个Option
                    }
                    else {
                        var g = $("#moneytype");
                        var str = "<option value=''>請選擇储值事项</option>";
                        g.append(str)
                        for (var i = 0; i < result.length; i++) {
                            g.append("<option value=" + result[i].ItemName + ">" + result[i].UsageItem + "</option>")
                        }
                        form.render('select');//select是固定写法 不是选择器
                    }
                }
            });
            manage(datamanage);

        } else if (layEvent === 'query') {
            var companyid = datamanage.CompanyID;
            var newWeb = window.open('_blank');
            newWeb.location = '/branch/querybranch?companyid=' + companyid;
        } else if (layEvent === 'edit') {
            var companyid = datamanage.CompanyID;
            var newWeb = window.open('_blank');
            newWeb.location = '/company/manage/companydetail?companyid=' + companyid;
        }
    });
    //用户解决工具栏按钮过多 显示不全 弹出点击layevent没反应的方案
    $(document).off('mousedown','.layui-table-grid-down')
        .on('mousedown','.layui-table-grid-down',function (event) {
            table._tableTrCurr=$(this).closest('td');

        });
    $(document).off('click','.layui-table-trips-main [lay-event]')
        .on('click','.layui-table-tips-main [lay-event]',function (event) {
            var elem = $(this);
            var tableTrCurr = table._tableTrCurr;
            if(!tableTrCurr){
                return;
            }
            var layerIndex = elem.closest('.layui-table-tips').attr('times');
            layer.close(layerIndex);
            table._tableTrCurr.find('[lay-event="'+ elem.attr('lay-event') + '"]').first().click()
        })
});
var flag=true;
function manage(datamanage) {
    var companyid = datamanage.CompanyID;
    var CompanyName = datamanage.CompanyName;
    var statusB    = datamanage.Status;
    var inde = layer.open({
        type:1
        //skin: 'layui-layer-rim', //加上边框
        ,area: ['900', '600'] //宽高
        ,title:" "
        ,content: $("#money")
        ,btn: ['儲值', '取消']
        ,btnAlign: 'c'
      //  ,maxmin:true
        ,yes: function(index, layero){
            if($("#moneytype").val()===''){
                layer.msg("請選擇充值事項")
                return
            }
            if($("#propertycoinnumber").val()==''){
                layer.msg("請輸入金幣數量")
                return;
            }
            if(statusB!="正常") {
                layer.msg("公司已停用，不能充值")
                return;
            }
            var cof=  layer.confirm(' <div align="center"><h2 style="font-family: 黑体 ;margin-top: 10px">是否確認儲值？</h2></div> ',{
                btn: ['確認','取消'],
                title:'',
                btnAlign: 'c',
                area:['350px','150px'],
                yes:function () {
                    if(!flag){
                        return false;
                    }
                    flag=false;
                    $.ajax({
                        type : "POST",
                        contentType : "application/x-www-form-urlencoded;charset=utf-8",
                        url : "/company/propertycoin/recharge",
                        data:{
                            companyId:companyid,
                            number:$("#propertycoinnumber").val(),
                            itemName:$("#moneytype").val()
                        },
                        error:function(request){
                            flag = true;
                            layer.msg("服務器出錯了");
                        },
                        success:function(data){
                            flag = true;
                            if(data.msg=="success"){
                                layer.close(inde)
                                var rechargesucc =  layer.confirm(' <div align="center"><h2 style="font-family: 黑体">金幣儲值成功</h2>  <br> <input type="button" class="layui-btn" onclick="recordmethod()"  id="record" value="查看储值记录"></input>&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="layui-btn layui-btn-primary"  id="continue" onclick="continuemethod()" value="關閉"></input></div> ',{
                                    btn: [],
                                    title:'',
                                    area:['350px','150px']
                                });
                            }else{
                                if(data.company!=null){
                                    layer.msg("充值失敗:"+data.company)
                                }else{
                                    layer.msg("充值失敗")
                                }

                            }
                        }
                    })
                },
                btn2:function () {

                }
            });



        },
        btn2:function(index, layero){
            layer.close(index);
        },
        success:function () {
            $("#namelabel").html(CompanyName);
        }
    });


}
function continuemethod () {
    layer.closeAll()
}
function recordmethod(){
    layer.closeAll()
    var newWeb = window.open('_blank');
    newWeb.location = '/propertycoin/coin';
}
$("#addBtn").click(function () {
    var newWeb = window.open('_blank');
    newWeb.location = '/company/manage/addcompany';
})

$("#detSubmit").click(function () {
    $("#mf").data('bootstrapValidator').resetForm();//清除当前验证的关键之处
    $("#mf").bootstrapValidator('validate');//提交验证
    var exp = $("#photourlShow").attr("src");

    if (typeof(exp) == "undefined"||exp=="") {
        layer.msg("請上傳圖片")
        return;
    }
    var detweb=$("#web1").val().trim();
    if(detweb!='' &&  detweb.substring(0,4).toLowerCase().indexOf("http")==-1){
         detweb = "http://" + detweb;

    }
    if ($("#gscope").val() == '' || $("#address1").val() == '' || $("#addressen1").val() == '' || $("#telephone1").val() == '' || $("#companylicense1").val() == '' || typeof(exp) == "undefined") {
//表單沒填寫完全 返回
        return;
    }
    var paramap = {
        companyid: $("#companyid1").val(),
        companyname: $("#companyname1").val(),
        companynameen: $("#companynameen1").val(),
        gscope: $("#gscope").val(),
        address: $("#address1").val(),
        addressen: $("#addressen1").val(),
        telephone: $("#telephone1").val(),
        companylicense: $("#companylicense1").val(),
        logo: $("#hidden").val(),
        introduce: $("#introduce1").val(),
        introduceen: $("#introduceen1").val(),
        monopolyarea: $("#monopolyarea1").val(),
        monopolyareaen: $("#monopolyareaen1").val(),
        web: detweb,
        identityscore: $("#identityscore1").val(),
        status: $("#status").val()
    };
    $.ajax({
        type: "POST",
        url: "/company/manage/updatecompany",
        data: paramap,
        dataType: "json",
        success: function (data) {
            if (data.msg == "success") {
                layer.msg('修改成功',{
                    offset:['50%'],
                    time: 1000
                },function(){
                    window.parent.opener.location.reload();
                    window.close();
                });

            } else if (data.msg == "error") {
                alert("修改失败");
            }
        },
        error: function (data) {
            layer.msg("失败了")
        }
    });

})

$("#insertSubmit").click(function () {
    $("#mf").data('bootstrapValidator').resetForm();//清除当前验证的关键之处
    $("#mf").bootstrapValidator('validate');//提交验证
    var exp = $("#photourlShow").attr("src");
    if (typeof(exp) == "undefined") {
        layer.msg("請上傳圖片")
        return;
    }
    var insertweb=$("#web").val().trim();
    if(insertweb!='' &&  insertweb.substring(0,4).toLowerCase().indexOf("http")==-1){
        insertweb = "http://" +insertweb;

    }
    var paramap = {
        companyname: $("#companyname").val(),
        companynameen: $("#companynameen").val(),
        gscope: $("#gscope").val(),
        address: $("#address").val(),
        addressen: $("#addressen").val(),
        telephone: $("#telephone").val(),
        companylicense: $("#companylicense").val(),
        logo: $("#hidden").val(),
        introduce: $("#introduce").val(),
        introduceen: $("#introduceen").val(),
        monopolyarea: $("#monopolyarea").val(),
        monopolyareaen: $("#monopolyareaen").val(),
        web: insertweb,
        identityscore: $("#identityscore").val(),
    };
    if ($("#companyname").val() == '' || $("#companynameen").val() == '' || $("#area").val() == '' || $("#gscope").val() == '' || $("#address").val() == '' || $("#addressen").val() == '' || $("#telephone").val() == '' || $("#companylicense").val() == '' || typeof(exp) == "undefined") {
//表單沒填寫完全 返回
        return;
    }
    $.ajax({
        type: "POST",
        url: "/company/manage/insertcompany",
        data: paramap,
        dataType: "json",
        error: function (request) {
            layer.msg("失败了")
        },
        success: function (data) {
            if (data.msg == "success") {
                alert("添加成功")
                window.parent.opener.location.reload();
                window.close();
            } else if (data.msg == "error") {
                alert("添加失败")
            }

        }
    });
})

function checknum300(a) {
    var nMax = 300;
    var textDom = $(a);
    var len = textDom.val().length;
    if (len > nMax) {
        textDom.val(textDom.val().substring(0, nMax));
        layer.msg("最多輸入300字")
        return;
    }
}

function checknum500(a) {
    var nMax = 500;

    var textDom = $(a);
    var len = textDom.val().length;
    if (len > nMax) {
        textDom.val(textDom.val().substring(0, nMax));
        layer.msg("最多輸入500字")
        return;
    }
}


$(".parent").on("change", ".file", function () {
    var filePath = $(this).val();

    var file = document.querySelector("#file");
    var fileObj = file.files[0];
    var size = 5000 * 1024
    var AllImgExt = ".jpg|.jpeg|.png|";
    var extName = fileObj.name.substring(fileObj.name.lastIndexOf(".")).toLowerCase();//（把路径中的所有字母全部转换为小写）
    if (AllImgExt.indexOf(extName + "|") == -1) {
        layer.msg("只支持png、jpg、jpeg格式的圖片");
        var obj = document.getElementById("file");
        obj.outerHTML=obj.outerHTML;
        return ;
    }var rw = fileObj.naturalWidth; // 真实图片宽度
    var rh = fileObj.naturalHeight; //真实图片高度
    if(rw>600||rh>400){
        layer.msg("圖片控制在600*400之內")
        return;
    }
    if (fileObj.size > size) {
        layer.msg("只支持5M以下的圖片")
        var obj = document.getElementById("file");
        obj.outerHTML=obj.outerHTML;
    } else {
        //创建formdata对象，formData用来存储表单的数据，表单数据时以键值对形式存储的。
        var formData = new FormData();
        formData.append('file', fileObj);
        layer.msg("圖片上傳中", {
            time: 1000
        })
        $.ajax({
            type: "POST",
            url: "/file/uploadFiles",
            dataType: "json",
            data: formData,
            contentType: false,
            processData: false,
            mimeType: "multipart/form-data",
            success: function (res) {
                if (res.message === "File extension is not supported.") {
                    layer.msg("只支持png、jpg、jpeg格式的圖片")
                } else {
                    $("#photourlShow").attr('src', res.result[0].url+"?x-oss-process=style/150xauto_f")
                    $("#hidden").val(res.result[0].url)
                }

            }
            , error: function () {
            }
        });
    }
});
$("#reset").click(function () {
    window.close();

})
$("#close").click(function () {
    window.close();

})








