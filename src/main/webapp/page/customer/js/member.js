function Amoptions(obj){
	$(".borde-red").removeClass("borde-red")
	$(obj).addClass("borde-red");
	var option=$(".borde-red").find("input[id='num']").val();
	var plus=$(".borde-red").find("input[id='plus']").val();
	var total=parseInt(option)+parseInt(plus);
	$(".new-couponBtn").html("支付¥"+option +" | 到账¥"+total)
}

function recharge(obj){
	
	var option=$(".borde-red").find('input').val();
	
	
}

function getmember(){
	
	   window.location="/page/customer/member";
	
	
}