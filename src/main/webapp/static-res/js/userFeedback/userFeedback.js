/*window.onload=function(){
	getPage();
}*/
$(function () {
    $("#lay-msg").addClass("layui-this");
})
layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'], function () {

    var form = layui.form
        , layer = layui.layer
        , laydate = layui.laydate
        , laypage = layui.laypage //分页
        , layer = layui.layer //弹层
        , table = layui.table //表格
    form.render();//初始化下拉框


    //日期  注意：定义页面日期控件id不要重复!!!
   var date1= laydate.render({
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
            }else{
                date2.config.min = date1.config.min
            }

       }
    });
  var date2=  laydate.render({
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




    var dtt = {};// 搜索条件

    res(dtt);// 页面加载的时候渲染

    $("#search").click(function () {
        var source = $("#source").val();
        var startTime = $("#date").val();
        var endTime = $("#date1").val();

        dtt = {
            source: source,
            startTime: startTime,
            endTime: endTime
        };
        res(dtt);
    })
    //执行一个 table 实例

    function res(dtt) {
        table.render({
            elem: '#demo'
            , url: '/msg/userfeedback/query' //数据接口
            , method: 'GET'
            , title: '留言反饋表'//定义 table 的大标题（在文件导出等地方会用到）
            , page: false //开启分页
            , totalRow: false //开启合计行
            , limit: 15
            , where: dtt
            , cols: [[ //表头
                //{type: 'checkbox', fixed: 'left'}
                  {field: 'source', title: '留言來源',align:'center', width: '12%'}
                , {field: 'email', title: '留言郵箱',align:'center', width: '13%', sort: false}
                , {field: 'content', title: '留言內容',align:'center', width: '60%', sort: false}
                , {field: 'createtime', title: '留言時間',align:'center', width: '15%', sort: false, totalRow: true}
            ]]
            , page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
                layout: ['count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
                //,curr: 5 //设定初始在第 5 页
                , groups: 5 //只显示 1 个连续页码
                , first: '首页' //不显示首页
                , last: '尾页' //不显示尾页
                , elem: 'bottomPage'
            }
            , response: {
                statusName: 'code' //规定数据状态的字段名称，默认：code
                , statusCode: 0 //规定成功的状态码，默认：0
                , msgName: 'hint' //规定状态信息的字段名称，默认：msg
                , countName: 'count' //规定数据总数的字段名称，默认：count
                , dataName: 'data' //规定数据列表的字段名称，默认：data
            }
        });
    }


});


$("#daochu").click(function () {
    var usercode = $("#usercode").val();
    var source = $("#source").val();
    var startTime = $("#date").val();
    var endTime = $("#date1").val();

    var dom=document.getElementById('ifile');
    dom.src="/msg/down/excel?usercode="+usercode+"&source="+source+"&startTime="+startTime+"&endTime="+endTime;


})

