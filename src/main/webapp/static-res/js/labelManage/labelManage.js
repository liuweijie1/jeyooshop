/**
 * wbqiutj
 * @returns
 */
/*window.onload=function(){
	getPage();
}*/
$(function () {
    $("#lay-label").addClass("layui-this");
})
layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider','form'], function(){
	
        var form = layui.form
        ,layer = layui.layer
        ,laydate = layui.laydate;
       // form.render();//初始化下拉框
        
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
        	var type = $("#searchType").val().trim();
        	var labelname = $("#seachLabelname").val().trim();
        	var labelnameen = $("#seachLabelnameen").val().trim();
        	
        	dtt = {
        		labelname:labelname,
    			type:type,
    			labelnameen:labelnameen
        	};
    		res(dtt);
    	})
    	// table渲染
        function res (dtt){
        	//执行一个 table 实例
        	table.render({
  	          elem: '#demo'
  	          ,height: 500
  	          ,url: '/label/getPage' //数据接口
  	          ,title: '用户表'
  	          ,page: false //开启分页
  	          ,totalRow: false //开启合计行
  	          ,limit:10
  	          ,where: dtt
  	          ,method:'POST'
  	          ,cols: [[ //表头
  	            //{type: 'checkbox', fixed: 'left'}
  		            {field: 'type', title: '標籤詞類型',align:'center', width:'12%'}
  		            ,{field: 'sequence', title: '排序',align:'center', width: '12%', sort: false, totalRow: true}
  		            ,{field: 'labelname', title: '標籤詞中文名稱',align:'center', width: '15%', sort: false, totalRow: true}
  		            ,{field: 'labelnameen', title: '標籤詞英文名稱',align:'center', width: '15%', sort: false, totalRow: true}
  		            ,{field: 'labelurl', title: '標籤詞鏈接',align:'center', width: '15%', sort: false, totalRow: true}
  		            ,{field: 'updatetime', title: '更新時間',align:'center', width: '16%', sort: false, totalRow: true}
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
  	  	    			data.type = data.type == "rent"?"租屋":(data.type == "sale"?"二手":data.type);
  	  	    			if(null != data.updatetime){
  	  	    				//data.updatetime = layui.util.toDateString(data.updatetime, 'yyyy-MM-dd HH:mm:ss');
  	  	    			}else{
  	  	    				data.updatetime="/";
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
        
        $("#addCoinset").click(function(){
        	addCoinset();
        	form.render();
        })
        $("#addBtn").click(function(){
        	addBtn();
        	form.render();
        })
        
        //监听行工具事件
        table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
          var data = obj.data //获得当前行数据
          ,layEvent = obj.event; //获得 lay-event 对应的值
          if(layEvent === 'manage'){//管理
            //layer.msg('查看操作');
        	  labelDetail(data,form);
            
          } else if(layEvent === 'delLabel'){
            layer.confirm('是否確認刪除？',{icon: 3,title:'提示'}, function(index){
              layer.close(index);
              //向服务端发送删除指令
              delLabel(obj);
              //obj.del(); //删除对应行（tr）的DOM结构
            });
          } 
        });
});
//標籤詳情
function labelDetail(dt,form){
	$.ajax({
		type : "GET",
		contentType : "application/x-www-form-urlencoded;charset=utf-8",
		url : "/label/labelDetail?labelid="+dt.labelid,
		//data:dt,
		error:function(request){
			layer.msg("服務器異常.......");
		},
		success:function(data){
			if(data != null){
				if(data.success){
					$("#labeltype").val(data.labelManage.type);
					$("#labelname").val(data.labelManage.labelname);
					$("#labelnameen").val(data.labelManage.labelnameen);
					$("#labelurl").val(data.labelManage.labelurl);
					$("#labeltype").find("option[value='"+data.labelManage.type+"']").prop("selected",true);
					$("#sequence1").find("option[value='"+data.labelManage.sequence+"']").prop("selected",true);
					form.render();
					labelManage(data);
				}else{
					layer.msg(data.message);
				}
			}
		}
	})
}
//標籤詞彈窗
function labelManage(data){
		var index = layer.open({
	        type:1
	        //skin: 'layui-layer-rim', //加上边框
	        ,area: ['700px', '600px'] //宽高
			,title:" "
	        ,content: $("#labelManage")
	        ,btn: ['保存', '关闭']
			,method:'GET'
			,btnAlign: 'c'
			,maxmin:true
			,yes: function(index, layero){
				var type = $("#labeltype").val().trim();
				var labelname = $("#labelname").val().trim();
				var labelnameen = $("#labelnameen").val().trim();
				var labelurl = $("#labelurl").val().trim();
				var sequence = $("#sequence1").val().trim();
				if(type== null || type == "" || type == ''){
					$("#labeltype").css("border-color","red");
					layer.msg("標籤詞類型不能為空！");
					return;
				}
				if(labelname== null || labelname == "" || labelname == ''){
					$("#labelname").css("border-color","red");
					layer.msg("標籤詞中文名稱不能為空！");
					return;
				}
				if(labelnameen== null || labelnameen == "" || labelnameen == ''){
					$("#labelnameen").css("border-color","red");
					layer.msg("標籤詞中文名稱不能為空！");
					return;
				}
				if(labelurl== null || labelurl == "" || labelurl == ''){
					$("#labelurl").css("border-color","red");
					layer.msg("標籤詞鏈接不能為空！");
					return;
				}
				if(sequence== null || sequence == "" || sequence == ''){
					$("#sequence1").css("border-color","red");
					layer.msg("標籤詞排序不能為空！");
					return;
				}
				var dt = {
					 labelid:data.labelManage.labelid,
					 labelname:labelname,
					 labelnameen:labelnameen,
					 labelurl:labelurl,
					 type:type,
					 sequence:sequence
				}
				$.ajax({
					type : "POST",
					contentType : "application/x-www-form-urlencoded;charset=utf-8",
					url : "/label/updateLabel",
					data:dt,
					error:function(request){
						layer.msg("服務器異常.......");
					},
					success:function(data){
						
						if(data != null ){
							layer.msg(data.message,{time:1000});
							if(data.success){
								layer.close(index);
								setTimeout(function(){
									location.reload();
								}, 1000);
							}
							
							
						}
					}
				})
	        	
	        },
	        btn2:function(index, layero){
	        	
	        }
	      });
}
//刪除標籤詞
function delLabel(obj){
	var dt = {
			 labelid:obj.data.labelid,
			 isdelete:true
		}
	$.ajax({
		type : "POST",
		contentType : "application/x-www-form-urlencoded;charset=utf-8",
		url : "/label/updateLabel",
		dataType : "json",
		data:dt,
		error:function(request){
			layer.msg("服務器異常.......");
		},
		success:function(data){
			if(data != null ){
				layer.msg(data.message,{time:1000});
				//obj.del(); //删除对应行（tr）的DOM结构
			}
			layer.close();
			setTimeout(function(){
				location.reload();
			}, 1000);
			
			//location.href="/trade/tradeDetail";
		}
	})
}
//添加多條標籤詞
var temp = 1;
function addBtn(){
		var index = layer.open({
	        type:1
	        //skin: 'layui-layer-rim', //加上边框
	        ,area: ['1400px', '600px'] //宽高
			,title:" "
	        ,content: $("#storeValuePage")
	        ,btn: ['保存', '关闭']
			,method:'GET'
			,btnAlign: 'c'
			,maxmin:true
			,yes: function(index, layero){
				var trs = $(".coinsetTr");
				var coinsets = new Array();
				for (var i = 0; i < trs.length; i++) {
					var $input = trs.eq(i).find("input");
					var coinset = {};
					var type = trs.eq(i).find("select").val().trim();
					var labelname = $input.eq(1).val().trim();
					var labelnameen = $input.eq(2).val().trim();
					var labelurl = $input.eq(3).val().trim();
					var sequence = $input.eq(4).val().trim();
					if(type == null || type == "" || type == ''){
						$input.eq(0).css("border-color","red");
						layer.msg("標籤詞類型不能為空！");
						return;
					}else{
						$input.eq(0).css("border-color","#D2D2D2");
					}
					if(labelname == null || labelname == "" || labelname == ''){
						$input.eq(1).css("border-color","red");
						layer.msg("標籤詞中文名稱不能為空！");
						return;
					}else{
						$input.eq(1).css("border-color","#D2D2D2");
					}
					if(labelnameen == null || labelnameen == "" || labelnameen == ''){
						$input.eq(2).css("border-color","red");
						layer.msg("標籤詞英文名稱不能為空！");
						return;
					}else{
						$input.eq(2).css("border-color","#D2D2D2");
					}
					if(labelurl == null || labelurl == "" || labelurl == ''){
						$input.eq(3).css("border-color","red");
						layer.msg("標籤詞鏈接不能為空！");
						return;
					}else{
						$input.eq(3).css("border-color","#D2D2D2");
					}
					if(sequence == null || sequence == "" || sequence == ''){
						$input.eq(4).css("border-color","red");
						layer.msg("標籤詞排序不能為空！");
						return;
					}else{
						$input.eq(4).css("border-color","#D2D2D2");
					}
					coinset["type"] = type;
					coinset["labelname"] = labelname;
					coinset["labelnameen"] = labelnameen;
					coinset["labelurl"] = labelurl;
					coinset["sequence"] = sequence;
					coinsets.push(coinset);
				}
				console.log(JSON.stringify(coinsets));
				$.ajax({
					headers:{
						'Accept':'application/json',
						'Content-Type':'application/json'
					},
					type : "POST",
					contentType : "application/x-www-form-urlencoded;charset=utf-8",
					url : "/label/saveLabels",
					dataType : "json",
					data:JSON.stringify(coinsets),
					error:function(request){
						layer.msg("服務器異常.......");
					},
					success:function(data){
						if(data != null ){
							layer.msg(data.message,{time:3000});
							if(data.success){
								layer.close(index);
								setTimeout(function(){
									location.reload();
								}, 1000);
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
//批量添加標籤詞模板
function addCoinset(){
	var opt = "";
	for (var i = 1; i <= 50; i++) {
		opt+='<option value="'+i+'">'+i+'</option>';
	}
    var tr = 
    	'<tr class="coinsetTr">'
    	+'<td style="width: 170px;text-align: left;">'
	      +'<div class="layui-input-inline">'
	        +'<select name="type" id="type">'
	          +'<option value="">請選擇標籤詞類型</option>'
	            +'<option value="rent">租屋</option>'
	            +'<option value="sale">二手</option>'
	        +'</select>'
	      +'</div>'
		+'</td>'
    	+'<td>標籤詞中文名稱:</td>'
		+'<td><input type="tel" name="labelname'+temp+'" placeholder="請輸入標籤詞中文名稱"  autocomplete="off" class="layui-input" value="" ></td>'
		+'<td>標籤詞英文名稱:</td>'
 		+'<td><input type="tel" name="labelnameen'+temp+'" placeholder="請輸入標籤詞英文名稱" autocomplete="off" class="layui-input" value="" ></td>'
		+'<td>標籤詞鏈接:</td>'
		+'<td><input type="tel" name="labelurl'+temp+'" placeholder="請輸入標籤詞鏈接"  autocomplete="off" class="layui-input" value="" ></td>'
		+'<td>'
		      +'<div class="layui-input-inline">'
		        +'<select name="sequence">'
		          	+'<option value="">排序</option>'
	    		    +opt
		        +'</select>'
		      +'</div>'
		+'</td>'
	    +'<td>'
			+'<button class="layui-btn layui-btn-danger" onclick="delRow(this)">刪除</button>'
		+'</td>'
	+'</tr>'
	$("#coinsetTable").append(tr);
	temp = temp+1;
}
function delRow(obj){
	obj.parentElement.parentElement.remove();

}