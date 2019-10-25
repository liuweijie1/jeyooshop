/**
 * wbliywj


 * @returns
 */

var ue = null;
var ueen =null;
var imagepath=$("#imagepath").val();
var subcategoryid=parseInt($("#subcategoryid").val()); 
var categoryid=parseInt($("#categoryid").val()); 

 $(function() {
	 var imgpath=$("#imagepath").val();
	 if(imgpath==null||imgpath==''){
		 $("#demo1").hide();
	 }
	 $("#information").addClass("layui-nav-itemed");
     $("#lay-information").addClass("layui-this");
	 ueen = UE.getEditor('contenten',{
		 autoFloatEnabled:false,//是否保持toolbar位置不懂
		 elementPathEnabled : false,　　//是否启用元素路径，默认是true显示
		 initialFrameWidth:900,
			toolbars:[['anchor', //锚点
				'undo', //撤销
				'redo', //重做
				'bold', //加粗
				'indent', //首行缩进
				'italic', //斜体
				'underline', //下划线
				'strikethrough', //删除线
				'subscript', //下标
				'fontborder', //字符边框
				'superscript', //上标
				'formatmatch', //格式刷
				'pasteplain', //纯文本粘贴模式
				'selectall', //全选
				'print', //打印
				'preview', //预览
				'horizontal', //分隔线
				'removeformat', //清除格式
				'time', //时间
				'date', //日期
				'unlink', //取消链接
				'cleardoc', //清空文档
				'fontfamily', //字体
				
				'fontsize', //字号
				'paragraph', //段落格式
				'simpleupload', //单图上传
				'link', //超链接
				'spechars', //特殊字符
				'searchreplace', //查询替换
				'justifyleft', //居左对齐
				'justifyright', //居右对齐
				'justifycenter', //居中对齐
				'justifyjustify', //两端对齐
				'forecolor', //字体颜色
				//'insertorderedlist', //有序列表
				'insertunorderedlist', //无序列表
				'fullscreen', //全屏
				'rowspacingtop', //段前距
				'rowspacingbottom', //段后距
				'imageleft', //左浮动
				'imageright', //右浮动
				'imagecenter', //居中
				'lineheight', //行间距
				'edittip ', //编辑提示
				'customstyle', //自定义标题
				'autotypeset', //自动排版
				'touppercase', //字母大写
				'tolowercase', //字母小写
				'template',//模板
				]]
		});
		
		
		ue=UE.getEditor('content', {
			 autoFloatEnabled:false,//是否保持toolbar位置不懂
			 elementPathEnabled : false,　　//是否启用元素路径，默认是true显示
			 initialFrameWidth:900,
			toolbars: [
				[
					'undo', //撤销
					'redo', //重做
					'bold', //加粗
					'indent', //首行缩进
					'italic', //斜体
					'underline', //下划线
					'strikethrough', //删除线
					'subscript', //下标
					'fontborder', //字符边框
					'superscript', //上标
					'formatmatch', //格式刷
					'pasteplain', //纯文本粘贴模式
					'selectall', //全选
					'print', //打印
					'preview', //预览
					'horizontal', //分隔线
					'removeformat', //清除格式
					'time', //时间
					'date', //日期
					'unlink', //取消链接
					'cleardoc', //清空文档
					'fontfamily', //字体
					'fontsize', //字号
					'paragraph', //段落格式
					'simpleupload', //单图上传
					'link', //超链接
					'spechars', //特殊字符
					'searchreplace', //查询替换
					'justifyleft', //居左对齐
					'justifyright', //居右对齐
					'justifycenter', //居中对齐
					'justifyjustify', //两端对齐
					'forecolor', //字体颜色
					'insertorderedlist', //有序列表
					//'insertunorderedlist', //无序列表
					'fullscreen', //全屏
					'rowspacingtop', //段前距
					'rowspacingbottom', //段后距
					'imageleft', //左浮动
					'imageright', //右浮动
					'imagecenter', //居中
					'lineheight', //行间距
					'edittip ', //编辑提示
					'customstyle', //自定义标题
					'autotypeset', //自动排版
					'touppercase', //字母大写
					'tolowercase', //字母小写
					'template',//模板
					]
				]
			});
		UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl; 
		UE.Editor.prototype.getActionUrl = function(action) {
		    if (action == 'uploadimage') {
		        return '/infomationmanage/uploadimage';//这就是自定义的上传地址
		    }else {
		        return this._bkGetActionUrl.call(this, action);
		    }
		}

       var content=$("#editcontent").html();
       var contenten=$("#editcontenten").html();
     
       
       ue.addListener('ready',function () {
           ue.execCommand('insertHtml',content);
       });
       ueen.addListener('ready',function () {
    	   ueen.execCommand('insertHtml',contenten);
       });
			
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
				
					options += "<option data-catecn='"+val.categoryname+"'  "+"data-cateen='"+val.categorynameen+"'  value='" + val.catagoryid + "'>"
							+ val.categoryname + " / " + val.categorynameen
							+ "</option>";

				});

				$("#categoryname").html(options);
				
			}

		});
		  $("#categoryname").val(categoryid);

		$.ajax({
			url : "/infomationmanage/findCategoryxl",
			async: false,
			data : {
				parentcategoryid : categoryid
			},
			type : "GET",
			contentType : "application/json;charset=utf-8",
			success : function(res) {
				var options = '<option value="">請選擇咨詢二級分類</option>';
				$.each(res.subcategorynameList, function(index, val) {
				
					options += "<option data-catecn='"+val.categoryname+"'  "+"data-cateen='"+val.categorynameen+"'  value='" + val.catagoryid + "'>"
							+ val.categoryname + " / " + val.categorynameen
							+ "</option>";

				});

				$("#subcategoryname").html(options);

			}

		});

		 $("#subcategoryname").val(subcategoryid);
		 if($("#ispush").is(':checked')){
			 $("#pushparm").show();
     	}else{
     		$("#pushparm").hide();
     	}

});


layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'], function(){
	var timestamp = (new Date()).getTime(); 
        var form = layui.form
        ,layer = layui.layer
        , upload = layui.upload //上传
        ,laydate = layui.laydate;
        form.render();//初始化下拉框
        
      //日期  注意：定义页面日期控件id不要重复!!!
        laydate.render({
          elem: '#beginpublishTime'
         ,type: 'datetime'
          ,format: 'yyyy-MM-dd HH:mm' //可任意组合
          ,value: new Date(timestamp)
          ,isInitValue: false
        });
        
        laydate.render({ 
        	  elem: '#newTime'
        	  ,type: 'datetime'
        	  ,format: 'yyyy-MM-dd HH:mm' //可任意组合
        	  ,value: new Date(timestamp)
              ,isInitValue: true 
      
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
      					
      					options +="<option data-catecn='"+val.categoryname+"'  "+"data-cateen='"+val.categorynameen+"'  value='" + val.catagoryid + "'>"
      							+ val.categoryname + " / " + val.categorynameen
      							+ "</option>";

      				});

      				$("#subcategoryname").html(options);
      				 form.render();//初始化下拉框
      			}

      		});
        	  
        	}); 
        
        
        form.on('checkbox(ispush)', function(data){
         	 if(data.elem.checked){
         		$("#pushparm").show();
         	 }else{
         		$("#pushparm").hide();
         	 }
    	  
    	}); 
        
        var posterWidth = 600, posterHeight = 450;
      //普通图片上传
        var uploadInst = upload.render({
            elem: '#test1'
            , url: '/file/uploadFiles/'
            ,accept:'images'
            ,size:5120
            , drag: true
            , auto: false
            ,acceptMime: 'image/jpg,image/jpeg,image/png'
           
        	, choose: function(obj) {
        	    obj.preview(function(index, file, result) {
        	      var img = new Image();
        	      img.onload = function() {
        	        if (posterWidth >= img.width && posterHeight >= img.height) {
        	          //$('#upload_poster_preview').attr('src', result); //图片链接（base64）不支持ie8
        	          var filetype=file.type;
          	          if('image/jpg'==filetype||'image/jpeg'==filetype||'image/png'==filetype){
          	        	  obj.upload(index, file);
          	          }else{
          	        	  layer.msg('只支持png、jpg、jpeg格式的圖片');
          	        	 
          	          }
        	        } else {
        	          layer.msg('图片大小请控制在600px*450px内');
        	        }
        	      };
        	      img.src = result;
        	    });
        	  }
            , before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#demo1').attr('src', result).show(); //图片链接（base64）
                });
            }
            , done: function (res) {
              
				  if (res.code == 0) {
					if (res != null) {
						layer.msg('上傳成功');
						 var demoText = $('#demoText');
			             demoText.html('');
						imagepath = res.result[0].url;
					}
				}else{/*
					layer.msg('上傳失敗');
	                var demoText = $('#demoText');
	                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
	                demoText.find('.demo-reload').on('click', function () {
	                    uploadInst.upload();
	                });*/
				}
                //上传成功
            }
            , error: function () {
                //演示失败状态，并实现重传
            	//layer.msg('上傳失敗');
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function () {
                    uploadInst.upload();
                });
            }
        });
      
});



     

var flag=true;
// 查看
function editBtn(){
	if(!flag){
		layer.msg("正在保存...",{time:5000});
		return false;
	}
	      
        	var categorynameid = $("#categoryname").val();
        	var categorynamecn = $("#subcategoryname").find("option:selected").attr("data-catecn");
        	var categorynameen = $("#subcategoryname").find("option:selected").attr("data-cateen");
        	if(categorynameid == null || categorynameid == '' || categorynameid == undefined){
        		layer.msg('請選擇資訊一級分類');
        		return false;
        	}
        	
        	var subcategoryid = $("#subcategoryname").val();
        	if(subcategoryid == null || subcategoryid == '' || subcategoryid == undefined){
        		layer.msg('請選擇資訊二級分類');
        		return false;
        	}
        	
        	var title = $("#title").val()
        	if(title.trim().length<=0){
        		layer.msg('中文資訊標題不可為空');
        		return false;
        	}
        	//中文
        	
            var contentstr=ue.getContentTxt()
        	var content = ue.getContent();
        	if(contentstr==null||contentstr==''){
        		layer.msg('請輸入繁體資訊正文');
        		return false;
        	}
        	if($.trim(contentstr).length>50){
        		var contentstrsub = $.trim(contentstr).substring(0,50) //这个str就是截取的值
        		
        	}else{
        		var contentstrsub =$.trim(contentstr)
        	}
        	//英文
        	var contenten= ueen.getContent();
        	var contentenstr=ueen.getContentTxt()
        	if($.trim(contentenstr).length>50){
        		var contentenstrsub = $.trim(contentenstr).substring(0,50) //这个str就是截取的值
        		
        	}else{
        		var contentenstrsub = $.trim(contentenstr)
        	}
    		/*alert(content);
    		ueen.execCommand('insertHtml', content)*/
        	var ispush='';
        	var pushtime=''
        	var pushplatform =''
        	var pushcontent	=''
            var pushcontenten=''	
        	if($("#ispush").is(':checked')){
        		ispush='1'
        			if($("#xzpushtime").is(':checked')){
                		pushtime=$("#beginpublishTime").val()
                		if(pushtime.trim().length<=0){
                			  layer.msg("請選擇推送時間");
                 	         return false;
                		}
                		var sysDate = new Date();//获取系统时间
                	    var  newDate = new Date(pushtime);//把用户输入的字符串转换成日期格式；
                	     if(newDate<sysDate){
                	    	  layer.msg("推送時間只能選擇未來的年月日時間");
                	         return false;
                	     }
                	}else if($("#jkpushtime").is(':checked')){
                		pushtime="newDate";
                	}else if(!($("#jkpushtime").is(':checked'))||!($("#xzpushtime").is(':checked'))){
                		 layer.msg("請選擇推送時間");
                		 return false;
                	}
        		 pushcontent=$("#pushcontent").val()
            	 if(pushcontent == null || pushcontent == '' || pushcontent == undefined){
            		 layer.msg('中文推送內容不可為空');
            		 return false;
            	 }
            	 pushcontenten=$("#pushcontenten").val()
        	     pushplatform = $("#pushplatform").val()
        			
        	}else{
        		ispush='0'
        	}
        	
        	
            var informationid = $("#informationid").val()
            layer.msg("正在保存...",{time:5000});
        	flag=false;
            $.ajax({
                type : "POST",
                contentType : "application/x-www-form-urlencoded;charset=utf-8",
                //contentType : "application/json;charset=utf-8",
                url : "/infomationmanage/editInfomation",
                data:{
                	imagepath:imagepath,
                	informationid:informationid,
                	categoryid:categorynameid,
                	edcategorynamecn:categorynamecn,
                	edcategorynameen:categorynameen,
                	subcategoryid:subcategoryid,
                	title:title,
                	titleen:$("#titleen").val(),
                	content:content,
                	contenten:contenten,
                	contentstr:contentstrsub,
                	contentenstr:contentenstrsub,
                	ispush:ispush,
                	pushcontent:pushcontent,
                	pushcontenten:pushcontenten,
                	pushtime:pushtime,
                	pushplatform:pushplatform
                   
                },
                error:function(request){
                	 flag=true;
                	 layer.msg("保存失敗");
                },
                success:function(data){
                 flag=true;
                 if(data.success==true){
                	 layer.msg("保存成功");
                	 window.close();
					window.opener.location.href=window.opener.location.href;
                 }else if(data.sendmassge==false){
             		layer.msg("保存失敗,推送接口異常");
             	}else{
                	 layer.msg("保存失敗");
                 }
                	
                }
            })
        


}
//新增
$("#addBtn").click(function(){
	 var newWeb=window.open('_blank');
     newWeb.location='/infomationmanage/toAddInfomation';
})

function account(){
	 window.close();
}

