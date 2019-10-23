/**
 * wbqiutj
 * @returns
 */
/*window.onload=function(){
	getPage();
}*/
$(function () {
    $("#fangpan").addClass("layui-nav-itemed");
})
layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'], function(){
	
        var form = layui.form
        ,layer = layui.layer
        ,laydate = layui.laydate;
        form.render();//初始化下拉框
        
      //日期  注意：定义页面日期控件id不要重复!!!
        laydate.render({
          elem: '#beginTime'
        });
        laydate.render({
          elem: '#endTime'
        });
        laydate.render({
            elem: '#beginUpdateTime'
        });
        laydate.render({
          elem: '#endUpdateTime'
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
        	var propertyId = $("#propertyId").val();
        	var estateName = $("#estateName").val();
        	var propertySource = $("#propertySource").val();
        	var propertyStatus = $("#propertyStatus").val();
        	var isHide = $("#isHide").val();
        	var isUploadEvidence = $("#isUploadEvidence").val();
        	var isadminoffline = $("#isadminoffline").val();
        	var beginTime = $("#beginTime").val();
        	var endTime = $("#endTime").val();
        	var beginUpdateTime = $("#beginUpdateTime").val();
        	var endUpdateTime = $("#endUpdateTime").val();
        	var rentaltype = $("#rentaltype").val();
        	
        	dtt = {
        		propertyId:propertyId,
    			estateName:estateName,
    			propertySource:propertySource,
    			propertyStatus:propertyStatus,
    			isHide:isHide,
    			isUploadEvidence:isUploadEvidence,
    			isadminoffline:isadminoffline,
    			rentaltype:rentaltype,
    			beginTime:beginTime,
    			endTime:endTime,
    			beginUpdateTime:beginUpdateTime,
    			endUpdateTime:endUpdateTime
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
  		            {field: 'propertyid', title: '房源編號', width: '10%',align:'center', sort: false, totalRow: true}
  		           	,{field: 'estatename', title: '屋苑名', width: '10%',align:'center', sort: false, totalRow: true}
  		            ,{field: 'rentaltype', title: '租售', width:'10%',align:'center', sort: false}
  		            ,{field: 'propertysource', title: '盤源', width: '10%',align:'center', sort: false, totalRow: true}
  		            ,{field: 'propertystatus', title: '樓盤狀態', width:'10%',align:'center'}
  		            ,{field: 'isHide', title: '樓盤顯示狀態', width: '10%',align:'center'}
  		            ,{field: 'isadminoffline', title: '上下架狀態', width: '10%',align:'center',templet: '#switchTpl'}
  		            ,{field: 'createtime', title: '上架日期', width: '10%',align:'center', sort: false, totalRow: true}
  		            ,{field: 'updatetime', title: '更新日期', width: '10%',align:'center', sort: false, totalRow: true}
  		            ,{fixed: 'right',title: '操作', width: '10%', align:'center', toolbar: '#barDemo'}
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
  	  	    			if(data.isHide){// 0：顯示，1：隱藏
  	  	    				data.isHide = "隱藏";
  	  	    			}else{
  	  	    				data.isHide = "顯示";
  	  	    			}
  	  	    			//var c = data.createtime;//储值时间
  	  	    			data.createtime = layui.util.toDateString(data.createtime, 'yyyy-MM-dd HH:mm:ss');
  	  	    			data.updatetime = layui.util.toDateString(data.updatetime, 'yyyy-MM-dd HH:mm:ss');
  	  	    			
  	  	    			data.propertysource = data.propertysource=="1"?"業主盤":(data.propertysource == "2"?"代理盤":data.propertysource);
						data.rentaltype = data.rentaltype=="1"?"放售":(data.rentaltype == "2"?"放租":data.rentaltype);
  	  	    			data.propertystatus = data.propertystatus=="0"?"封盤":(data.propertystatus=="1"?"待售/租":(data.propertystatus == "3"?"已售/租":data.propertystatus));
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
  	    		/*if(res != null){
  	    			if(null != res.msg && null != res.msg.message ){
  	    				layer.msg(res.msg.message);
  	    				return;
  	    			}
  	    			layer.msg(res.msg,{time: 2000});
  	    		}*/
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
            var propertyid = data.propertyid;
            var resource = $("#resource").val();
            var newWeb=window.open('_blank');
            newWeb.location='/property/propertyDetail?propertyid='+propertyid+"&resource="+resource;
            layer.msg('預覽操作');
            
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
          elem: '#imgCarousel'
          ,width: '100%' //设置容器宽度
          ,height: 300
          ,arrow: 'hover' //显示箭头
          ,anim: 'fade' //切换动画方式
        });
        
        
      //监听性别操作
        form.on('switch(upDown)', function(obj){
        	var x=obj.elem.checked;
        	var content = x == true ?"你確定要上架嗎？":"你確定要下架嗎？";
        	layer.confirm(content,{
        		btn: ['确定','取消'],
        		icon: 3,
        		title:'提示',
        		yes:function(index){
        			/*上架功能隱藏
        			 * if(!obj.elem.checked){
        				//obj.othis.removeClass("layui-form-onswitch");
        				obj.elem.disabled = "disabled";
                  		obj.othis.addClass("layui-disabled");
                  		obj.othis.addClass("layui-checkbox-disbaled");
        			}*/
        			obj.elem.checked=x;
        			form.render();
            		layer.close(index);
            		var propertyId = obj.elem.getAttribute("tag");
            		$.ajax({
            			type : "POST",
            			contentType : "application/json;charset=utf-8",
            			dataType : "json",
            			url : "/property/upOrDownProperty?propertyid="+propertyId+"&isadminoffline="+!x,
            			error:function(request){
            				
            			},
            			success:function(data){
            				if(data != null ){
            					layer.msg(data.message,{time:3000});
    							/*if(true == data.success){
    								layer.msg("操作成功",{time:3000});
    							}else{
    								layer.msg(data.message,{time:3000});
    							}*/
    						}
            			}
            		})
        		},
        		btn2:function(){
        			obj.elem.checked=!x;
        			form.render();
        			/* 上架功能隱藏
        			 * if(!obj.elem.checked){
        				obj.elem.checked = 'true';
        				obj.othis.addClass("layui-form-onswitch");
        			}*/
        			
        		}
        	});
        	
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
				console.log(dt);
				$.ajax({
					type : "POST",
					contentType : "application/x-www-form-urlencoded;charset=utf-8",
					url : "/trade/storeValue",
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
	        	
	        },
	        btn2:function(index, layero){
	        	
	        }
	      });
		$("#closePage").click(function(){
			layer.close(index);
		})
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
