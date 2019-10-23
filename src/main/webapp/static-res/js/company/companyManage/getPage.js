$(function () {
    $("#companya").addClass("layui-nav-itemed");
})
layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'], function () {

    var form = layui.form
        , layer = layui.layer
        , laydate = layui.laydate;
    form.render();//初始化下拉框

    //日期  注意：定义页面日期控件id不要重复!!!
    laydate.render({
        elem: '#startTime'
    });
    laydate.render({
        elem: '#endTime'
    });
    laydate.render({
        elem: '#updatestartTime'
    });
    laydate.render({
        elem: '#updateendTime'
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
        var createstart = $("#startTime").val();
        var createend = $("#endTime").val();
        var updatestart = $("#updatestartTime").val();
        var updateend = $("#updateendTime").val();

        dtt = {
            companyname: companyname,
            createstart: createstart,
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
            , height: 475
            , url: '/company/manage/companylist' //数据接口
            , title: '用户表'
            , page: false //开启分页
            , totalRow: false //开启合计行
            , limit: 10
            , where: dtt
            , method: 'GET'
            , cols: [[ //表头
                {field: 'companyid', title: 'companyid', width: '12%', align: 'center'},
                {
                    field: 'companyname', title: '公司名稱', width: '10%',
                    templet: function (d) {
                        return d.companyname + '<br/><span>' + d.companynameen + '</span>'
                    }, align: 'center', sort: false, totalRow: true
                }
                , {
                    field: 'maxdepartmentnumber',
                    title: '分行數',
                    width: '6%',
                    align: 'center',
                    sort: false,
                    totalRow: true
                }
                , {
                    field: 'address', title: '公司地址', width: '13%',
                    templet: function (d) {
                        return d.address + '<br/><span>' + d.addressen + '</span>'
                    }, align: 'center', sort: false
                }
                , {field: 'telephone', title: '公司電話', width: '11%', align: 'center', sort: false, totalRow: true}
                , {field: 'companylicense', title: '公司經濟牌照號碼', width: '12%', align: 'center'}
                , {field: 'identityScore', title: '權重分值', width: '8%', align: 'center', sort: false, totalRow: true}
                , {field: 'createtime', title: '創建時間', width: '13%', align: 'center', sort: false, totalRow: true}
                , {field: 'updatetime', title: '修改時間', width: '13%', align: 'center', sort: false, totalRow: true}
                , {fixed: 'right', title: '操作', width: '14%', align: 'center', toolbar: '#barDemo'}
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
                        if (data.addressen === null) {
                            data.addressen = "";
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
                $("[data-field='companyid']").css('display', 'none');
            }

        });

    }

    //普通图片上传
    var uploadInst = upload.render({
        elem: '#test1'
        , url: '/upload/'
        , before: function (obj) {
            //预读本地文件示例，不支持ie8
            obj.preview(function (index, file, result) {
                $('#demo1').attr('src', result); //图片链接（base64）
            });
        }
        , done: function (res) {
            //如果上传失败
            if (res.code > 0) {
                return layer.msg('上传失败');
            }
            //上传成功
        }
        , error: function () {
            //演示失败状态，并实现重传
            var demoText = $('#demoText');
            demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
            demoText.find('.demo-reload').on('click', function () {
                uploadInst.upload();
            });
        }
    });
    var uploadInst2 = upload.render({
        elem: '#test2'
        , url: '/upload/'
        , before: function (obj) {
            //预读本地文件示例，不支持ie8
            obj.preview(function (index, file, result) {
                $('#img1').attr('src', result); //图片链接（base64）
            });
        }
        , done: function (res) {
            //如果上传失败
            if (res.code > 0) {
                return layer.msg('上传失败');
            }
            //上传成功
        }
        , error: function () {
            //演示失败状态，并实现重传
            var demoText2 = $('#demoText2');
            demoText2.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
            demoText2.find('.demo-reload').on('click', function () {
                uploadInst2.upload();
            });
        }
    });
    //监听行工具事件
    table.on('tool(test)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
        var data = obj.data //获得当前行数据
            , layEvent = obj.event; //获得 lay-event 对应的值
        if (layEvent === 'detail') {
            layer.msg('預覽操作');

        } else if (layEvent === 'query') {
            var companyid = data.companyid;
            var newWeb = window.open('_blank');
            newWeb.location = '/branch/querybranch?companyid=' + companyid;
        } else if (layEvent === 'edit') {
            var companyid = data.companyid;
            var newWeb = window.open('_blank');
            newWeb.location = '/company/manage/companydetail?companyid=' + companyid;
        }
    });
});
$("#addBtn").click(function () {
    var newWeb = window.open('_blank');
    newWeb.location = '/company/manage/addcompany';
})

$("#detSubmit").click(function () {
    var exp = $("#img1").attr("src");
    if (!exp && typeof(exp) != "undefined" && exp != 0) {
        exp = null;
    }
    var paramap = {
        companyid: $("#companyid1").val(),
        companyname: $("#companyname1").val(),
        companynameen: $("#companynameen1").val(),
        address: $("#address1").val(),
        addressen: $("#addressen1").val(),
        telephone: $("#telephone1").val(),
        companylicense: $("#companylicense1").val(),
        logo: exp,
        introduce: $("#introduce1").val(),
        introduceen: $("#introduceen1").val(),
        web: $("#web1").val(),
        identityscore: $("#identityscore1").val(),
        max: $("#max").val()
    };
    $.ajax({
        type: "GET",
        url: "/company/manage/updatecompany",
        data: paramap,
        dataType: "json",
        error: function (request) {
            layer.msg("失败了")
        },
        success: function (data) {
            location.reload();
        }
    });

})
