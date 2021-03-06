/**
 * 放盤審核
 * wbqiutj
 * @returns
 */
/*window.onload=function(){
	getPage();
}*/
$(function () {
    $("#fangpan").addClass("layui-nav-itemed");
    $("#lay-release").addClass("layui-this");
})
layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'], function(){
	
        var form = layui.form
        ,layer = layui.layer
        ,laydate = layui.laydate;
        form.render();//初始化下拉框
        
        var start = laydate.render({
            elem: '#beginPublictime',
            btns:['clear','confirm'],
            isInitValue: false,
            max: new Date().toLocaleDateString(),
            done: function (value, date) {
                if(value !==''){
                    end.config.min = {
                        year: date.year,
                        month: date.month - 1,
                        date: date.date
                    }
                }else {
                    end.config.min = start.config.min
                }
            }
        });

        var end = laydate.render({
            elem: '#endPublictime',
            isInitValue: false,
            max: new Date().toLocaleDateString(),
            done: function (value, date) {
                if(value != ''){
                    start.config.max = {
                        year: date.year,
                        month: date.month - 1,
                        date: date.date
                    }
                }else {
                    start.config.max = end.config.max
                }
            }
        });
        var ustart = laydate.render({
            elem: '#beginApprovalTime',
            btns:['clear','confirm'],
            max: new Date().toLocaleDateString(),
            done: function (value, date, endDate) {
                if(value !==''){
                    uend.config.min = {
                        year: date.year,
                        month: date.month - 1,
                        date: date.date
                    }
                }else {
                    uend.config.min = ustart.config.min
                }
            }
        });
        var uend = laydate.render({
            elem: '#endApprovalTime',
            max: new Date().toLocaleDateString(),
            done: function (value, date, endDate) {
                if(value !==''){
                    ustart.config.max = {
                        year: date.year,
                        month: date.month - 1,
                        date: date.date
                    }
                }else {
                    ustart.config.max = uend.config.max
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
        	var propertyId = $("#propertyId").val().trim();
        	var propertySource = $("#propertySource").val();
        	var propertyStatus = $("#propertyStatus").val();
        	var approvalStatus = $("#approvalStatus").val();
        	var beginPublictime = $("#beginPublictime").val();
        	var endPublictime = $("#endPublictime").val();
        	var beginApprovalTime = $("#beginApprovalTime").val();
        	var endApprovalTime = $("#endApprovalTime").val();
        	var paymentstatus = $("#paymentstatus").val();
        	//是否是自建盤
        	var estateid = false;
        	if($("#estateid").is(':checked')){
        		estateid = true;
        	}
        	
        	dtt = {
        		propertyId:propertyId,
    			propertySource:propertySource,
    			propertyStatus:propertyStatus,
    			approvalStatus:approvalStatus,
    			paymentstatus:paymentstatus,
    			estateid:estateid,
    			beginPublictime:beginPublictime,
    			endPublictime:endPublictime,
    			beginApprovalTime:beginApprovalTime,
    			endApprovalTime:endApprovalTime
        	};
    		res(dtt);
    	})
    	// table渲染
        function res (dtt){
        	var resource = $("#resource").val();
        	//执行一个 table 实例
        	table.render({
  	          elem: '#demo'
  	          ,height: 475
  	          ,url: '/property/getPage?resource='+resource //数据接口
  	          ,title: '用户表'
  	          ,page: false //开启分页
  	          ,totalRow: false //开启合计行
  	          ,limit:10
  	          ,where: dtt
  	          ,method:'POST'
  	          ,cols: [[ //表头
  	            //{type: 'checkbox', fixed: 'left'}
  		            /*{field: 'userid', title: '會員編號', width:100}*/
  		            {field: 'propertyid', title: '樓盤編號', width: '12%',align:'center', sort: false, totalRow: true}
  		            ,{field: 'score', title: '權重分值', width:'12%',align:'center', sort: false}
  		            ,{field: 'rentaltype', title: '租售', width:'12%',align:'center', sort: false}
  		            ,{field: 'propertysource', title: '盤源', width: '12%',align:'center', sort: false, totalRow: true}
  		            ,{field: 'paymentstatus', title: '付款狀態', width: '12%',align:'center', sort: false, totalRow: true}
  		            ,{field: 'estateid', title: '是否是自建盤', width: '12%',align:'center', sort: false, totalRow: true}
  		            /*,{field: 'approvalstatus', title: '放盤審核狀態', width:'10%',align:'center'}*/
  		            ,{field: 'publictime', title: '放盤日期', width: '16%',align:'center', sort: false, totalRow: true}
  		           /* ,{field: 'approvalTime', title: '審核日期', width: '15%',align:'center', sort: false, totalRow: true}*/
  		            ,{fixed: 'right',title: '操作', width: '12%', align:'center', toolbar: '#barDemo'}
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
  	  	    			data.upOrDown = data.propertystatus;
  	  	    			//var c = data.createtime;//储值时间
  	  	    			//data.publictime = layui.util.toDateString(data.publictime, 'yyyy-MM-dd HH:mm:ss');
  	  	    			//data.approvalTime = layui.util.toDateString(data.approvalTime, 'yyyy-MM-dd HH:mm:ss');
  	  	    			data.propertysource =(data.accountid > 0?"PMS":data.propertysource=="1"?"業主盤":(data.propertysource == "2"?"代理盤":"/")) ;
						data.rentaltype = data.rentaltype=="2"?"放租":(data.rentaltype == "1"?"放售":"");
  	  	    			data.approvalstatus = (data.approvalstatus == "1")?"已通過":(data.approvalstatus == "-1"?"未通過":"未審核");
  	  	    			data.estateid = data.estateid == 0?"是":"否";
  	  	    			data.paymentstatus = data.paymentstatus=="1"?"已付款":"未付款";
  	  	    			data.score = data.score!= null && data.score != 0?data.score:"/";
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
          if(layEvent === 'manager'){
            var propertyid = data.propertyid;
            var resource = $("#resource").val();
            var newWeb=window.open('_blank');
            newWeb.location='/property/propertyDetail?propertyid='+propertyid+"&resource="+resource;
            //layer.msg('預覽操作');
            
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
//不可编辑
function nonEditable(){
	$(".checkOrder").each(function(){
		$(this).attr("readonly",true);
	})
}

function imgCarousel(){
	carousel.render({
        elem: '#imgCarousel'
        ,width: '100%' //设置容器宽度
        ,arrow: 'always' //始终显示箭头
        //,anim: 'updown' //切换动画方式
      });
}
