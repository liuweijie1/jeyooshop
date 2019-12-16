package com.jeyoo.service;

import com.github.pagehelper.PageInfo;
import com.jeyoo.pojo.Order;
import com.jeyoo.pojo.User;

import java.util.List;
import java.util.Map;

public interface OrderService {

	void plaOrder(String userid,String goodlist, String qctime, String remark, String pricetotal,String state, int totalcount);


	List<Order> getOrder(String number);

	List<Order> queryOrderDetails(String number);


	void cheakOrder(String userid, String goodlist);


	
    
	

	


   // Map<String,Object> recharge(Map<String, Object> paramMap);
}
