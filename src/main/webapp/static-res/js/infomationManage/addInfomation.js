/**
 * wbliywj


 * @returns
 */

var ue = null;
var ueen =null;
 $(function() {
	 $("#information").addClass("layui-nav-itemed");
	    ue = UE.getEditor('content');
		ueen = UE.getEditor('contenten');
		
		
		/*ue=UE.getEditor('content', {
			toolbar: [
			['fullscreen', 'source', 'undo', 'redo', 'bold', 'italic',
			'underline','fontborder', 'backcolor', 'fontsize', 'fontfamily',
			'justifyleft', 'justifyright','justifycenter', 'justifyjustify',
			'strikethrough','superscript', 'subscript', 'removeformat',
			'formatmatch','autotypeset', 'blockquote', 'pasteplain', '|',
			'forecolor', 'backcolor','insertorderedlist', 'insertunorderedlist',
			'selectall']
			]
			});
		*/
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
					/*console.log('index=' + index);*/
					options += "<option value='" + val.catagoryid + "'>"
							+ val.categoryname + " / " + val.categorynameen
							+ "</option>";

				});

				$("#categoryname").html(options);
				
			}

		});


	/*	$.ajax({
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
					console.log('index=' + index);
					options += "<option value='" + val.catagoryid + "'>"
							+ val.categoryname + " / " + val.categorynameen
							+ "</option>";

				});

				$("#subcategoryname").html(options);

			}

		});
*/
	

	

		
		
	

});
layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'], function(){
	var timestamp = (new Date()).getTime(); 
        var form = layui.form
        ,layer = layui.layer
        ,laydate = layui.laydate;
        form.render();//初始化下拉框
        
      //日期  注意：定义页面日期控件id不要重复!!!
        laydate.render({
          elem: '#beginpublishTime'
          ,type: 'datetime'
          ,format: 'yyyy-MM-dd HH:mm' //可任意组合
          ,value: new Date(timestamp)
          ,isInitValue: true 
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
     					
     					options += "<option value='" + val.catagoryid + "'>"
     							+ val.categoryname + " / " + val.categorynameen
     							+ "</option>";

     				});

     				$("#subcategoryname").html(options);
     				 form.render();//初始化下拉框
     			}

     		});
       	  
       	}); 
     
      
});




// 查看
function saveBtn(){
	
        	var categorynameid = $("#categoryname").val();
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
        	var contentstr=ue.getContentTxt()
        	var content = ue.getAllHtml();
        	if(contentstr==null||contentstr==''){
        		layer.msg('請輸入繁體資訊正文');
        		return false;
        	}
        	var contenten= ueen.getAllHtml();
        	
    		/*alert(content);
    		ueen.execCommand('insertHtml', content)*/
        	var ispush='';
        	if($("#ispush").is(':checked')){
        		ispush='1'
        	}else{
        		ispush='0'
        	}
        	
        	var pushtime=''
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
        	var pushplatform = $("#pushplatform").val()

        	
            $.ajax({
                type : "POST",
                contentType : "application/x-www-form-urlencoded;charset=utf-8",
                //contentType : "application/json;charset=utf-8",
                url : "/infomationmanage/addInfomation",
                data:{
                	categoryid:categorynameid,
                	subcategoryid:subcategoryid,
                	title:title,
                	titleen:$("#titleen").val(),
                	content:content,
                	contenten:contenten,
                	ispush:ispush,
                	pushtime:pushtime,
                	pushplatform:pushplatform
                   
                },
                error:function(request){
                    alert("保存失敗");
                },
                success:function(data){
                	layer.msg("保存成功");
               	 window.close();
					window.opener.location.href=window.opener.location.href;
                    
                }
            })
        
       
    
    
    


}
//新增
$("#addBtn").click(function(){
	 var newWeb=window.open('_blank');
     newWeb.location='/infomationmanage/toAddInfomation';
})



//新增
function account(){
	 window.close();
}
