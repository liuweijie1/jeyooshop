package com.jeyoo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jeyoo.pojo.AdminDepartment;
import com.jeyoo.pojo.Order;

public interface OrderMapper {

	int insert(long id, String userid, Long valueOf, String pricetotal, String qctime, String state, String remark);

	int insert(Order order);

	int insert_Goods(@Param("ordergoodid")long id, @Param("orderid")long orderid, @Param("goodsid")long goodsid, @Param("amount")int amount);


	List<Order> getOrder(@Param("number")String number);


	List<Order> queryOrderDetails(@Param("number")String number);
    
}