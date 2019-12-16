package com.jeyoo.service.impl;


import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jeyoo.Exception.ExceptionEnum;
import com.jeyoo.Exception.JeyooException;
import com.jeyoo.mapper.GoodsMapper;
import com.jeyoo.mapper.OrderMapper;
import com.jeyoo.mapper.UserLeaveMessageMapper;
import com.jeyoo.pojo.Goods;
import com.jeyoo.pojo.Order;
import com.jeyoo.service.OrderService;
import com.jeyoo.utils.ID;

import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

@Service
@Slf4j
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderMapper ordermapper;
	@Autowired
	private GoodsMapper goodsmapper;
	
	
	
	@Override
	public void cheakOrder(String userid, String goodsmap) {
		// 加入中间表
		int pisa = 0;
		int naicha = 0;
		double total = 0.00;
		String code = null;
		List<Double> pisaDel = new ArrayList<Double>();
		List<Double> naichaDel = new ArrayList<Double>();
		double money = 0.00;
	

			Map<String, Object> map = JSONArray.parseObject(goodsmap);
			List goods = (List) map.get("7727");
			for (int i = 0; i < goods.size(); i++) {
				Map<String, Object> goodmap = new HashMap<>();
				goodmap = (Map<String, Object>) goods.get(i);
				// 后台计算商品总价格
				int amount = Integer.valueOf(goodmap.get("amount").toString());
				Long foodid = Long.valueOf(goodmap.get("food_id").toString());
				String foodtype = (String) goodmap.get("food_type");
				Goods gd = new Goods();
				gd.setGoodid(Long.valueOf(goodmap.get("food_id").toString()));
				Goods good = goodsmapper.getFood(gd);
				total += good.getFoodprice() * amount;// 总价格
				
				
				// 判断有没有披萨或奶茶，并计算最大减免金额
				if ("1".equals(foodtype)) {
					pisa = +1;
					pisaDel.add(good.getFoodprice());
				}
				if ("2".equals(foodtype)) {
					naicha = +1;
					naichaDel.add(good.getFoodprice());
				}
			}
			
			if (1 == 1) {

			if (pisa == 0) {
				code = "11";
			}
			if (naicha == 0) {
				code = "12";
			}
			if (naicha == 0 && pisa == 0) {
				code = "13";
			}
			if (naicha > 0 && pisa > 0) {
				double maxDel = Collections.max(pisaDel) + Collections.max(naichaDel);
				if (money-(total - maxDel)> 0) {
					code = "14";
				} else {
					code = "15";
				}
			}
		} else {
			if(money-total>0) {
				code = "21";
			}else {
				code = "22";
			}

		}
	}
	
	@Override
	@Transactional
	public void plaOrder(String userid,String goodsmap, String qctime, String remark, String pricetotal,String state,int totalcount) {
	    
		Long orderid=ID.getId();
		double total=0.00;

		try {
		//加入中间表
		Map<String, Object> map=JSONArray.parseObject(goodsmap);
		List goods=  (List) map.get("7727");
		for (int i = 0; i < goods.size(); i++) {
			Map<String, Object> goodmap=new HashMap<>();
			goodmap=(Map<String, Object>) goods.get(i);
			//后台计算商品总价格
			int amount=Integer.valueOf(goodmap.get("amount").toString());
			Long foodid=Long.valueOf(goodmap.get("food_id").toString());
			Goods gd=new Goods();
			gd.setGoodid(Long.valueOf(goodmap.get("food_id").toString()));
			Goods good=goodsmapper.getFood(gd);
			total+=good.getFoodprice() * amount;
			//插入中间表
		
			ordermapper.insert_Goods(ID.getId(),orderid,foodid,amount);
			
		}
		
	    //新增订单主表
		Order order =new Order();
		order.setOrderid(orderid);
		//order.setUserid(Long.valueOf(userid));
		long useridt=122323;
		order.setUserid(useridt);
		order.setTotalmoney(total);
		order.setNumber(getOrderIdByTime());
		order.setDeliverytime(qctime);
		order.setState(Integer.valueOf(state));
		order.setRemark(remark);
		order.setTotalcount(totalcount);
		ordermapper.insert(order);
		} catch (Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			log.error("下单异常异常" + e.getMessage());
			throw new JeyooException(ExceptionEnum.SERVER_ERROR);
		}
	}
      //生成订单号
	  public  String getOrderIdByTime() {
	        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
	        String newDate=sdf.format(new Date());
	        String result="";
	        Random random=new Random();
	        for(int i=0;i<3;i++){
	            result+=random.nextInt(10);
	        }
	        return newDate+result;
	    }

	@Override
	public List<Order> getOrder(String number) {
		 List<Order> order = ordermapper.getOrder( number);
		 return order;
	}
	
	@Override
	public List<Order> queryOrderDetails(String number) {
		 List<Order> order = ordermapper.queryOrderDetails(number);
		return order;
	}
	
	
}
