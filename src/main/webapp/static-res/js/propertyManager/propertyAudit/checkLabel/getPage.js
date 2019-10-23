$(function () {
    $("#fangpan").addClass("layui-nav-itemed");
    $("#audit").addClass("layui-nav-itemed");
})
layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'], function(){

    var form = layui.form
        ,layer = layui.layer
        ,laydate = layui.laydate;
    form.render();//初始化下拉框

    //日期  注意：定义页面日期控件id不要重复!!!
    laydate.render({
        elem: '#startTime'
    });
    laydate.render({
        elem: '#endTime'
    });

    var laypage = layui.laypage //分页
        ,layer = layui.layer //弹层
        ,table = layui.table //表格
        ,carousel = layui.carousel //轮播
        ,upload = layui.upload //上传
        ,element = layui.element //元素操作
        ,slider = layui.slider //滑块

    var dtt={};// 搜索条件

    res(dtt);// 页面加载的时候渲染

    $("#searchBtn").click(function(){
        //closePage();
        var propertyid = $("#propertyid").val();
        var propertySource = $("#propertytype").val();
        var isverifylabel = $("#isverifylabel").val();
        var startTime = $("#startTime").val();
        var endTime = $("#endTime").val();

        dtt = {
            propertyid:propertyid,
            propertysource:propertySource,
            isverifylabel:isverifylabel,
            startTime:startTime,
            endTime:endTime
        };
        res(dtt);
    })
    // table渲染
    function res (dtt){
        //执行一个 table 实例
        table.render({
            elem: '#demo'
            ,height: 475
            ,url: '/property/audit/getpage' //数据接口
            ,title: '用户表'
            ,page: false //开启分页
            ,totalRow: false //开启合计行
            ,limit:10
            ,where: dtt
            ,method:'GET'
            ,cols: [[ //表头
                //{type: 'checkbox', fixed: 'left'}
                 {field: 'propertyid', title: '房源ID', width: '10%',align:'center', sort: false, totalRow: true}
                ,{field: 'estatename', title: '屋苑名', width: '25%',align:'center', sort: false, totalRow: true}
                ,{field: 'rentaltype', title: '租售', width:'10%',align:'center', sort: false}
                ,{field: 'propertysource', title: '盤源', width: '10%',align:'center', sort: false, totalRow: true}
                ,{field: 'isverifylabel', title: '驗證標籤審核', width:'10%',align:'center'}
                ,{field: 'publictime', title: '放盤日期', width: '20%',align:'center', sort: false, totalRow: true}
                ,{fixed: 'right',title: '操作', width: '15%', align:'center', toolbar: '#barDemo'}
            ]]
            ,page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
                layout: ['count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
                //,curr: 5 //设定初始在第 5 页
                ,groups: 5 //只显示 1 个连续页码
                ,first: '首页' //不显示首页
                ,last: '尾页' //不显示尾页
                ,elem:'bottomPage'
            }
            ,parseData: function(res, curr, count){
                if(res !=null && res.data !=null){
                    for (var i = 0; i < res.data.length; i++) {
                        var data = res.data[i];
                        data.publictime = layui.util.toDateString(data.publictime, 'yyyy-MM-dd HH:mm:ss');
                        if(data.propertysource == 2 ){
                            data.propertysource = "代理盤";
                        }else if(data.propertysource == 1 ){
                            data.propertysource = "業主盤";
                        }
                        if(data.isverifylabel==true){
                            data.isverifylabel = "已通過";
                        }else{
                            data.isverifylabel = "未通過";
                        }
                        if(data.rentaltype==1){
                            data.rentaltype = "出租";
                        }else  if (data.rentaltype==2){
                            data.rentaltype = "出售";
                        }

                    }
                }
            }
            ,response: {
                statusName: 'code' //规定数据状态的字段名称，默认：code
                ,statusCode: 0 //规定成功的状态码，默认：0
                ,msgName: 'msg' //规定状态信息的字段名称，默认：msg
                ,countName: 'count' //规定数据总数的字段名称，默认：count
                ,dataName: 'data' //规定数据列表的字段名称，默认：data
            }
            ,done: function(res, curr, count){

            }

        });

    }
    //监听头工具栏事件
    table.on('toolbar(test)', function(obj){
        var checkStatus = table.checkStatus(obj.config.id)
            ,data = checkStatus.data; //获取选中的数据
        switch(obj.event){
            case 'add':
                layer.msg('添加');
                break;
            case 'update':
                if(data.length === 0){
                    layer.msg('请选择一行');
                } else if(data.length > 1){
                    layer.msg('只能同时编辑一个');
                } else {
                    layer.alert('编辑 [id]：'+ checkStatus.data[0].id);
                }
                break;
            case 'delete':
                if(data.length === 0){
                    layer.msg('请选择一行');
                } else {
                    layer.msg('删除');
                }
                break;
        };
    });

    //监听行工具事件
    table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
        var data = obj.data //获得当前行数据
            ,layEvent = obj.event; //获得 lay-event 对应的值
        if(layEvent === 'detail'){
            layer.msg('預覽操作');

        } else if(layEvent === 'del'){
            layer.confirm('真的删除行么', function(index){
                obj.del(); //删除对应行（tr）的DOM结构
                layer.close(index);
                //向服务端发送删除指令
            });
        } else if(layEvent === 'edit'){
            var propertyid = data.propertyid;
            var newWeb=window.open('_blank');
            newWeb.location='/property/audit/detail?propertyid='+propertyid;
        }
    });

    //执行一个轮播实例
    carousel.render({
        elem: '#imgCarousel'
        ,width: '100%' //设置容器宽度
        ,height: 300
        ,arrow: 'hover' //显示箭头
        ,anim: 'fade' //切换动画方式
    });

    nonEditable();

});
// 查看  弹窗
function checkOrder(){
    var index = layer.open({
        type:2,
        //skin: 'layui-layer-rim', //加上边框
        area: ['80%', '80%'] //宽高
        ,content: "/trade/tradeDetail"
        ,btn: ['继续弹出', '关闭']
        ,method:'GET'
        ,btnAlign: 'c'
        ,maxmin:true
        ,yes: function(index, layero){
            layer.close(index);

        },
        btn2:function(index, layero){

        }
    });
    $("#closePage").click(function(){
        //closePage();
        layer.close(index);
    })
}

function checkOrderDetail(url){
    $.ajax({
        type : "POST",
        contentType : "application/json;charset=utf-8",
        dataType : "text",
        url : "/trade/storeValue",
        error:function(request){
            alert(2);
        },
        success:function(data){
            alert(1);
            //location.href="/trade/tradeDetail";
        }
    })
}
//不可编辑
function nonEditable(){
    $(".checkOrder").each(function(){
        $(this).attr("readonly",true);
    })
}

function storeValueBtn(){
    //$("#storeValueBtn").click(function(){
    var index = layer.open({
        type:1
        //skin: 'layui-layer-rim', //加上边框
        ,area: ['900', '600'] //宽高
        ,title:"儲值"
        ,content: $("#storeValuePage")
        ,btn: ['儲值', '关闭']
        ,method:'GET'
        ,btnAlign: 'c'
        ,maxmin:true
        ,yes: function(index, layero){
            var dt = {
                orderid:$("input[name='orderid']").val()
            }
            //var dt = getFormData($("#storeValueForm"));
            //JSON.stringify(dt);
            console.log(dt);
            $.ajax({
                type : "POST",
                /*contentType : "application/json;charset=utf-8",*/
                contentType : "application/x-www-form-urlencoded;charset=utf-8",
                //contentType: "application/x-www-form-urlencoded",
                //contentType: "application/json",
                //dataType : "json",
                url : "/trade/storeValue",
                //data:JSON.stringify(getFormData($("#storeValueForm"))),
                data:dt,
                error:function(request){
                    alert(2);
                },
                success:function(data){
                    if(data != null ){
                        if(true == data.success){
                            layer.msg("儲值成功",{time:3000});
                        }
                    }
                    layer.close(index);
                    setTimeout(function(){
                        location.reload();
                    }, 3000);

                    //location.href="/trade/tradeDetail";
                }
            })
            //layer.close(index);

        },
        btn2:function(index, layero){

        }
    });
    $("#closePage").click(function(){
        //closePage();
        layer.close(index);
    })
    //})
}
function getFormData($form) {
    var unindexed_array = $form.serializeArray();
    var indexed_array = {};
    $.map(unindexed_array, function (n, i) {
        indexed_array[n['name']] = n['value'];
    });
    return indexed_array;
}
function imgCarousel(){
    carousel.render({
        elem: '#imgCarousel'
        ,width: '100%' //设置容器宽度
        ,arrow: 'always' //始终显示箭头
        //,anim: 'updown' //切换动画方式
    });
}


function check(isverify,propertyid){
    if (isverify==true){
        var index = layer.open({
            type:1
            //skin: 'layui-layer-rim', //加上边框
            ,area: ['400', '300'] //宽高
            ,title:"驗證標籤審核"
            ,content: $("#checkContent")
            ,btn: ['不通過']
            ,method:'GET'
            ,btnAlign: 'c'
            ,maxmin:true
            ,yes: function(index, layero){
                $.ajax({
                    type : "GET",
                    contentType : "application/x-www-form-urlencoded;charset=utf-8",
                    //contentType: "application/x-www-form-urlencoded",
                    //contentType: "application/json",
                    //dataType : "json",
                    url : "/property/audit/checklabelStatus",
                    //data:JSON.stringify(getFormData($("#storeValueForm"))),
                    data:{isverify:false,propertyid:propertyid},
                    error:function(request){
                        layer.msg("失敗了")
                    },
                    success:function(data){
                        layer.close(index);
                        location.reload();
                    }
                })

            },
        });
    }else{
        var index = layer.open({
            type:1
            //skin: 'layui-layer-rim', //加上边框
            ,area: ['400', '300'] //宽高
            ,title:"驗證標籤審核"
            ,content: $("#checkContent")
            ,btn: ['通過']
            ,method:'GET'
            ,btnAlign: 'c'
            ,maxmin:true
            ,yes: function(index, layero){
                $.ajax({
                    type : "GET",
                    contentType : "application/x-www-form-urlencoded;charset=utf-8",
                    //contentType: "application/x-www-form-urlencoded",
                    //contentType: "application/json",
                    //dataType : "json",
                    url : "/property/audit/checklabelStatus",
                    //data:JSON.stringify(getFormData($("#storeValueForm"))),
                    data:{isverify:true,propertyid:propertyid},
                    error:function(request){
                        layer.msg("失敗了")
                    },
                    success:function(data){
                        layer.close(index);
                        location.reload();
                    }
                })

            },
        });
    }
}

