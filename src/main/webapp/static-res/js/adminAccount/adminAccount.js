$(function () {
    $("#lay-admin").addClass("layui-this");
})
layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'], function () {

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
        var EmployeeNo = $("#EmployeeNo").val().trim();
        var startTime = $("#date").val();
        var endTime = $("#date1").val();

        dtt = {
            employeeNo: EmployeeNo, startTime: startTime, endTime: endTime
        };
        res(dtt);
    })


    //执行一个 table 实例

    function res(dtt) {
        table.render({
            elem: '#demo'
            , url: '/admin/accountList' //数据接口
            , method: 'POST'
            , title: ''//定义 table 的大标题（在文件导出等地方会用到）
            , page: false //开启分页
            , totalRow: false //开启合计行
            , limit: 15
            , where: dtt
            , cols: [[ //表头
                //{type: 'checkbox', fixed: 'left'}

                {field: 'employeeno', title: '賬號名稱',align: 'center', width: '34%'}
                , {field: 'createtime', title: '創建時間',align: 'center', width: '33%', sort: false, totalRow: true}
                , {fixed: 'right', title: '操作', width: '33%', align: 'center', toolbar: '#barDemo'}

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
        if (layEvent === 'edit') {
            manage(datamanage);
        } else if (layEvent === 'delete') {
            deleteAccount(datamanage);

        }
    });



});
var flag=true;
$("#insertBtn").click(function () {

   var ina =  layer.open({
        type:1
        //skin: 'layui-layer-rim', //加上边框
        ,area: ['600px', '500px'] //宽高
        ,title:" "
        ,content: $("#addAccount")
        ,btn: ['確認', '取消']
        ,btnAlign: 'c'
        //,maxmin:true
        ,yes: function(index, layero){
            var bootstrapValidator1= $("#addaccountform").data('bootstrapValidator');
           // bootstrapValidator1.resetForm();//清除当前验证的关键之处
            bootstrapValidator1.validate();//提交验证
           setTimeout(function(){
               if(!bootstrapValidator1.isValid()){
                   return;
               }
               var empno=  $("#empno").val();
               var pwd = $("#addpwd1").val();
               var cof =  layer.confirm(' <div align="center"><h3 style="margin-top: 10px">是否確認添加此賬號？</h3></div> ',{
                   btn: ['確認','取消'],
                   title:'',
                   btnAlign: 'c',
                   area:['350px','150px'],
                   yes:function () {
                       if(!flag){
                           return;
                       }
                       flag=false;
                       $.ajax({
                           type: "POST",
                           contentType: "application/x-www-form-urlencoded;charset=utf-8",
                           url: "/admin/addAccount",
                           data: {
                               employeeno: empno,
                               password: pwd,
                           },
                           error: function (request) {
                               layer.msg("失敗了");
                               flag=true;
                           },
                           success: function (data) {
                               if (data.msg == "success") {
                                   layer.close(ina)
                                   var rechargesucc = layer.confirm(' <div align="center"><h3 >賬號添加成功</h3>   <input type="button" class="layui-btn layui-btn-primary"  id="continue" onclick="continuemethod()" value="關閉"></input></div> ', {
                                       btn: [],
                                       title: '',
                                       area: ['350px', '150px']
                                   });
                               } else if(data.msg=="exist"){
                                   layer.msg("賬號名已存在")
                               }else if(data.msg=="error"){
                                   layer.msg("error")
                               }
                               flag=true;
                           }

                       })
                   }
               });

           },500)


        }
    });
});
function manage(data){
    var employeeno=  data.employeeno;
    var inde = layer.open({
         type:1
        //skin: 'layui-layer-rim', //加上边框
        ,area: ['600px', '500px'] //宽高
        ,title:" "
        ,content: $("#editAccount")
        ,btn: ['確認', '取消']
        ,btnAlign: 'c'
        //,maxmin:true
        ,yes: function(index, layero){
            var bootstrapValidator= $("#accountform").data('bootstrapValidator');
            bootstrapValidator.resetForm();//清除当前验证的关键之处
            bootstrapValidator.validate();//提交验证
            if(!bootstrapValidator.isValid()){
                return;
            }
            var cof=  layer.confirm(' <div align="center"><h3 style="margin-top: 10px">是否確認修改密碼？</h3></div> ',{
                btn: ['確認','取消'],
                title:'',
                btnAlign: 'c',
                area:['350px','150px'],
                yes:function () {
                    $.ajax({
                        type : "POST",
                        contentType : "application/x-www-form-urlencoded;charset=utf-8",
                        url : "/admin/editPassword",
                        data:{
                            employeeno:employeeno,
                            password:$("#pwd1").val(),
                        },
                        error:function(request){
                            layer.msg("失敗了");
                        },
                        success:function(data){
                            if(data.msg=="success"){
                                layer.close(inde)
                                var rechargesucc =  layer.confirm(' <div align="center"><h2 >賬號添加成功</h2>  <br> <input type="button" class="layui-btn layui-btn-primary"  id="continue" onclick="continuemethod()" value="關閉"></input></div> ',{
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
            $("#account").html(employeeno);
        },
        end:function(){

        }
    });
}
function continuemethod() {
    layer.closeAll();
    location.reload();
}
function deleteAccount(data) {
    var employeeno=  data.employeeno;
    layer.confirm('<div  style="text-align:center;">確認刪除該賬號?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>',{
        btn: ['確認','取消'],
        icon: 3,
        title:' ',
        btnAlign: 'c' ,//按钮居中
        yes:function(index){
            layer.close(index);
            $.ajax({
                type : "POST",
                contentType : "application/x-www-form-urlencoded;charset=utf-8",
                url : "/admin/deleteAccount",
                data:{empno:employeeno},
                error:function(request){
                    layer.msg("服務器出錯了");
                },
                success:function(data){
                    if(data.msg=="success"){
                        layer.close(index);
                        location.reload();
                    }
                    else if(data.msg=="error"){
                        layer.msg("刪除失敗了");
                    }
                }
            })
        },
        btn2:function(index, layero){
            layer.closeAll();

        }
    });
}


