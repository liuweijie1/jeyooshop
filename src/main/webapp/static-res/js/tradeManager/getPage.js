/**
 * wbqiutj
 * @returns
 */
/*window.onload=function(){
	getPage();
}*/
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
            elem: '#beginEvidenceTime'
        });
        laydate.render({
          elem: '#endEvidenceTime'
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
        	var orderIdOrUserId = $("#orderIdOrUserId").val();
        	var orderstatus = $("#orderstatus").val();
        	var paymenttype = $("#paymenttype").val();
        	
        	var isUploadEvidence = $("#isUploadEvidence").val();
        	var propertycoin = false;
        	if($("#propertycoin").is(':checked')){
        		propertycoin = true;
        	}
        	
        	var beginTime = $("#beginTime").val();
        	var endTime = $("#endTime").val();
        	
        	var beginEvidenceTime = $("#beginEvidenceTime").val();
        	var endEvidenceTime = $("#endEvidenceTime").val();
        	
        	dtt = {
        		orderIdOrUserId:orderIdOrUserId,
        		orderstatus:orderstatus,
        		paymenttype:paymenttype,
        		isUploadEvidence:isUploadEvidence,
        		propertycoin:propertycoin,
        		beginTime:beginTime,
        		endTime:endTime,
        		beginEvidenceTime:beginEvidenceTime,
        		endEvidenceTime:endEvidenceTime
        	};
    		res(dtt);
    	})
    	// table渲染
        function res (dtt){
        	//执行一个 table 实例
        	table.render({
  	          elem: '#demo'
  	          ,height: 475
  	          ,url: '/trade/getPage' //数据接口
  	          ,title: '用户表'
  	          ,page: false //开启分页
  	          ,totalRow: false //开启合计行
  	          ,limit:10
  	          ,where: dtt
  	          ,method:'POST'
  	          ,cols: [[ //表头
  	            //{type: 'checkbox', fixed: 'left'}
  		            {field: 'usercode', title: '會員編號',align: 'center', width:'7%'}
  		           	,{field: 'orderid', title: '訂單編號',align: 'center', width: '8%', sort: false, totalRow: true}
  		            ,{field: 'item', title: '交易事項',align: 'center', width:'8%', sort: false}
  		            ,{field: 'accountid', title: '付款來源',align: 'center', width:'7%', sort: false}
  		            ,{field: 'orderstatus', title: '付款狀態',align: 'center', width: '7%', sort: false, totalRow: true}
  		            ,{field: 'paymenttype', title: '付款方式',align: 'center', width:'7%'}
  		            ,{field: 'money', title: '交易金額', align: 'center',width: '7%'}
  		            ,{field: 'isUploadEvidence', title: '是否上傳憑證',align: 'center', width: '8%', sort: false, totalRow: true}
  		            ,{field: 'evidenceTime', title: '上傳憑證時間',align: 'center', width: '12%', sort: false, totalRow: true}
  		            ,{field: 'propertycoin', title: '儲值數量',align: 'center', width: '7%', sort: false, totalRow: true}
  		            ,{field: 'createtime', title: '儲值時間',align: 'center', width: '12%', sort: false, totalRow: true}
  		            ,{fixed: 'right',title: '操作',align: 'center', width: '10%', align:'center', toolbar: '#barDemo'}
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
  	  	    			data.isUploadEvidence = data.isUploadEvidence==true?"已上传":"未上传";
  	  	    			data.orderstatus = data.orderstatus=="1"?"已付款":"未付款";
  	  	    			//var c = data.createtime;//储值时间
  	  	    			data.createtime = layui.util.toDateString(data.createtime, 'yyyy-MM-dd HH:mm:ss');
  	  	    			data.evidenceTime = layui.util.toDateString(data.evidenceTime, 'yyyy-MM-dd HH:mm:ss');
  	  	    			
  	  	    			data.paymenttype = data.paymenttype=="1"?"銀行轉賬":(data.paymenttype == "0"?"信用卡":"");
  	  	    			data.accountid = data.accountid=="0"?"普通會員":"代理公司";
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
            layer.msg('查看操作');
            var orderid = data.orderid;
            var newWeb=window.open('_blank');
            newWeb.location='/trade/tradeDetail?orderid='+orderid;
            
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
        nonEditable();
        $("#uploadEvidence").click(function(){
    		
    	})
      //多图片上传
       upload.render({
          elem: '#uploadEvidence'
          ,url: '/file/uploads'
          ,multiple: true
          //,auto: false
          //,bindAction: '#uploadEvidences'
          ,before: function(obj){
            //预读本地文件示例，不支持ie8
            obj.preview(function(index, file, result){
              $('#uploadEvidenceList').append('<img style="width:200px;height:100px;padding:5px 10px;" src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">')
            });
          }
          ,done: function(res){
            //上传完毕
        	  if(res.code==0){
        		  layer.msg("上傳成功");
        	  }
          }
          ,choose: function(obj){ 
        	 // var files = this.files = obj.pushFile();
        	//预读本地文件示例，不支持ie8
              /*obj.preview(function(index, file, result){
                $('#uploadEvidenceList').append('<img style="width:200px;height:100px;padding:5px 10px;" src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">')
              });*/
          } 
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
				$.ajax({
					type : "POST",
					contentType : "application/x-www-form-urlencoded;charset=utf-8",
					url : "/trade/storeValue",
					data:dt,
					error:function(request){
						layer.msg("服務器異常.......");
					},
					success:function(data){
						if(data != null ){
							layer.msg(data.message,{time:1000});
							
							layer.close(index);
							setTimeout(function(){
								location.reload();
							}, 1000);
							if(data.success){
								//window.opener.location.reload();
								//刷新打開當前頁面的窗口
								window.opener.location.href=window.opener.location.href;
							}
						}
						
					}
				})
	        	
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
function uploadFileBtn(){
	var index = layer.open({
        type:1
        //skin: 'layui-layer-rim', //加上边框
        ,area: ['1000', '800'] //宽高
		,title:"上傳憑證"
        ,content: $("#uploadFileDetail")
        ,btn: ['上傳', '关闭']
		,method:'GET'
		,btnAlign: 'c'
		,maxmin:true
		,yes: function(index, layero){
			var dt = {
					orderid:$("input[name='orderid']").val()
			}
			$.ajax({
				type : "POST",
				contentType : "application/x-www-form-urlencoded;charset=utf-8",
				url : "",
				data:dt,
				error:function(request){
					layer.msg("服務器異常.......");
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
}
