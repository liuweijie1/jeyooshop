/*window.onload=function(){
	getPage();
}*/

layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'], function () {

    var form = layui.form
        , layer = layui.layer
        , laydate = layui.laydate;
    form.render();//初始化下拉框


    //日期  注意：定义页面日期控件id不要重复!!!
    laydate.render({
        elem: '#date'
    });
    laydate.render({
        elem: '#date1'
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
        var usercode = $("#userCode").val();
        var source = $("#source").val();
        var ispropertyagent = $("#ispropertyagent").val();
        var registry = $("#registry").val();
        var approvalStatus = $("#approvalStatus").val();
        var status = $("#status").val();
        var startTime = $("#date").val();
        var endTime = $("#date1").val();

        dtt = {
            usercode: usercode, source: source, ispropertyagent: ispropertyagent, registry: registry,
            approvalStatus: approvalStatus, status: status, startTime: startTime, endTime: endTime
        };
        res(dtt);
    })


    //执行一个 table 实例

    function res(dtt) {
        table.render({
            elem: '#demo'
            , height: 490
            , url: '/user/query/data' //数据接口
            , method: 'GET'
            , title: '用戶表'//定义 table 的大标题（在文件导出等地方会用到）
            , page: false //开启分页
            , totalRow: false //开启合计行
            , limit: 10
            , where: dtt
            , cols: [[ //表头
                //{type: 'checkbox', fixed: 'left'}

                  {field: 'usercode', title: '會員編號',align: 'center', width: '8%'}
                , {field: 'createtime', title: '創建時間',align: 'center', width: '14%', sort: false, totalRow: true}
                , {field: 'email', title: '註冊電郵',align: 'center', width: '18%', sort: false}
                , {field: 'telephone', title: '註冊電話',align: 'center', width: '10%', sort: false, totalRow: true}
                , {field: 'registerSource', title: '註冊方式', align: 'center',width: '8%'}
                , {field: 'ispropertyagent', title: '會員類型',align: 'center', width: '8%'}
                , {field: 'companynamecn', title: '所屬公司',align: 'center', width: '20%'}
                , {field: 'source', title: '註冊渠道',align: 'center', width: '8%'}
                , {field: 'identityscore', title: '權重分值',align: 'center', width: '8%'}
                , {field: 'approvalStatus', title: '資料審核狀態', align: 'center',width: '11%', sort: false, totalRow: true}
                , {field: 'status', title: '賬戶狀態', align: 'center',width: '8%', sort: false, totalRow: true}
                , {fixed: 'right', title: '操作',align: 'center', width: '8%', align: 'center', toolbar: '#barDemo'}

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
                        if (data.ispropertyagent == true) {
                            data.ispropertyagent = "地產代理";
                        } else {
                            data.ispropertyagent = "普通用戶";
                        }
                        if (data.approvalStatus == "PassApproval") {
                            data.approvalStatus = "已通過"
                        } else if (data.approvalStatus == "NotPassApproval") {
                            data.approvalStatus = "未通過"
                        } else if (data.approvalStatus == "UnderApproval") {
                            data.approvalStatus = "待審核"
                        }
                        if (data.status == "Normal") {
                            data.status = "正常"
                        }
                        if (data.status == "Disable") {
                            data.status = "查封"
                        }
                        data.createtime = layui.util.toDateString(data.createtime, 'yyyy-MM-dd HH:mm:ss');


                    }
                }
            }
            , response: {
                statusName: 'code' //规定数据状态的字段名称，默认：code
                ,statusCode: 0 //规定成功的状态码，默认：0
                ,msgName: 'msg' //规定状态信息的字段名称，默认：msg
                ,countName: 'count' //规定数据总数的字段名称，默认：count
                ,dataName: 'data' //规定数据列表的字段名称，默认：data
            }
            /* , done: function (res, curr, count) {
             }*/

        });
    }

    //监听头工具栏事件
    table.on('toolbar(test)', function (obj) {
        var checkStatus = table.checkStatus(obj.config.id)
            , data = checkStatus.data; //获取选中的数据
        switch (obj.event) {
            case 'add':
                layer.msg('添加');
                break;
            case 'update':
                if (data.length === 0) {
                    layer.msg('请选择一行');
                } else if (data.length > 1) {
                    layer.msg('只能同时编辑一个');
                } else {
                    layer.alert('编辑 [id]：' + checkStatus.data[0].id);
                }
                break;
            case 'delete':
                if (data.length === 0) {
                    layer.msg('请选择一行');
                } else {
                    layer.msg('删除');
                }
                break;
        }
        ;
    });

    //监听行工具事件
    table.on('tool(test)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
        var datamanage = obj.data //获得当前行数据
            , layEvent = obj.event; //获得 lay-event 对应的值
        if (layEvent === 'detail') {

        } else if (layEvent === 'del') {
            manage(datamanage);
        } else if (layEvent === 'edit') {
            var userid = datamanage.userid;
            var newWeb=window.open('_blank');
            newWeb.location='query/detailindex?userid='+userid;

        }
    });

    //执行一个轮播实例
    carousel.render({
        elem: '#test1'
        , width: '100%' //设置容器宽度
        , height: 200
        , arrow: 'none' //不显示箭头
        , anim: 'fade' //切换动画方式
    });

    //将日期直接嵌套在指定容器中
    /*var dateIns = laydate.render({
      elem: '#laydateDemo'
      ,position: 'static'
      ,calendar: true //是否开启公历重要节日
      ,mark: { //标记重要日子
        '0-10-14': '生日'
        ,'2018-08-28': '新版'
        ,'2018-10-08': '神秘'
      }
      ,done: function(value, date, endDate){
        if(date.year == 2017 && date.month == 11 && date.date == 30){
          dateIns.hint('一不小心就月底了呢');
        }
      }
      ,change: function(value, date, endDate){
        layer.msg(value)
      }
    }); */

    //分页
    /*laypage.render({
      elem: 'demo' //分页容器的id
      ,count: 100 //总页数
      ,skin: '#1E9FFF' //自定义选中色值
      ,skip: true //开启跳页
      ,jump: function(obj, first){
        if(!first){
          layer.msg('第'+ obj.curr +'页', {offset: 'b'});
        }
      }
    });  */
});

// 查看
function checkOrder() {
    var index = layer.open({
        type: 1,
        //skin: 'layui-layer-rim', //加上边框
        area: ['80%', '80%'] //宽高
        , content: $('#test')
        , btn: ['继续弹出', '关闭']
        , btnAlign: 'c'
        , yes: function (index, layero) {
            layer.close(index);

        },
        btn2: function (index, layero) {

        }
    });
    $("#closePage").click(function () {
        //closePage();
        layer.close(index);
    })
}

function manage(datamanage) {
    var aaa = "理由"
    var status = datamanage.status;
    var usercode = datamanage.usercode;
    if(status=="正常") {

    }
    $.ajax({
        url: "/user/query/reason",
        data:{usercode:usercode},
        type : "GET",
        contentType : "application/json;charset=utf-8",
        success:function (res) {
            var rtn = res.data;
            if (rtn==null) {
                rtn="/"
            }
            layer.open({
                title: "賬號狀態："+status,
                content: "理由："+rtn
            });
        }



    });

}
function approval(status,userid){
    var tg={
        userid:userid,
        approvalstatus:"PassApproval"
    }
    var btg={
        userid:userid,
        approvalstatus:"NotPassApproval"
    }
    if (status=="PassApproval"){
        var index = layer.open({
            type:1
            //skin: 'layui-layer-rim', //加上边框
            ,area: ['900', '600'] //宽高
            ,title:"會員資料審核"
            ,content: $("#approval1")
            ,btn: ['不通過']
            ,method:'GET'
            ,btnAlign: 'c'
            ,maxmin:true
            ,yes: function(index, layero){
                $.ajax({
                    type : "GET",
                    /*contentType : "application/json;charset=utf-8",*/
                    contentType : "application/x-www-form-urlencoded;charset=utf-8",
                    //contentType: "application/x-www-form-urlencoded",
                    //contentType: "application/json",
                    //dataType : "json",
                    url : "/user/query/check/approval",
                    //data:JSON.stringify(getFormData($("#storeValueForm"))),
                    data:btg,
                    error:function(request){
                        alert(2);
                    },
                    success:function(data){
                        layer.close(index);
                        location.reload();
                        //location.href="/trade/tradeDetail";
                    }
                })
                //layer.close(index);

            },
        });
    }
    else if (status=="NotPassApproval"){
        var index = layer.open({
            type:1
            //skin: 'layui-layer-rim', //加上边框
            ,area: ['900', '600'] //宽高
            ,title:"會員資料審核"
            ,content: $("#approval1")
            ,btn: ['通過']
            ,method:'GET'
            ,btnAlign: 'c'
            ,maxmin:true
            ,yes: function(index, layero){
                $.ajax({
                    type : "GET",
                    /*contentType : "application/json;charset=utf-8",*/
                    contentType : "application/x-www-form-urlencoded;charset=utf-8",
                    //contentType: "application/x-www-form-urlencoded",
                    //contentType: "application/json",
                    //dataType : "json",
                    url : "/user/query/check/approval",
                    //data:JSON.stringify(getFormData($("#storeValueForm"))),
                    data:tg,
                    error:function(request){
                        alert(2);
                    },
                    success:function(data){
                        layer.close(index);
                        location.reload();
                        //location.href="/trade/tradeDetail";
                    }
                })
                //layer.close(index);

            },
        });
    } else {
        var index = layer.open({
            type:1
            //skin: 'layui-layer-rim', //加上边框
            ,area: ['900', '600'] //宽高
            ,title:"會員資料審核"
            ,content: $("#approval1")
            ,btn: ['通過', '不通過']
            ,method:'GET'
            ,btnAlign: 'c'
            ,maxmin:true
            ,yes: function(index, layero){
                $.ajax({
                    type : "GET",
                    /*contentType : "application/json;charset=utf-8",*/
                    contentType : "application/x-www-form-urlencoded;charset=utf-8",
                    //contentType: "application/x-www-form-urlencoded",
                    //contentType: "application/json",
                    //dataType : "json",
                    url : "/user/query/check/approval",
                    //data:JSON.stringify(getFormData($("#storeValueForm"))),
                    data:tg,
                    error:function(request){
                        alert(2);
                    },
                    success:function(data){
                        layer.close(index);
                        location.reload();
                        //location.href="/trade/tradeDetail";
                    }
                })
                //layer.close(index);

            },
            btn2:function(index, layero){
                $.ajax({
                    type : "GET",
                    /*contentType : "application/json;charset=utf-8",*/
                    contentType : "application/x-www-form-urlencoded;charset=utf-8",
                    //contentType: "application/x-www-form-urlencoded",
                    //contentType: "application/json",
                    //dataType : "json",
                    url : "/user/query/check/approval",
                    //data:JSON.stringify(getFormData($("#storeValueForm"))),
                    data:btg,
                    error:function(request){
                        alert(2);
                    },
                    success:function(data){
                        layer.close(index);
                        location.reload();
                        //location.href="/trade/tradeDetail";
                    }
                })
            }
        });
    }

    $("#closePage").click(function(){
        //closePage();
        layer.close(index);
    })
    //})
}
function account(status,userid){
    var tg={
        userid:userid,
        status:"Normal"
    }
    var btg={
        userid:userid,
        status:"Disable"
    }
    if (status=="Normal"){
        var index = layer.open({
            type:1
            //skin: 'layui-layer-rim', //加上边框
            ,area: ['900', '600'] //宽高
            ,title:"賬號審核"
            ,content: $("#account")
            ,btn: ['查封']
            ,method:'GET'
            ,btnAlign: 'c'
            ,maxmin:true
            ,yes: function(index, layero){
                $.ajax({
                    type : "GET",
                    /*contentType : "application/json;charset=utf-8",*/
                    contentType : "application/x-www-form-urlencoded;charset=utf-8",
                    //contentType: "application/x-www-form-urlencoded",
                    //contentType: "application/json",
                    //dataType : "json",
                    url : "/user/query/detail/updatestatus",
                    //data:JSON.stringify(getFormData($("#storeValueForm"))),
                    data:tg,
                    error:function(request){
                        alert(2);
                    },
                    success:function(data){
                        layer.close(index);
                        location.reload();
                        //location.href="/trade/tradeDetail";
                    }
                })
                //layer.close(index);

            },
        });
    }else{
        var index = layer.open({
            type:1
            //skin: 'layui-layer-rim', //加上边框
            ,area: ['900', '600'] //宽高
            ,title:"賬號審核"
            ,content: $("#account")
            ,btn: ['解封']
            ,method:'GET'
            ,btnAlign: 'c'
            ,maxmin:true
            ,yes: function(index, layero){
                $.ajax({
                    type : "GET",
                    /*contentType : "application/json;charset=utf-8",*/
                    contentType : "application/x-www-form-urlencoded;charset=utf-8",
                    //contentType: "application/x-www-form-urlencoded",
                    //contentType: "application/json",
                    //dataType : "json",
                    url : "/user/query/detail/updatestatus",
                    //data:JSON.stringify(getFormData($("#storeValueForm"))),
                    data:btg,
                    error:function(request){
                        alert(2);
                    },
                    success:function(data){
                        layer.close(index);
                        location.reload();
                        //location.href="/trade/tradeDetail";
                    }
                })
                //layer.close(index);

            },
        });
    }

    $("#closePage").click(function(){
        //closePage();
        layer.close(index);
    })
    //})
}
function score(userid){
    var index = layer.open({
        type:1
        //skin: 'layui-layer-rim', //加上边框
        ,area: ['900', '600'] //宽高
        ,title:"權重分值管理"
        ,content: $("#score")
        ,btn: ['確定', '取消']
        ,method:'GET'
        ,btnAlign: 'c'
        ,maxmin:true
        ,yes: function(index, layero){
            $.ajax({
                type : "GET",
                /*contentType : "application/json;charset=utf-8",*/
                contentType : "application/x-www-form-urlencoded;charset=utf-8",
                //contentType: "application/x-www-form-urlencoded",
                //contentType: "application/json",
                //dataType : "json",
                url : "/user/change/identityscore",
                //data:JSON.stringify(getFormData($("#storeValueForm"))),
                data:{
                    userid:userid,
                    score:$("#quan").val()
                },
                error:function(request){
                    alert(2);
                },
                success:function(data){
                    layer.close(index);
                    location.reload();
                    //location.href="/trade/tradeDetail";
                }
            })
            //layer.close(index);

        },
        btn2:function(index, layero){
            layer.close(index);
        }
    });
    $("#closePage").click(function(){
        //closePage();
        layer.close(index);
    })
    //})
}
$("#daochu").click(function () {
    var usercode = $("#userCode").val();
    var source = $("#source").val();
    var ispropertyagent = $("#ispropertyagent").val();
    var registry = $("#registry").val();
    var approvalStatus = $("#approvalStatus").val();
    var status = $("#status").val();
    var startTime = $("#date").val();
    var endTime = $("#date1").val();

   var down = {
        usercode: usercode, source: source, ispropertyagent: ispropertyagent, registry: registry,
        approvalStatus: approvalStatus, status: status, startTime: startTime, endTime: endTime
    };
    var dom=document.getElementById('ifile');
    dom.src="/user/down/excel?usercode="+usercode+"&source="+source+"&ispropertyagent="
        +ispropertyagent+"&registry="+registry
        +"&approvalStatus="+approvalStatus+"&status="
        +status+"&startTime="+startTime+"&endTime="+endTime;


})


