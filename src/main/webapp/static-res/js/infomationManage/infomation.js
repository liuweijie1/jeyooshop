/**
 * wbliywj


 * @returns
 */

 $(function() {	
	 $("#information").addClass("layui-nav-itemed");
     $("#lay-information").addClass("layui-this");
		$.ajax({
			url : "/infomationmanage/findCategoryxl",
			async: false,
			data : {
				categoryname : 'true'
			},
			type : "GET",
			contentType : "application/json;charset=utf-8",
			success : function(res) {
				var options = '<option value="">請選擇咨詢一級分類</option>';
				$.each(res.categorynameList, function(index, val) {
					
					options += "<option value='" + val.catagoryid + "'>"
							+ val.categoryname + " / " + val.categorynameen
							+ "</option>";

				});

				$("#categoryname").html(options);
				
			}

		});


		$.ajax({
			url : "/infomationmanage/findCategoryxl",
			async: false,
			data : {
				subcategoryname : 'true'
			},
			type : "GET",
			contentType : "application/json;charset=utf-8",
			success : function(res) {
				var options = '<option value="">請選擇咨詢二級分類</option>';
				$.each(res.subcategorynameList, function(index, val) {
				
					options += "<option value='" + val.catagoryid + "'>"
							+ val.categoryname + " / " + val.categorynameen
							+ "</option>";

				});

				$("#subcategoryname").html(options);

			}

		});

	

	

		
		
	

});
layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'], function(){
	
        var form = layui.form
        ,layer = layui.layer
        ,laydate = layui.laydate;
        form.render();//初始化下拉框
   
        
        var beginpublishTime=  laydate.render({
            elem: '#beginpublishTime',
          btns:['clear','confirm'],
          max: new Date().toLocaleDateString(),
          done: function(value, date, endDate) {
                if(value!=''){
                	endpublishTime.config.min = {
                        year: date.year,
                        month: date.month - 1,
                        date: date.date
                    }; //重置结束日期最小值
                } else{
                	endpublishTime.config.min = beginpublishTime.config.min
                }

          }
        });
       var endpublishTime =  laydate.render({
            elem: '#endpublishTime',
            max: new Date().toLocaleDateString(),
            done: function(value, date, endDate) {
                if(value!=''){
                	beginpublishTime.config.max = {
                        year: date.year,
                        month: date.month - 1,
                        date: date.date
                    }; //重置开始日期最大值
                }else{
                	beginpublishTime.config.max = endpublishTime.config.max
                }

            }
        });
        
        
        

       //日期  注意：定义页面日期控件id不要重复!!!
     var beginupdateTime=  laydate.render({
           elem: '#beginupdateTime',
         btns:['clear','confirm'],
         max: new Date().toLocaleDateString(),
         done: function(value, date, endDate) {
               if(value!=''){
            	   endupdateTime.config.min = {
                       year: date.year,
                       month: date.month - 1,
                       date: date.date
                   }; //重置结束日期最小值
               } else{
            	   endupdateTime.config.min = beginupdateTime.config.min
               }

         }
       });
      var endupdateTime =  laydate.render({
           elem: '#endupdateTime',
           max: new Date().toLocaleDateString(),
           done: function(value, date, endDate) {
               if(value!=''){
            	   beginupdateTime.config.max = {
                       year: date.year,
                       month: date.month - 1,
                       date: date.date
                   }; //重置开始日期最大值
               }else{
            	   beginupdateTime.config.max = endupdateTime.config.max
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
        	
        	var beginpublishTime = $("#beginpublishTime").val();
        	var endpublishTime = $("#endpublishTime").val();
        	var beginupdateTime = $("#beginupdateTime").val();
        	var endupdateTime = $("#endupdateTime").val();
        	var categoryId = $('#categoryname option:selected').val();
        	var subcategoryId = $('#subcategoryname option:selected').val();
        	var title =$("#title").val().trim();
        	title = title.replace(/%/g,'/%').replace(/_/g,'/_');
        	dtt = {title:title,categoryId:categoryId,subcategoryId:subcategoryId,
        			beginupdateTime:beginupdateTime,endupdateTime:endupdateTime,
        			beginpublishTime:beginpublishTime,endpublishTime:endpublishTime
        	
        	};
    		res(dtt);
    	})
    	// table渲染
        function res (dtt){
        	//执行一个 table 实例
        	table.render({
  	          elem: '#usercontact'
  	          ,id:"informationid"
  	          ,url: '/infomationmanage/getInfomationPage' //数据接口
  	          ,title: '資訊管理'
  	          ,page: false //开启分页
  	          ,totalRow: false //开启合计行
  	          ,limit:10
  	          ,where: dtt
  	          ,method:'GET'
  	          ,cols: [[  //表头
	            //{type: 'checkbox', fixed: 'left'}
		           {field: 'informationid', title: 'informationid',align:'center', width:'60',hide:true, sort: false}
		            ,{field: 'title', title: '資訊標題',align:'center', width:'20%',hide:false, sort: false}
		            ,{field: 'titleen', title: 'titleen',align:'center', width:'60',hide:true, sort: false}
		            ,{field: 'categoryname', title: '資訊一級分類',align:'center', width:'15%'}
		           	,{field: 'categorynameen', title: 'en', width: '10%',align:'center', sort: false, totalRow: true,hide:true,templet: function(d){ return d.contactperson==''?'/':d.contactperson}}
		            ,{field: 'subcategoryname', title: '資訊二級分類', align:'center',width:'15%'}
		           	,{field: 'subcategorynameen', title: 'suben',align:'center', width: '10%', sort: false, totalRow: true,hide:true,templet: function(d){ return d.contactperson==''?'/':d.contactperson}}
		           	,{field: 'ispush', title: '資訊推送',align:'center', width: '10%', sort: false, totalRow: true}
		           	,{field: 'publishtime', title: '發佈時間',align:'center', width: '15%', sort: false, totalRow: true}
		           	,{field: 'updatetime', title: '修改時間',align:'center', width: '15%', sort: false, totalRow: true}
		           
		           
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
  	    		if(res.data!=null){
  	    		for (var i = 0; i < res.data.length; i++) {
  	    			var data = res.data[i];
  	    			if(data.ispush ==1){
  	    				data.ispush = "是";
  	    			}else {
  	    				data.ispush = "否";
  	    			}
  	    			
  	    			
  	    			var title='/';
  	    			if(data.title==null||data.title==''||data.title==""){
  	    				title='/'
  	    			}else{
  	    				title=data.title
  	    			}
  	    			
  	    			var titleen='/';
  	    			if(data.titleen==null||data.titleen==''||data.titleen==""){
  	    				titleen='/'
  	    			}else{
  	    				titleen=data.titleen
  	    			}
  	    			data.title = title+'<br>'+titleen ;
  	    			
  	    			
  	    			//data.categoryname = data.categoryname+'<br>'+data.categorynameen ;
  	    			//data.subcategoryname = data.subcategoryname+'<br>'+data.subcategorynameen ;
  	    			
  	    			
  	    			

  	    			var categoryname='/';
  	    			if(data.categoryname==null||data.categoryname==''||data.categoryname==""){
  	    				categoryname='/'
  	    			}else{
  	    				categoryname=data.categoryname
  	    			}
  	    			
  	    			var categorynameen='/';
  	    			if(data.categorynameen==null||data.categorynameen==''||data.categorynameen==""){
  	    				categorynameen='/'
  	    			}else{
  	    				categorynameen=data.categorynameen
  	    			}
  	    			
  	    			
  	    			
  	    			
  	    			data.categoryname = categoryname+'<br>'+categorynameen ;
  	    			
  	    			var subcategoryname='/';
  	    			if(data.subcategoryname==null||data.subcategoryname==''||data.subcategoryname==""){
  	    				subcategoryname='/'
  	    			}else{
  	    				subcategoryname=data.subcategoryname
  	    			}
  	    			
  	    			var subcategorynameen='/';
  	    			if(data.subcategorynameen==null||data.subcategorynameen==''||data.subcategorynameen==""){
  	    				subcategorynameen='/'
  	    			}else{
  	    				subcategorynameen=data.subcategorynameen
  	    			}
  	    			data.subcategoryname = subcategoryname+'<br>'+subcategorynameen ;
  	    			
  	    			
  	    			
  	    			
  	    			
  	    			
  	    			
  	    			
  	    			
  	    			
  	    			
  	    			
  	    			data.publishtime = layui.util.toDateString(data.publishtime, 'yyyy/MM/dd HH:mm:ss');
  	    			 if(data.updatetime==''||data.updatetime==null){
                      	data.updatetime='/';
                      }else{
                          data.updatetime = layui.util.toDateString(data.updatetime, 'yyyy/MM/dd HH:mm:ss');
                      }
  				}}
  	    	} 
  	    	,response: {
  	    	    statusName: 'code' //规定数据状态的字段名称，默认：code
  	    	    ,statusCode: 0 //规定成功的状态码，默认：0
  	    	    ,msgName: 'msg' //规定状态信息的字段名称，默认：msg
  	    	    ,countName: 'count' //规定数据总数的字段名称，默认：count
  	    	    ,dataName: 'data' //规定数据列表的字段名称，默认：data
      	  	} 
  	    	

          });
        	
        	
        	 form.on('select(test)', function(data){
           	  $.ajax({
    			url : "/infomationmanage/findCategoryxl",
    			async: false,
    			data : {
    				parentcategoryid : data.value
    			},
    			type : "GET",
    			contentType : "application/json;charset=utf-8",
    			success : function(res) {
    				var options = '<option value="">請選擇咨詢二級分類</option>';
    				$.each(res.subcategorynameList, function(index, val) {
    					
    					options += "<option value='" + val.catagoryid + "'>"
    							+ val.categoryname + " / " + val.categorynameen
    							+ "</option>";

    				});

    				$("#subcategoryname").html(options);
    				 form.render();//初始化下拉框
    			}

    		});
      	  
      	}); 
          
        }
       
        //监听头工具栏事件
       table.on('toolbar(user)', function(obj){
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
        table.on('tool(usertool)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
          var data = obj.data //获得当前行数据
          var informationid=data.informationid
          //編輯二級分類顯示一級分類
          var categorynamestr=data.categorynamestr
         
          
          ,layEvent = obj.event; //获得 lay-event 对应的值
          if(layEvent === 'detail'){
        	  var newWeb=window.open('_blank');
              newWeb.location='/usercontactmanage/toDetail?contactID='+contactID
            
          } else if(layEvent === 'del'){
            layer.confirm('是否確認刪除？', {icon:3,title:'提示'}, function(index){
              deleteObj(informationid,index,obj)
             
              //向服务端发送删除指令
            });
          } else if(layEvent === 'edit'){
        	  var newWeb=window.open('_blank');
        	  newWeb.location='/infomationmanage/toEditInfomation?informationId='+informationid;
        	  
           
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



function deleteObj(informationid,index,obj){
	  $.ajax({
	        url: "/infomationmanage/delInfomation",
	        data:{informationId:informationid},
	        type : "GET",
	        contentType : "application/json;charset=utf-8",
	        success:function (res) {
	        	if(res.success==true){
	        		obj.del(); //删除对应行（tr）的DOM结构
		            layer.close(index);
		            layer.msg('刪除成功',{time:2000});
	        	}else{
	        		layer.close(index);
		            layer.msg('刪除失败');
	        	}
	        	 
	        }

	  });

	    }
//參數驗證
function verify(parentcategoryid, categoryname, categorynameen, sequence) {

	if (parentcategoryid == null || parentcategoryid == ''
			|| parentcategoryid == undefined) {

		layer.msg('請選擇一級分類');
		return false;
	}

	if (categoryname == null || categoryname == '' || categoryname == undefined) {

		layer.msg('中文二級分類不可為空');
		return false;
	}
	if (categorynameen == null || categorynameen == ''
			|| categorynameen == undefined) {

		layer.msg('英文二級分類不可為空');
		return false;
	}
	if (sequence == null || sequence == '' || sequence == undefined) {

		layer.msg('分類排序不可為空');
		return false;
	}

	return true;
}
// 查看
function add(){
	
    var index = layer.open({
        type:1
        //skin: 'layui-layer-rim', //加上边框
        ,area: ['600px', '500px'] //宽高
        ,title:"權重分值管理"
        ,content: $("#score")
        ,btn: ['確定', '取消']
        ,method:'GET'
        ,btnAlign: 'c'
        ,maxmin:true
        ,yes: function(index, layero){
        	var parentcategoryid = $("#catselect").val()
        	var categoryname = $("#categoryName").val()
        	var categorynameen = $("#categoryNameEN").val()
        	var sequence = $("#sequence").val()
        	if(verify(parentcategoryid,categoryname,categorynameen,sequence)){
        	
            $.ajax({
                type : "POST",
                contentType : "application/x-www-form-urlencoded;charset=utf-8",
                //contentType : "application/json;charset=utf-8",
                url : "/infomationmanage/addCategory",
                data:{
                	parentcategoryid:$("#catselect").val(),
                	categoryname:$("#categoryName").val(),
                    categorynameen:$("#categoryNameEN").val(),
                    sequence:$("#sequence").val(),
                    isshow:$('input:radio[name="isShow"]:checked').val()
                },
                error:function(request){
                    alert(2);
                },
                success:function(data){
                    layer.close(index);
                    location.reload();
                    
                }
            })
        }
            //layer.close(index);

        },
        btn2:function(index, layero){
            layer.close(index);
        }
    });
    
    
    
    $.ajax({
        url: "/infomationmanage/findCategoryxl",
        data:{},
        type : "GET",
        contentType : "application/json;charset=utf-8",
        success:function (res) {
        	var options = '<option value="">請選擇咨詢一級分類</option>';
        	$.each(res, function(index,val) {
        		
        		options+="<option value='"+ val.catagoryid+"'>" +val.categoryname+" / "+ val.categorynameen+"</option>";
        		$("#catselect").html(options);
        		
        		});

            
         
        }

  });
  
    
    $("#closePage").click(function(){
        
        layer.close(index);
    })
   
}
//新增
$("#addBtn").click(function(){
	 var newWeb=window.open('_blank');
     newWeb.location='/infomationmanage/toAddInfomation';
})
//編輯
function  edit(catagoryid,categorynamestr){
	
    var index = layer.open({
        type:1
        //skin: 'layui-layer-rim', //加上边框
        ,area: ['600px', '500px'] //宽高
        ,title:"權重分值管理"
        ,content: $("#editscore")
        ,btn: ['確定', '取消']
        ,method:'GET'
        ,btnAlign: 'c'
        ,maxmin:true
        ,yes: function(index, layero){
        	var categoryname=$("#edcategoryName").val()
            var categorynameen=$("#edcategoryNameEN").val()
            var sequence=$("#edsequence").val()
        	if(verify('1',categoryname,categorynameen,sequence)){
	            $.ajax({
	                type : "GET",
	                contentType : "application/x-www-form-urlencoded;charset=utf-8",
	                //contentType : "application/json;charset=utf-8",
	                url : "/infomationmanage/editCategory",
	                data:{
	                	
	                	catagoryid:catagoryid,
	                	categoryname:$("#edcategoryName").val(),
	                    categorynameen:$("#edcategoryNameEN").val(),
	                    sequence:$("#edsequence").val(),
	                    isshow:$('input:radio[name="isShow"]:checked').val()
	                },
	                error:function(request){
	                    alert(2);
	                },
	                success:function(data){
	                    layer.close(index);
	                    location.reload();
	                    
	                }
	            })
            
        	}
        },
        btn2:function(index, layero){
            layer.close(index);
        }
    });
    
    $.ajax({
        url: "/infomationmanage/getCategoryById",
        data:{catagoryId:catagoryid},
        type : "GET",
        contentType : "application/json;charset=utf-8",
        success:function (res) {
        	$("#edcategoryName").val(res.informationCategory.categoryname);
            $("#edcategoryNameEN").val(res.informationCategory.categorynameen);
            $("#edsequence").val(res.informationCategory.seqence);
            $("#yiji").text(categorynamestr);
            if(res.informationCategory.isshow==true){
            	 $("input[name='edisShow'][value=1]").attr("checked",true); 
            }else{
            	$("input[name='edisShow'][value=0]").attr("checked",true); 
            }
            
         
        }

  });
    
    
    
    $("#closePage").click(function(){
       
        layer.close(index);
    })
    
}

