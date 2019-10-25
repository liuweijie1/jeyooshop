/*window.onload=function(){
	getPage();
}*/
$(function () {
    $("#lay-user").addClass("layui-this");
})
layui.use(['laydate',  'layer', 'table'], function () {

    var form = layui.form
        , layer = layui.layer
        , laydate = layui.laydate;
    form.render();//初始化下拉框


    //日期  注意：定义页面日期控件id不要重复!!!
  var date1=  laydate.render({
        elem: '#date',
      btns:['clear','confirm'],
      max: new Date().toLocaleDateString(),
      done: function(value, date, endDate) {
            if(value!=''){
                date2.config.min = {
                    year: date.year,
                    month: date.month - 1,
                    date: date.date
                }; //重置结束日期最小值
            } else{
                date2.config.min = date1.config.min
            }

      }
    });
   var date2 =  laydate.render({
        elem: '#date1',
        max: new Date().toLocaleDateString(),
        done: function(value, date, endDate) {
            if(value!=''){
                date1.config.max = {
                    year: date.year,
                    month: date.month - 1,
                    date: date.date
                }; //重置开始日期最大值
            }else{
                date1.config.max = date2.config.max
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
        var usercode = $("#userCode").val().trim();
        usercode = usercode.replace(/%/g,'/%').replace(/_/g,'/_');
        var source = $("#source").val();
        var ispropertyagent = $("#ispropertyagent").val();
        var registry = $("#registry").val();
        var approvalStatus = $("#approvalStatus").val();
        var status = $("#status").val();
        var email = $("#email").val();
        var startTime = $("#date").val();
        var endTime = $("#date1").val();

        dtt = {
            usercode: usercode, source: source, ispropertyagent: ispropertyagent, registry: registry,
            approvalStatus: approvalStatus, status: status,email:email, startTime: startTime, endTime: endTime
        };
        res(dtt);
    })
    //执行一个 table 实例
    function res(dtt) {
        table.render({
            elem: '#demo'
            , url: '/user/query/data' //数据接口
            , method: 'GET'
            , title: '用戶表'//定义 table 的大标题（在文件导出等地方会用到）
            , page: false //开启分页
            , totalRow: false //开启合计行
            , limit: 15
            , where: dtt
            , cols: [[ //表头
                //{type: 'checkbox', fixed: 'left'}
                  {field: 'usercode', title: '會員編號',align: 'center', width: '8%'}
                , {field: 'createtime', title: '註冊時間',align: 'center', width: '14%', sort: false, totalRow: true}
                , {field: 'email', title: '註冊電郵',align: 'center', width: '18%', sort: false}
                , {field: 'telephone', title: '註冊電話',align: 'center', width: '10%', sort: false, totalRow: true}
               // , {field: 'registerSource', title: '註冊方式', align: 'center',width: '8%'}
                , {field: 'ispropertyagent', title: '會員類型',align: 'center', width: '8%'}
                , {field: 'companynamecn', title: '所屬公司',align: 'center', width: '20%'}
                , {field: 'source', title: '註冊渠道',align: 'center', width: '8%'}
                , {field: 'identityscore', title: '權重分值',align: 'center', width: '8%'}
                , {field: 'approvalStatus', title: '會員資料審核狀態', align: 'center',width: '13%', sort: false, totalRow: true}
                , {field: 'status', title: '賬戶狀態', align: 'center',width: '8%', sort: false, totalRow: true}
                , {fixed: 'right', title: '操作',align: 'center', width: '12%', align: 'center', toolbar: '#barDemo'}

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
                        if(data.source=="PC"){
                            data.source = "Web";
                        }else if(data.source=="Android"||data.source=="IOS"){
                            data.source="App"
                        }
                        if(data.companynamecn==null||data.companynamecn==""){
                            data.companynamecn = "/";
                        }
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
                            data.approvalStatus = "未審核"
                        }
                        if (data.status == "Normal") {
                            data.status = "正常"
                        }else if (data.status =="Disable") {
                            data.status = "停用"
                        }
                        if(data.createtime==null){
                            data.createtime="/"
                        }



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
        } else if (layEvent === 'edit') {
            var userid = datamanage.userid;
            var newWeb=window.open('_blank');
            newWeb.location= '/user/query/detailindex?userid='+userid;

        }
    });

    // 用户解决工具栏按钮过多 显示不全 弹出点击layevent没反应的方案
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
var flag =true;
function manage(datamanage) {
    var userid = datamanage.userid;
    var email = datamanage.email;
    var statusB=datamanage.status;
    var inde = layer.open({
        type:1
        //skin: 'layui-layer-rim', //加上边框
        ,area: ['900', '600'] //宽高
        ,title:" "
        ,content: $("#money")
        ,btn: ['儲值', '取消']
        ,btnAlign: 'c'
        //,maxmin:true
        ,yes: function(index, layero){
            if($("#moneytype").val()===''){
                layer.msg("請選擇充值事項")
                return
            }
            if($("#propertycoinnumber").val()==''){
                layer.msg("請輸入金幣數量")
                return
            }
            if(statusB!="正常") {
                layer.msg("賬戶已停用，不能充值")
                return
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
                        url : "/user/propertycoin/recharge",
                       // async:false,
                        data:{
                            userid:userid,
                            number:$("#propertycoinnumber").val(),
                            itemName:$("#moneytype").val()
                        },
                        error:function(request){
                            flag = true;
                            alert("失敗了");
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
                                layer.msg("出錯了")
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
            $("#emaillabel").html(email);
        },
        end:function(){

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
var uflag=true;
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
        layer.msg("賬號已通過，不能再次審核")
    }
    else if (status=="NotPassApproval"){
        layer.msg("賬號未通過，不能再次審核")
    } else if (status=="UnderApproval"){
        var content = "<div  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;是否通過審核?</div>";
        layer.confirm(content,{
            btn: ['通過','不通過'],
            icon: 3,
            title:'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;會員資料審核',
         //   area: ['380px', '200px'],
            btnAlign: 'c' ,//按钮居中
            yes:function(index){
                layer.close(index);
               // var propertyId = obj.elem.getAttribute("tag");
                if(!uflag){
                    return false;
                }
                uflag=false;
                $.ajax({
                    type : "GET",
                    contentType : "application/x-www-form-urlencoded;charset=utf-8",
                    url : "/user/query/check/approval",
                    data:tg,
                    error:function(request){
                        alert("失敗了");
                        uflag=true;
                    },
                    success:function(data){
                        if(data.msg=="success"){
                            layer.close(index);
                            location.reload();
                        }
                        else if(data.msg=="error"){
                            alert("失敗了");
                        }
                        uflag=true;
                    }
                })
            },
            btn2:function(index, layero){
                $.ajax({
                    type : "GET",
                    contentType : "application/x-www-form-urlencoded;charset=utf-8",
                    url : "/user/query/check/approval",
                    data:btg,
                    error:function(request){
                        alert("失敗了");
                    },
                    success:function(data){
                        if(data.msg=="success"){
                            layer.close(index);
                            location.reload();
                        }
                        else if(data.msg=="error"){
                            alert("失敗了");
                        }
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
        layer.confirm('<div  style="text-align:center;">是否停用?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>',{
            btn: ['確定','取消'],
            icon: 3,
            title:'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;賬號管理',
            btnAlign: 'c' ,//按钮居中
            yes:function(index){
                layer.close(index);
                $.ajax({
                    type : "GET",
                    contentType : "application/x-www-form-urlencoded;charset=utf-8",
                    url : "/user/query/detail/updatestatus",
                    data:tg,
                    error:function(request){
                        alert("失敗了");
                    },
                    success:function(data){
                        if(data.msg=="success"){
                            layer.close(index);
                            location.reload();
                        }
                        else if(data.msg=="error"){
                            alert("失敗了");
                        }
                    }
                })
            },
            btn2:function(index, layero){
                layer.close(index);

            }
        });

    }else if (status=="Disable"){
        layer.confirm('<div  style="text-align:center;">是否解封?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>',{
            btn: ['確定','取消'],
            icon: 3,
            title:'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;賬號管理',
            btnAlign: 'c' ,//按钮居中
            yes:function(index){
                layer.close(index);
                $.ajax({
                    type : "GET",
                    contentType : "application/x-www-form-urlencoded;charset=utf-8",
                    url : "/user/query/detail/updatestatus",
                    data:btg,
                    error:function(request){
                        alert("失敗了");
                    },
                    success:function(data){
                        if(data.msg=="success"){
                            layer.close(index);
                            location.reload();
                        }
                        else if(data.msg=="error"){
                            alert("失敗了");
                        }
                    }
                })
            },
            btn2:function(index, layero){
                layer.close(index);

            }
        });
    } else if(status=="PendingCheck"){
        layer.msg("待驗證狀態")
    }

    $("#closePage").click(function(){
        //closePage();
        layer.close(index);
    })
    //})
}
var vflag=true;
function score(userid){
    var index = layer.open({
        type:1
        //skin: 'layui-layer-rim', //加上边框
        ,area: ['900', '600'] //宽高
        ,title:"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;權重分值管理"
        ,content: $("#score")
        ,btn: ['確定', '取消']
        ,method:'GET'
        ,btnAlign: 'c'
       // ,maxmin:true
        ,yes: function(index, layero){
            if($("#quan").val()===''){
                layer.msg("請輸入權重分值")
                return;
            }
            if(!vflag){
                return false;
            }
            vflag=false;
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
                    alert("失敗了");
                    vflag=true;
                },
                success:function(data){
                    if(data.msg=="success"){
                        layer.close(index);
                        location.reload();
                    }
                    else if(data.msg=="error"){
                        alert("失敗了");
                    }
                    vflag=true;
                }
            })

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



