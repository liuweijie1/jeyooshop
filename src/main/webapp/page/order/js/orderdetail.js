 
      function qrbuy(qrnumber){
    	  var orderstate=$("#orderstate").val();
    	  if(orderstate==3){
    		  $.toast("交易已完成", "text");
    		  return false;
    	  }
    	  $.showLoading("请稍后...");
    	  $.ajax({
     			url : "/page/order/qrbuy",
     			async: true,
     			contentType : "application/x-www-form-urlencoded;charset=utf-8",
     			data : {
     				number : qrnumber
     				
     			},
     			type : "post",
     			success : function(res) {
     				if(res!='suceess'){
     					$.hideLoading();
     					$.toast("操作成功", function() {
     						window.location.reload()
     						});
     				}else{
     					　$.toast("服务异常", "cancel");
     				}
     				
     			
     			},
     				
     			error: function () {
     				$.hideLoading();
     			　　　$.toast("服务异常", "cancel");
     			　　}

     		});
      }
        
        