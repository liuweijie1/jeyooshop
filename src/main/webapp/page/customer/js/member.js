function Amoptions(obj){
	$(".borde-red").removeClass("borde-red")
	$(obj).addClass("borde-red");
	var option=$(".borde-red").find('input').val();
	$(".new-couponBtn").html("立即支付 | ¥"+option)
}

function recharge(obj){
	
	var option=$(".borde-red").find('input').val();
	
	
}

function getmember(){
	
	   window.location="/page/customer/member";
	
	
}