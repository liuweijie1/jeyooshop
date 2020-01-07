package com.jeyoo.mapper;

import java.math.BigDecimal;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.jeyoo.pojo.Order;

public interface OrderMapper {

	int insert(long id, String userid, Long valueOf, String pricetotal, String qctime, String state, String remark);

	int insert(Order order);

	int insert_Goods(@Param("ordergoodid")long id, @Param("orderid")long orderid, @Param("goodsid")long goodsid, @Param("amount")int amount);


	List<Order> getOrder(@Param("number")String number);


	List<Order> queryOrderDetails(@Param("number")String number);

	void insertRecord(@Param("userid")long userid, @Param("recordid")long recordid, @Param("type") int type, @Param("title")String title, @Param("amount")BigDecimal amount, @Param("number")String number);

	int qrBuy(@Param("number") String number);

	List<Order> getOrderToday();
    
}