/**
 * wbqiutj
 * @returns
 */
/*window.onload=function(){
	getPage();
}*/
layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider','form'], function(){
	
        var form = layui.form
        ,layer = layui.layer
        ,laydate = layui.laydate;
       // form.render();//初始化下拉框
        
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
        
        res(dtt);// 页面加载的时候渲染
        
        $("#searchBtn").click(function(){
        	var isshow = $("#isshow").val();
        	var type = $("#type").val();
        	
        	dtt = {
    			isshow:isshow,
    			type:type
        	};
    		res(dtt);
    	})
    	// table渲染
        function res (dtt){
        	//执行一个 table 实例
        	table.render({
  	          elem: '#demo'
  	          ,height: 500
  	          ,url: '/coinset/getPage' //数据接口
  	          ,title: '用户表'
  	          ,page: false //开启分页
  	          ,totalRow: false //开启合计行
  	          ,limit:10
  	          ,where: dtt
  	          ,method:'POST'
  	          ,cols: [[ //表头
  	            //{type: 'checkbox', fixed: 'left'}
  		            {field: 'money', title: '港幣(HK$)',align:'center', width:200}
  		           	
  		            ,{field: 'propertycoin', title: '對應屋幣值',align:'center', width: 300, sort: false, totalRow: true}
  		            ,{fixed: 'right',title: '操作', width: 300, align:'center', templet: '#switchTpl'}
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
        	form.render(addCoinset());
        })
        
      //监听性别操作
        form.on('switch(upDown)', function(obj){
        	layer.confirm('你確定要下架嗎？',{
        		btn: ['确定','取消'],
        		icon: 3,
        		title:'提示',
        		yes:function(index){
        			if(!obj.elem.checked){
        				//obj.othis.removeClass("layui-form-onswitch");
        				obj.elem.disabled = "disabled";
                  		obj.othis.addClass("layui-disabled");
                  		obj.othis.addClass("layui-checkbox-disbaled");
        			}
            		layer.close(index);
            		var setid = obj.elem.getAttribute("tag");
            		$.ajax({
            			type : "POST",
            			contentType : "application/json;charset=utf-8",
            			dataType : "json",
            			url : "/coinset/upOrDownCoinset?setid="+setid,
            			error:function(request){
            				
            			},
            			success:function(data){
            				if(data != null ){
            					layer.msg(data.message,{time:3000});
    						}
            			}
            		})
        		},
        		btn2:function(){
        			if(!obj.elem.checked){
        				obj.elem.checked = 'checked';
        				obj.othis.addClass("layui-form-onswitch");
        			}
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
var temp = 1;
function addBtn(){
		var index = layer.open({
	        type:1
	        //skin: 'layui-layer-rim', //加上边框
	        ,area: ['1100px', '600px'] //宽高
			,title:"添加屋币/港币关系"
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
					var money = $input.eq(0).val();
					var propertycoin = $input.eq(1).val();
					if(money == null || money == "" || money == ''){
						$input.eq(0).css("border-color","red");
						layer.msg("港幣(HK$) 不能為空！");
						return;
					}else{
						$input.eq(0).css("border-color","#D2D2D2");
					}
					if(propertycoin == null || propertycoin == "" || propertycoin == ''){
						$input.eq(1).css("border-color","red");
						layer.msg("對應屋幣值！");
						return;
					}else{
						$input.eq(1).css("border-color","#D2D2D2");
					}
					coinset["money"] = money;
					coinset["propertycoin"] = propertycoin;
					coinset["type"] = trs.eq(i).find("input[type='radio']:checked").val();
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
					url : "/coinset/saveCoinset",
					dataType : "json",
					data:JSON.stringify(coinsets),
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
function addCoinset(){
    var tr = 
    	'<tr class="coinsetTr">'
		+'<td>港幣(HK$) :</td>'
		+'<td><input type="tel" name="money'+temp+'"  autocomplete="off" class="layui-input" value="" ></td>'
		+'<td>對應屋幣值 :</td>'
		+'<td><input type="tel" name="propertycoin'+temp+'"  autocomplete="off" class="layui-input" value="" ></td>'
		+'<td><div class="layui-input-block" style="margin-left: 0px;">'
		      	+'<input type="radio" name="type'+temp+'" value="2" title="普通會員" checked="checked">'
		      	+'<input type="radio" name="type'+temp+'" value="1" title="代理公司">'
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