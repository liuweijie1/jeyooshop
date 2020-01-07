package com.jeyoo.service;

import com.jeyoo.pojo.Order;
import com.jeyoo.pojo.User;
import java.util.List;
import java.util.Map;

public interface OrderService {

	


	List<Order> getOrder(String number);

	List<Order> queryOrderDetails(String number);


	Map<String, String> cheakOrder(User user, String goodsmap, String paytype);


	String plaOrder(long l, String goodsmap, String qctime, String remark, String pricetotal, String state,
			int totalcount, String paytype, Map<String, String> map);

	void setVipPay(User user, Map<String, String> map, String number);

	int qrBuy(String number);

	List<Order> getOrderToday();


	
    
	

	


   // Map<String,Object> recharge(Map<String, Object> paramMap);
}
