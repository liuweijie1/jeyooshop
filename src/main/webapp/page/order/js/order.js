 $(function () {
	         $.showLoading("加载中...");
	        

            foodorder_init();

           /* getFoodStockCount($("body").data("res_id"));*/ /*获取库存放入全局变量*/

            $("#foot_order a").addClass("hover");
            var food =$.cookie("myfoodArr");
            if(food){
                var localData = $.parseJSON(food),
                        resId = $('body').data('res_id');
                if(typeof localData[resId] == 'undefined'){
                    $("#food_empty").show();
                    $("#food_cars").hide();
                }else{
                    $("#food_empty").hide();
                    $("#food_cars").show();
                }
            }
            carIscrollInit();
            payinit()
          
            $.hideLoading();
         /*   
            $('#paymethodList').on('click','#yb-paymethod-foot',function(){
                console.log("hahah");
                window.location="/page/customer/member";
            });*/
            
            
            
            
        });
        //店铺下单确认页初始化
        function foodorder_init(){
            var $body=$("body"),
                currency = $body.attr("currency"),
                sign = $body.attr("sign"),
                key = "myfoodArr",
                resId = $body.data("res_id");
            if(!isNaN(resId)){
                var myshop = $.cookie(key), kindCount =0, foodTotal = 0, priceTotal = 0;
                if(myshop){
                    var myshop_array = $.parseJSON(myshop);
                    $("#goodslist").val(myshop);
                    if(myshop_array[resId]){  /*存在该店铺*/
                        //if(isNotEmpty(myshop_array[resId])){
                        if(myshop_array[resId].length> 0) {
                            $("#food_empty").hide();
                            $("#food_cars").show();
                            var str="",specialFlag = true;
                            //菜品数组排序
                            myshop_array[resId].sort(function(a, b){
                                var aType = a.not_discount? 2:(a.type?1:0),
                                    bType = b.not_discount? 2:(b.type?1:0);
                                return aType-bType;
                            });
                            for(var i = 0;i < myshop_array[resId].length;i ++){
                                if(myshop_array[resId][i]){
                                    var food_name = myshop_array[resId][i].food_name,
                                        price = myshop_array[resId][i].food_price,
                                        count =  myshop_array[resId][i].amount,
                                        comId = myshop_array[resId][i].food_id,
                                        food_img = myshop_array[resId][i].food_img,
                                        // 特价商品
                                        type = myshop_array[resId][i].type,
                                        single_num = myshop_array[resId][i].single_num,
                                        per_num = myshop_array[resId][i].per_num,
                                        last_num = myshop_array[resId][i].last_num,
                                        //不参与打折商品
                                        notDiscount = myshop_array[resId][i].not_discount;

                                    if(food_img){
                                    	var host=window.location.protocol+"//"+window.location.host;
                                        food_img = host+food_img;
                                    }else{
                                        food_img="http://static.3cfood.com/Public/static/img/dish_nopic.png";
                                    }
                                    kindCount++;
                                    foodTotal += parseInt(count);
                                    priceTotal +=price*count;
                                    price=parseFloat(price).toFixed(2)*1;
                                    if(specialFlag && (type == 1 || notDiscount == 1)){
                                        str += '<div id="with_no_discount_bar" class="font12" style="padding: 0 3%;border-bottom: 1px solid #dfdfdf;"><span class="red" style="border: 1px solid #e22;">&nbsp;特惠&nbsp;</span>&nbsp;特价、无折等商品不与其他优惠同享</div>';
                                        specialFlag = false;
                                    }
                                  /* if(isNaN(comId) && comId.indexOf('_')){
                                        var ids = comId.split("_");
                                        str += '<li class="car_food_'+ids[0]+'" data-id="'+comId+'">';
                                    }else{
                                        str += '<li class="car_food_'+comId+'" data-id="'+comId+'">';
                                    }
                                    str +='<div class="car_list_box"><img src='+food_img+' width="70" height="56" /></div>';
                                    str +='<div class="left car_list_info"><p class="car_list_name">'+food_name+'</p><p class="car_list_price">'+sign+price+'</p></div>';
                                    str += '<div class="img_list_price">';
                                    str += '<span class="cut">-</span>';
                                    str += '<span _foodtype="'+type+'" class="order_count mlr5 middle">'+count+'</span>';
                                    str += '<span class="plus" data-type="'+type+'" data-single_num="'+single_num+'" data-per_num="'+per_num+'" data-last_num="'+last_num+'">+</span>';
                                    str += '</div></li>';
                                   */
                                    
                                    
                                    
                                    
                                    if(isNaN(comId) && comId.indexOf('_')){
                                        var ids = comId.split("_");
                                        str += '<li class="car_food_'+ids[0]+'" data-id="'+comId+'">';
                                    }else{
                                        str += '<div class="weui-cell yb-checkout-cont yb-cell-noDowmLine ">';
                                    }
                                    str +='<div class="weui-cell__hd "><img class="yb-checkout-img"src="'+food_img+'" alt=""></div>';
                                   /* str +='<div class="weui-cell__bd"><div><span class="yb-checkout-name">'+food_name+'</span><spanclass="yb-checkout-attrs"> [正常杯] [半糖50%] [去冰]</span></div><div class="yb-checkout-Num">x'+count+'</div></div>';*/
                                   
                                    str +='<div class="weui-cell__bd"><div><span class="yb-checkout-name">'+food_name+'</span></div><div class="yb-checkout-Num">x'+count+'</div></div>';
                                    
                                    str += '<div class="weui-cell__ft"><div class="yb-checkout-price">'+sign+price+'</div></div></div>';
                                   

                					
                                }
                            }

                           /* for(var i in myshop_array[resId]){
                                if(myshop_array[resId][i]){
                                    var food_name = myshop_array[resId][i]['food_name'],
                                        price = myshop_array[resId][i]['food_price'],
                                        count =  myshop_array[resId][i]['amount'],
                                        comId = myshop_array[resId][i]['food_id'],
                                        food_img = myshop_array[resId][i]['food_img'],
                                        // 特价商品
                                        type = myshop_array[resId][i]['type'],
                                        single_num = myshop_array[resId][i]['single_num'];

                                    if(food_img){
                                        food_img = "http://u2.0xiao.cn/"+food_img;
                                    }else{
                                        food_img="http://static.3cfood.com/Public/static/img/dish_nopic.png";
                                    }
                                    kindCount++;
                                    foodTotal += parseInt(count);
                                    priceTotal +=price*count;
                                    price=parseFloat(price).toFixed(2)*1;
                                    if(isNaN(comId) && comId.indexOf('_')){
                                        var ids = comId.split("_");
                                        str += '<li class="car_food_'+ids[0]+'" data-id="'+comId+'">';
                                    }else{
                                        str += '<li class="car_food_'+comId+'" data-id="'+comId+'">';
                                    }
                                    str +='<div class="car_list_box"><img src='+food_img+' width="70" height="56" /></div>';
                                    str +='<div class="left car_list_info"><p class="car_list_name">'+food_name+'</p><p class="car_list_price">'+sign+price+'</p></div>';
                                    str += '<div class="img_list_price">';
                                    str += '<span class="cut">-</span>';
                                    str += '<span _foodtype="'+type+'" class="order_count mlr5 middle">'+count+'</span>';
                                    str += '<span class="plus" data-type="'+type+'" data-single_num="'+single_num+'">+</span>';
                                    str += '</div></li>';
                                }
                            }*/
                            $("#checkoutItems").html("").append(str);
                            priceTotal = priceTotal.toFixed(2)*1;
                            $(".totalAmount").html("¥"+priceTotal);
                            $(".totalCount").html(foodTotal);
                            $("#totalSellPrice").html("¥"+priceTotal);
                            $("#totalamount").val(priceTotal)
                        }else{
                            $("#food_empty").show();
                            $("#food_cars").hide();
                        }
                    }
                }
            }
            $("#car_list .cut").on("touchstart",function(){
                var num = $(this).parent().find("span.order_count").text(),   /*html中计数*/
                    id = $(this).parent().parent().attr('data-id');             /*商品id*/
                if(parseInt(num) >1){
                    num = parseInt(num)-1;
                    $(this).parent().find("span.order_count").text(num);
                    var name = $(this).parent().parent().find(".car_list_name").text(),     /*商品名称*/
                        price = $(this).parent().parent().find(".car_list_price").text(),    /*商品单价*/
                        com_id = $(this).parent().parent().attr("data-id");                  /*商品id*/
                    add_to_foodingcar(com_id,name,price,num);//修改缓存
                    display_food_order_count();//统计
                }else{
                    var comId = $(this).parent().parent().attr("data-id");
                    $(this).parent().find("span.order_count").text(0);
                    $(this).parent().parent().remove();
                    del_foodingcar(comId);//删除缓存的该列菜单
                    display_food_order_count();//统计
                    if($('#with_no_discount_bar').next().length ==0){
                        $('#with_no_discount_bar').remove();
                    }
                }
            });
            $("#car_list .plus").on("touchstart",function(){
                var $this=$(this),
                    num = $this.parent().find("span.order_count").text(),
                    id = $this.parent().parent().data('id');

                //检查限购特价商品
                if($this.data('type') == 1){
                    //特价商品处理
                    var perNum = $this.data('per_num'),     //每人限购数
                            lastNum = $this.data('last_num');   //剩余数
                    perNum = perNum<lastNum?perNum:lastNum;
                    if(num >= perNum){
                        clearpop(jsLangChange('限量')+perNum);
                        return;
                    }
                }

                //检查库存
                if(isNaN(id) && id.indexOf('_')>=0){
                    var ids = id.split("_"),
                        count = 1;
                    id = ids[0];
                    $(".car_food_"+id).find(".order_count").each(function(){
                        count += parseInt($(this).text());
                    });
                }else{
                    count = parseInt($(".car_food_"+id).find(".order_count").text());
                }
                var forcejson = $.parseJSON(forceJson);
                //检查库存
                if(forcejson && forcejson[id] && count > forcejson[id]['stock_count']){
                    clearpop(jsLangChange('库存不足！'));
                    return false;
                }else{
                    num = parseInt(num) + 1;
                    $this.parent().find("span.order_count").text(num);
                }
                var name = $this.parent().parent().find("div.order_li_tit").text(),
                    price = $this.parent().parent().find("span.order_price").text(),
                    com_id = $this.parent().parent().data("id");
                add_to_foodingcar(com_id,name,price,num);//修改缓存
                display_food_order_count();//统计
            });
        }
        //店铺确认订单页统计
        function display_food_order_count(){
            var $body = $("body"),
                    pay_type = $("#is_online_pay").val(),
                    currency = $body.attr("currency"),
                    order_type = $body.attr("order_type"),
                    res_id = $body.data("res_id"),
                    sign = $body.attr("sign"),
                    key = "myfoodArr",
                    myshop = $.cookie(key),
                    extra_fee = $body.attr("extra_fee"),
                    kindCount =0,foodTotal = 0,priceTotal = 0;//foodTotalPrice = 0,
            if(myshop){
                var myshop_array = $.parseJSON(myshop);
                if(myshop_array[res_id]){
                    myshop_array = myshop_array[res_id];
                    for(var i = 0;i < myshop_array.length;i ++){
                        if(myshop_array[i]){
                            var price = myshop_array[i].food_price,
                                count =  myshop_array[i].amount,
                                comId = myshop_array[i].food_id;
                            kindCount++;
                            foodTotal += parseInt(count);
                            priceTotal += price*count;
                        }
                    }
                    /*for(var i in myshop_array){
                        if(myshop_array[i]){
                            var price = myshop_array[i]['food_price'],
                                    count =  myshop_array[i]['amount'],
                                    comId = myshop_array[i]['food_id'];
                            kindCount++;
                            foodTotal += parseInt(count);
                            priceTotal += price*count;
                        }
                    }*/
                }
                priceTotal = priceTotal.toFixed(2)*1;
                $("#foodTotal").text(priceTotal);
                if(priceTotal<=0){
                    emptyCars();
                }
            }
        }
        function sucorder(){
            var foodTotal = $('#foodTotal').text(),
                note = $('#note').val();
            var orderarr = {
                total:foodTotal,
                note:note
            };





            localStorage.setItem("scfoodordermsg",JSON.stringify(orderarr));
            setTimeout(function () {
                window.location.href="/index/balance.html";
            },500);

        }
        /*购物车滑动*/
        function carIscrollInit(carsScroll){
            if(typeof(carsScroll)=="undefined"){
                carsScroll= new IScroll("body",{
                    disableMouse: true,
                    disablePointer: true,
                    scrollbars:false
                })
            }else{
                carsScroll.refresh();
            }
        }
      function edphonehide(){
    	  $("#edphone").hide();
    	  $("#addphone").show();
    	  $("#edtphone").val('');
      }
      
      
      
    	//下单前判断
        function plaorder(){
        	  var paytype=$("input[name='paymethodName']:checked").val();
        	  var mobilephone=$("#phone").val();
        	  var edmobilephone=$("#edtphone").val();
        	  if(mobilephone==""&&edmobilephone==''){
        		  $.toast("请填写联系方式", "text");
        			return false;
        	  }
        	  if(mobilephone!=''&&edmobilephone!=null){
        		  if(!(/^1[3456789]\d{9}$/.test(mobilephone))){ 
            		  $.toast("手机号码有误，请重新填写", "text");
            	        return false; 
            	    } 
        	  
        	  }
        		 
        	
 
        	if(paytype=='pay2'){
				if(issufficient=='0'){
					$.alert("您的会员余额不足", "支付失败", function() {
					
						});
					return false;
				}
				if(issufficient=='1'){
					
					$.confirm({
						  title: '确定支付？',
						  text: ' ',
						  onOK: function () {
							  payorder(paytype)
						  },
						  onCancel: function () {
							  return false;
						  }
						});
				}
				
				if(code=='11'){
					$.modal({
						  title: "确定支付？",
						  text: "会员储值首单免费赠送</br>全场任意送披萨一份和奶茶一杯</br>你还未选择披萨</br>",
						  buttons: [
						    { text: "暂时放弃", className: "default", onClick: function(){ return false;} },
						    { text: "去选择", onClick: function(){window.location="/page/allcategory/process"} },
						    { text: "确定付款",  onClick: function(){ payorder(paytype)} },
						  ]
						});
					
				
				}
				if(code=='12'){
					$.modal({
						  title: "确定支付？",
						  text: "会员储值首单免费赠送</br>全场任意送披萨一份和奶茶一杯</br>你还未选择奶茶</br>",
						  buttons: [
						    { text: "暂时放弃", className: "default", onClick: function(){ return false;} },
						    { text: "去选择", onClick: function(){window.location="/page/allcategory/process"} },
						    { text: "确定付款",  onClick: function(){payorder(paytype)} },
						  ]
						});
					
				}
				if(code=='13'){
					$.modal({
						  title: "确定下单？",
						  text: "会员储值首单免费赠送</br>全场任意送披萨一份和奶茶一杯</br>你还未选择披萨和奶茶</br>",
						  buttons: [
						    { text: "暂时放弃", className: "default", onClick: function(){ return false;} },
						    { text: "去选择", onClick: function(){window.location="/page/allcategory/process"} },
						    { text: "确定付款",  onClick: function(){payorder(paytype)} },
						  ]
						});
					
					
				}
				
				
			}else{
				payorder(paytype)
			}
        

        	
        }
        //支付
       
         function payorder(paytype){
        	 
        	 
        	 $.showLoading("正在付款");
        	 savephone(paytype)
        	
          }
         
         function setorder(paytype){
        	 
        	 var goodlist=$("#goodslist").val();
          	var qctime=$("#OrderTime").html();
          	var remark=$("#Comment").val();
          	var pricetotal=$("#totalamount").val();
          	var totalcount=$(".totalCount").html();
         		$.ajax({
         			url : "/page/order/plaorder",
         			async: true,
         			contentType : "application/x-www-form-urlencoded;charset=utf-8",
         			data : {
         				goodlist : goodlist,
         				qctime:qctime,
         				remark:remark,
         				paytype:paytype,
         				pricetotal:pricetotal,
         				state:'1',
         				totalcount:totalcount
         			},
         			type : "post",
         			success : function(res) {
         				$.hideLoading();
         			
         				$.modal({
   						  title: "支付成功",
   						  text: "<img src='../allcategory/image/cshierweima.jpg' style='width:85%;height:10%'>",
   						  buttons: [
   						    { text: "查看订单",  onClick: function(){window.location="/page/order/showdetails?number="+res} },
   						    { text: "再来一单",  onClick: function(){ window.location="/page/allcategory/process"} },
   						  ]
   						});
         				
         			},
         				
         			error: function () {
         				$.hideLoading();
         			　　　$.toast("支付失败", "cancel");
         			　　}

         		});
         }
         
         // 保存手机号
         function savephone(paytype){
         	var mobilephone=$("#phone").val();
          	 
         	  if(mobilephone!=''&&(/^1[3456789]\d{9}$/.test(mobilephone))){ 
         		  $.ajax({
           			url : "/page/order/savephone",
           			async: true,
           			contentType : "application/x-www-form-urlencoded;charset=utf-8",
           			data : {
           				mobilephone : mobilephone
           				
           			},
           			type : "post",
           			success : function(res) {
           				if(res!='suceess'){
           					setorder(paytype)
           				}
           				
           			
           			},
           				
           			error: function () {
           				$.hideLoading();
           			　　　$.toast("支付失败", "cancel");
           			　　}

           		});
         	    } else{
         	    	setorder(paytype)
         	    }
         }
         
         
        var code=''
		var balance=''
		var issufficient=''
		var maxdel=''
		var totalamount=''
        //初始化下单数据
        function payinit(){
        	var paytype=$("input[name='paymethodName']:checked").val();
        	
        	$.ajax({
    			url : "/page/order/payinit",
    			async: true,
    			contentType : "application/x-www-form-urlencoded;charset=utf-8",
    			data : {
    				goodlist : $("#goodslist").val(),
    				paytype:paytype
    			},
    			type : "post",
    			/*contentType : "application/json;charset=utf-8",*/
    			success : function(res) {
    				code=res.code
    				balance=res.balance
    				issufficient=res.issufficient
    				maxdel=res.maxdel
    				totalamount=res.realmoney
    				if(issufficient=="1"){
    					$('.yb-paymethod-cb').html("(会员余额:"+balance+")");
    				}else if(issufficient=="0"){
    					$('.yb-paymethod-cb').html("(余额不足:"+balance+")");
    				}
    				if(code == '11'){
    					
    					$('#vipdel').show();
    					$('#vipdelnum').html("¥"+maxdel+"&nbsp&nbsp");
    					$("#yb-total-price-vip").html("¥"+totalamount).show();
    				
    					$("#yb-foot-price-vip").html("¥"+totalamount).show();
    				}else if(code  ==  '12'){
    					$('#vipdel').show();
    					$('#vipdelnum').html("¥"+maxdel+"&nbsp&nbsp");
    					$("#yb-total-price-vip").html("¥"+totalamount).show();
    				
    					$("#yb-foot-price-vip").html("¥"+totalamount).show();
    				}else if(code  ==  '13'){
    					$('#vipdel').show();
    					$('#vipdelnum').html("¥"+maxdel+"&nbsp&nbsp");
    					$("#yb-total-price-vip").html("¥"+totalamount).show();
    				
    					$("#yb-foot-price-vip").html("¥"+totalamount).show();
    				}else if(code  ==  '14'){
    					$('#vipdel').show();
    					$('#vipdelnum').html("¥"+maxdel+"&nbsp&nbsp");
    					$("#yb-total-price-vip").html("¥"+totalamount).show();
    					
    					$("#yb-foot-price-vip").html("¥"+totalamount).show();
    				}else if(code  ==  '15'){
    					$('#vipdel').show();
    					$('#vipdelnum').html("¥"+maxdel+"&nbsp&nbsp");
    					$("#yb-total-price-vip").html("¥"+totalamount).show();
    				
    					$("#yb-foot-price-vip").html("¥"+totalamount).show();
    				}else if(code  ==  '21'){
    					$('#vipdel').hide();
    					$("#yb-total-price").show();
    					$("#yb-foot-price").html("¥"+totalamount).show();
    				}else if(code  ==  '22'){
    					$('#vipdel').hide();
    					$("#yb-total-price").show();
    					$("#yb-foot-price").html("¥"+totalamount).show();
    				}else{
    					　$.toast("数据异常", "forbidden");
    				}
    				
    			}

    		});

        	
        }
        
        function showdetails(number){
        	
    	   window.location="/page/order/showdetails?number="+number;

        }
        
        $('.yb-charge-btn').on('click',function(){
        	
            window.location="/page/customer/member";
        });
        
        
       
        
  $('.weixinpay').on('click',function(){
	  var paytype=$("input[name='paymethodName']:checked").val();
	  if(paytype=='pay4'){
		  
		$('#vipdel').hide();
		$("#yb-total-price-vip").hide()
		$("#yb-total-price").show();
		$("#yb-foot-price-vip").hide()
		$("#yb-foot-price").show();
	  }
          
        });
  
  
  $('.vippay').on('click',function(){
	  var paytype=$("input[name='paymethodName']:checked").val();
	  if(paytype=='pay4'){
		  if(issufficient=="1"){
				$('.yb-paymethod-cb').html("(会员余额:"+balance+")");
			}else{
				$('.yb-paymethod-cb').html("(余额不足:"+balance+")");
			}
			if(code == '11'){
				
				$('#vipdel').show();
				$('#vipdelnum').html("¥"+maxdel+"&nbsp&nbsp");
				$("#yb-total-price").hide();
				$("#yb-total-price-vip").html("¥"+totalamount).show();
				$("#yb-foot-price").hide();
				$("#yb-foot-price-vip").html("¥"+totalamount).show();
			}else if(code  ==  '12'){
				$('#vipdel').show();
				$('#vipdelnum').html("¥"+maxdel+"&nbsp&nbsp");
				$("#yb-total-price").hide();
				$("#yb-total-price-vip").html("¥"+totalamount).show();
				$("#yb-foot-price").hide();
				$("#yb-foot-price-vip").html("¥"+totalamount).show();
			}else if(code  ==  '13'){
				$('#vipdel').show();
				$('#vipdelnum').html("¥"+maxdel+"&nbsp&nbsp");
				$("#yb-total-price").hide();
				$("#yb-total-price-vip").html("¥"+totalamount).show();
				$("#yb-foot-price").hide();
				$("#yb-foot-price-vip").html("¥"+totalamount).show();
			}else if(code  ==  '14'){
				$('#vipdel').show();
				$('#vipdelnum').html("¥"+maxdel+"&nbsp&nbsp");
				$("#yb-total-price").hide();
				$("#yb-total-price-vip").html("¥"+totalamount).show();
				$("#yb-foot-price").hide();
				$("#yb-foot-price-vip").html("¥"+totalamount).show();
			}else if(code  ==  '15'){
				$('#vipdel').show();
				$('#vipdelnum').html("¥"+maxdel+"&nbsp&nbsp");
				$("#yb-total-price").hide();
				$("#yb-total-price-vip").html("¥"+totalamount).show();
				$("#yb-foot-price").hide();
				$("#yb-foot-price-vip").html("¥"+totalamount).show();
			}else if(code  ==  '21'){
				$('#vipdel').hide();
				$("#yb-total-price").show();
				$("#yb-foot-price").html("¥"+totalamount).show();
			}else if(code  ==  '22'){
				$('#vipdel').hide();
				$("#yb-total-price").show();
				$("#yb-foot-price").html("¥"+totalamount).show();
			}else{
				
			}
	  }
     
   });
     
        