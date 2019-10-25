$(function () {
    $("#companya").addClass("layui-nav-itemed");
    $("#lay-company").addClass("layui-this");
})
layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'], function () {

    var form = layui.form
        , layer = layui.layer
        , laydate = layui.laydate;
    form.render();//初始化下拉框

    var laypage = layui.laypage //分页
        , layer = layui.layer //弹层
        , table = layui.table //表格
        , carousel = layui.carousel //轮播
        , upload = layui.upload //上传
        , element = layui.element //元素操作
        , slider = layui.slider //滑块
    var getDepartmentid = $("#getDepartmentid").val();
    var dtt = {
        departmentid: getDepartmentid
    };// 搜索条件

    res(dtt);// 页面加载的时候渲染

    $("#searchBtn").click(function () {
        var roleid = $("#roleid").val();

        dtt = {
            departmentid: getDepartmentid,
            roleid: roleid
        };
        res(dtt);
    })

    // table渲染
    function res(dtt) {
        //执行一个 table 实例
        table.render({
            elem: '#demo'
            , height: 475
            , url: '/branch/agentlist' //数据接口
            , title: '用户表'
            , page: false //开启分页
            , totalRow: false //开启合计行
            , limit: 10
            , where: dtt
            , method: 'GET'
            , cols: [[ //表头
                {field: 'DepartmentID', title: 'DepartmentID', width: '11%', align: 'center'},
                {
                    field: 'companyname', title: '公司名稱', width: '15%',
                    templet: function (d) {
                        return d.companyname + '<br/><span>' + d.companynameen + '</span>'
                    }, align: 'center', sort: false, totalRow: true
                }
                , {
                    field: 'DepartmentName',
                    title: '分行名稱',
                    width: '15%',
                    templet: function (d) {
                        return d.departmentname + '<br/><span>' + d.departmentnameen + '</span>'
                    },
                    align: 'center',
                    sort: false,
                    totalRow: true
                }
                ,
                {
                    field: 'role', title: '角色', width: '10%',
                    templet: function (d) {
                        var str = d.rolename[0];
                        for (var i = 1; i < d.rolename.length; i++) {
                            str = str + '<br/><span>' + d.rolename[i] + '</span>'
                        }
                        return str
                    },
                    align: 'center', sort: false
                }
                , {
                    field: 'name', title: '姓名', width: '10%', templet: function (d) {
                        return d.name + '<br/><span>' + d.nameen + '</span>'
                    }, align: 'center', sort: false, totalRow: true
                }
                , {field: 'telephone', title: '電話', width: '15%', align: 'center', sort: false, totalRow: true}
                , {field: 'email', title: '登錄郵箱', width: '15%', align: 'center', sort: false, totalRow: true}
                , {field: 'license', title: '牌照', width: '20%', align: 'center', sort: false, totalRow: true}
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
                        if (data.address === null) {
                            data.address = "";
                        }
                        if (data.departmentname === null) {
                            data.departmentname = "";
                        }
                        if (data.departmentnameen === null) {
                            data.departmentnameen = "";
                        }
                        if(data.license==null){
                            data.license = "/";
                        }
                        if(data.name==null){
                            data.name = "/";
                        }
                        if(data.nameen==null){
                            data.nameen = "/";
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
                $("[data-field='DepartmentID']").css('display', 'none');
            }

        });

    }

});


