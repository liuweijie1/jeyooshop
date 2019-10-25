$(function () {
    $("#lay-propertycoin").addClass("layui-this");
})
layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'], function () {

    var form = layui.form
        , layer = layui.layer
        , laydate = layui.laydate;
    form.render();//初始化下拉框
    $.ajax({
        type: "POST",
        dataType: "json",
        url: "/propertycoin/initselect",
        success: function (result) {
            if (result == null) {
                $("#item").append("<option value=''>請選擇储值事项</option>");//为Select追加一个Option
            }
            else {
                var g = $("#item");
                var str = "<option value=''>請選擇储值事项</option>";
                g.append(str)
                for (var i = 0; i < result.length; i++) {
                    g.append("<option value=" + result[i].ItemName + ">" + result[i].UsageItem + "</option>")
                }
                form.render('select');//select是固定写法 不是选择器
            }
        }
    });

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
        var email = $("#email").val().trim();
        var companyname = $("#companyname").val();
        var account = $("#account").val();
        var item = $("#item").val();
        var startTime = $("#date").val();
        var endTime = $("#date1").val();

        dtt = {
            email: email, companyname: companyname, account: account, item: item,
            startTime: startTime, endTime: endTime
        };
        res(dtt);
    })


    //执行一个 table 实例

    function res(dtt) {
        table.render({
            elem: '#demo'
            , url: '/propertycoin/coin/list' //数据接口
            , method: 'POST'
            , title: ''//定义 table 的大标题（在文件导出等地方会用到）
            , page: false //开启分页
            , totalRow: false //开启合计行
            , limit: 15
            , where: dtt
            , cols: [[ //表头
                //{type: 'checkbox', fixed: 'left'}

                {field: 'UserID', title: '賬戶類型',align: 'center', width: '10%'}
                , {field: 'Account', title: '儲值賬戶',align: 'center', width: '35%', sort: false, totalRow: true}
                , {field: 'UsageItem', title: '儲值事項',align: 'center', width: '20%', sort: false}
                , {field: 'PropertyCoin', title: '儲值數量',align: 'center', width: '15%', sort: false, totalRow: true}
                , {field: 'CreateTime', title: '儲值時間',align: 'center', width: '20%'}

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
                        if(data.UserID>0){
                            data.UserID = "普通會員";
                        }else {
                            data.UserID="PMS"
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

    /*  //监听头工具栏事件
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
  */
    //监听行工具事件
    table.on('tool(test)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
        var datamanage = obj.data //获得当前行数据
            , layEvent = obj.event; //获得 lay-event 对应的值
        if (layEvent === 'recharge') {
            manage(datamanage);
        } else if (layEvent === 'edit') {
            var userid = datamanage.userid;
            var newWeb=window.open('_blank');
            newWeb.location= '/user/query/detailindex?userid='+userid;

        }
    });



});



