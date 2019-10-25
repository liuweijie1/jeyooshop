/**
 * wbliywj
 * @returns
 */
/*window.onload=function(){
	getPage();
}*/
$(function () {
    $("#lay-report").addClass("layui-this");
})
layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'], function(){
	
        var form = layui.form
        ,layer = layui.layer
        ,laydate = layui.laydate;
        form.render();//初始化下拉框
        

        //日期  注意：定义页面日期控件id不要重复!!!
      var startTime=  laydate.render({
            elem: '#startTime',
          btns:['clear','confirm'],
          max: new Date().toLocaleDateString(),
          done: function(value, date, endDate) {
                if(value!=''){
                	endTime.config.min = {
                        year: date.year,
                        month: date.month - 1,
                        date: date.date
                    }; //重置结束日期最小值
                } else{
                	endTime.config.min = startTime.config.min
                }

          }
        });
       var endTime =  laydate.render({
            elem: '#endTime',
            max: new Date().toLocaleDateString(),
            done: function(value, date, endDate) {
                if(value!=''){
                	startTime.config.max = {
                        year: date.year,
                        month: date.month - 1,
                        date: date.date
                    }; //重置开始日期最大值
                }else{
                	startTime.config.max = endTime.config.max
                }

            }
        });

     
        var laypage = layui.laypage //分页
        ,layer = layui.layer //弹层
        ,table = layui.table //表格
        ,carousel = layui.carousel //轮播
        ,upload = layui.upload //上传
        ,element = layui.element //元素操作
        ,slider = layui.slider //滑块
        
        var dtt={};// 搜索条件
        
       /*  //监听Tab切换
        element.on('tab(demo)', function(data){
          layer.tips('切换了 '+ data.index +'：'+ this.innerHTML, this, {
            tips: 1
          });
        }); */
        
        res(dtt);// 页面加载的时候渲染
        
        $("#searchBtn").click(function(){
    		//closePage();
        	var propertyID = $("#propertyID").val().trim();
        	var startTime = $("#startTime").val();
        	var endTime = $("#endTime").val();
        	var source = $('#source option:selected').val();
        	dtt = {propertyID:propertyID,startTime:startTime,endTime:endTime,source:source};
    		res(dtt);
    	})
    	// table渲染
        function res (dtt){
        	//执行一个 table 实例
        	table.render({
  	          elem: '#propertyreport'
  	          ,height: 475
  	          ,url: '/propertyreportmanage/getPage' //数据接口
  	          ,title: '檢舉表'
  	          ,page: false //开启分页
  	          ,totalRow: false //开启合计行
  	          ,limit:10
  	          ,where: dtt
  	          ,method:'GET'
  	          ,cols: [[  //表头
	            //{type: 'checkbox', fixed: 'left'}
		            //{field: 'reportid', title: '序號', width:'60', sort: false}
		            {field: 'propertyid', title: '樓盤編號',align:'center', width:'10%',templet: function(d){ return d.propertyid==''||d.propertyid==null?'/':d.propertyid}}
		            ,{field: 'name', title: '聯絡人', width:'10%',align:'center', sort: false,templet: function(d){ return d.name==''||d.name==null?'/':d.name}}
		            ,{field: 'telephone', title: '联络人電話', width:'15%',align:'center', sort: false,templet: function(d){ return d.telephone==''||d.telephone==null?'/':d.telephone}}
		            ,{field: 'email', title: '聯絡人電郵', width:'20%',align:'center', sort: false,templet: function(d){ return d.email==''||d.email==null?'/':d.email}}
		            ,{field: 'content', title: '檢舉內容', width:'25%',align:'center', sort: false,templet: function(d){ return d.content==''||d.content==null?'/':d.content}}
		            ,{field: 'createtime', title: '檢舉時間', width: '20%',align:'center', sort: false, totalRow: true}
		           
		            //,{fixed: 'right',title: '操作', width: 165, align:'center', toolbar: '#barDemo'}
              ]]
  			,page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
  				layout: ['count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
  				//,curr: 5 //设定初始在第 5 页
  				,groups: 5 //只显示 1 个连续页码
  				,first: '首页' //不显示首页
  				,last: '尾页' //不显示尾页
  				,elem:'bottomPage'
  			} 
  	    	,parseData: function(res, curr, count) {
                    if (res != null && res.data != null) {
                        for (var i = 0; i < res.data.length; i++) {
                            var data = res.data[i];
                            if(data.createtime==''||data.createtime==null){
                            	data.createtime='/';
                            }/*else{
                                data.createtime = layui.util.toDateString(data.createtime, 'yyyy/MM/dd HH:mm:ss');
                            }*/
                        }
                    }
                }
  	    	,response: {
  	    	    statusName: 'code' //规定数据状态的字段名称，默认：code
  	    	    ,statusCode: 0 //规定成功的状态码，默认：0
  	    	    ,msgName: 'hint' //规定状态信息的字段名称，默认：msg
  	    	    ,countName: 'count' //规定数据总数的字段名称，默认：count
  	    	    ,dataName: 'data' //规定数据列表的字段名称，默认：data
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
            layer.msg('查看操作');
            checkOrder();
            
          } else if(layEvent === 'del'){
            layer.confirm('真的删除行么', function(index){
              obj.del(); //删除对应行（tr）的DOM结构
              layer.close(index);
              //向服务端发送删除指令
            });
          } else if(layEvent === 'edit'){
            layer.msg('编辑操作');
          }
        });
        
         //执行一个轮播实例
        carousel.render({
          elem: '#test1'
          ,width: '100%' //设置容器宽度
          ,height: 200
          ,arrow: 'none' //不显示箭头
          ,anim: 'fade' //切换动画方式
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
function checkOrder(){
	var index = layer.open({
        type:1,
        //skin: 'layui-layer-rim', //加上边框
        area: ['80%', '80%'] //宽高
        ,content: $('#test')
        ,btn: ['继续弹出', '关闭']
		,btnAlign: 'c'
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
//導出
$("#daochu").click(function () {
	var propertyID = $("#propertyID").val();
	var startTime = $("#startTime").val();
	var endTime = $("#endTime").val();
	var source = $('#source option:selected').val();
    var dom=document.getElementById('ifile');
    dom.src="/propertyreportmanage/downexcel?propertyID="+propertyID+"&source="+source+"&startTime="+startTime+"&endTime="+endTime;


})

