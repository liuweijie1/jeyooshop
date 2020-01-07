package com.jeyoo.service.impl;


import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jeyoo.Exception.ExceptionEnum;
import com.jeyoo.Exception.JeyooException;
import com.jeyoo.mapper.GoodsMapper;
import com.jeyoo.mapper.OrderMapper;
import com.jeyoo.mapper.UserLeaveMessageMapper;
import com.jeyoo.mapper.UserMapper;
import com.jeyoo.pojo.Goods;
import com.jeyoo.pojo.Order;
import com.jeyoo.pojo.User;
import com.jeyoo.service.OrderService;
import com.jeyoo.utils.ID;

import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import java.math.BigDecimal;
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
	@Autowired
	private UserMapper mapper;
	@Override
	public Map<String, String> cheakOrder(User user, String goodsmap,String paytype) {
		// 加入中间表
		int pisa = 0;
		int naicha = 0;
		BigDecimal total = new BigDecimal(0.00);
		BigDecimal maxDel = new BigDecimal(0.00);

		String code = null;
		String issufficient = null;
		List<BigDecimal> pisaDel = new ArrayList<BigDecimal>();
		pisaDel.add(new BigDecimal(0.00));
		List<BigDecimal> naichaDel = new ArrayList<BigDecimal>();
		naichaDel.add(new BigDecimal(0.00));
		BigDecimal money = user.getBalance();
		Map<String, String> resMap = new HashMap<>();
		try {
			Map<String, Object> map = JSONArray.parseObject(goodsmap);
			List goods = (List) map.get("7727");
			for (int i = 0; i < goods.size(); i++) {
				Map<String, Object> goodmap = new HashMap<>();
				goodmap = (Map<String, Object>) goods.get(i);
				// 后台计算商品总价格
				int amount = Integer.valueOf(goodmap.get("amount").toString());
				Long foodid = Long.valueOf(goodmap.get("food_id").toString());
				String foodtype = String.valueOf(goodmap.get("food_type"));
				Goods gd = new Goods();
				gd.setGoodid(Long.valueOf(goodmap.get("food_id").toString()));
				Goods good = goodsmapper.getFood(gd);
				total = total.add(good.getFoodprice().multiply(BigDecimal.valueOf(amount)));

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
			if ("pay2".equals(paytype)) {
				int state = user.getVipstate();
				if (1 == state) {// 刚充值

					if (pisa == 0) {// 未选择披萨
						code = "11";
					}
					if (naicha == 0) {// 未选择奶茶
						code = "12";
					}
					if (naicha == 0 && pisa == 0) {// 奶茶和披萨都未选择
						code = "13";
					}
					maxDel = Collections.max(pisaDel).add(Collections.max(naichaDel));
					BigDecimal realmoney = total.subtract(maxDel);
					if (naicha > 0 && pisa > 0) {
						if (money.subtract(realmoney).compareTo(realmoney) >= 0) {
							code = "14";// 可正常支付
						} else {
							code = "15";// 最大减免后余额不足
						}
					}
                    //判断余额是否足够
					if (money.subtract(realmoney).compareTo(realmoney) >= 0) {
						issufficient = "1";// 可正常支付
					} else {
						issufficient = "0";// 最大减免后余额不足
					}

				} else if (0 == state) {// 未充值或充值后二次使用

					if (money.compareTo(total) >= 0) {
						issufficient = "1";// 可正常支付
						code = "21";// 正常支付
					} else {
						code = "22";// 余额不足
						issufficient = "0";// 最大减免后余额不足
					}

				} else {
					code = "10";// 无会员参数
				}
				resMap.put("code", code);
				resMap.put("balance", String.valueOf(money));
				resMap.put("maxdel", String.valueOf(maxDel));
				resMap.put("issufficient", issufficient);
				resMap.put("realmoney", String.valueOf(total.subtract(maxDel)));
				resMap.put("totalmoney", String.valueOf(total));
				return resMap;
			} else  if("pay4".equals(paytype)){
				
				//resMap.put("code", code); 
				//resMap.put("balance", String.valueOf(money));
				// resMap.put("issufficient", issufficient);
				resMap.put("maxdel", String.valueOf(maxDel));
				resMap.put("realmoney", String.valueOf(total.subtract(maxDel)));
				resMap.put("totalmoney", String.valueOf(total));
				return resMap;
			}else {
				code = "9";// 支付类型错误
				resMap.put("code", code); 
				return resMap;
			}

		} catch (Exception e) {

			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			throw new JeyooException(ExceptionEnum.SERVER_ERROR);
		}
	

	}

	@Override
	@Transactional
	public String plaOrder(long userid,String goodsmap, String qctime, String remark, String pricetotal,String state,int totalcount,String paytype,Map<String,String> paymap) {
	    
		Long orderid=ID.getId();
		BigDecimal total=new BigDecimal(paymap.get("totalmoney")) ;
		BigDecimal realmoney=new BigDecimal(paymap.get("realmoney")) ;
		BigDecimal maxdel=new BigDecimal(paymap.get("maxdel")) ;

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
		    //total.add(good.getFoodprice().multiply(BigDecimal.valueOf(amount)) );
			//插入中间表
			ordermapper.insert_Goods(ID.getId(),orderid,foodid,amount);
			
		}
		
	    //新增订单主表
		Order order =new Order();
		order.setOrderid(orderid);
		order.setUserid(userid);
		order.setTotalmoney(total);
		order.setRealmoney(realmoney);
		order.setMaxdel(maxdel);
		String number=getOrderIdByTime();
		order.setNumber(number);
		order.setDeliverytime(qctime);
		order.setState(Integer.valueOf(state));
		order.setRemark(remark);
		order.setPaymenttype(paytype);
		order.setTotalcount(totalcount);
		int i=ordermapper.insert(order);
		if(i!=1) {
			throw new JeyooException(ExceptionEnum.SERVER_ERROR);
		}
		return number;
		} catch (Exception e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			
			throw new JeyooException(ExceptionEnum.SERVER_ERROR);
		}
	}
	
	// 会员支付扣除金额并增加消费记录
	@Override
	public void setVipPay(User user, Map<String, String> map,String number) {
		
		try {
			BigDecimal realmoney = new BigDecimal(map.get("realmoney"));
			BigDecimal balance = user.getBalance().subtract(realmoney);
			if (balance.compareTo(new BigDecimal(0)) >= 0) {
				mapper.setVipPay(user.getUserid(),balance);
				ordermapper.insertRecord(user.getUserid(),ID.getId(),-1,"会员支付",realmoney,number);
			} else {
				throw new JeyooException(ExceptionEnum.SERVER_ERROR);
			}

		} catch (Exception e) {
			e.printStackTrace();
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
	public List<Order> getOrderToday() {
		 List<Order> order = ordermapper.getOrderToday();
		return order;
	}

	@Override
	public List<Order> queryOrderDetails(String number) {
		 List<Order> order = ordermapper.queryOrderDetails(number);
		return order;
	}

	@Override
	public int qrBuy(String number) {
		return ordermapper.qrBuy(number);
		
	}


	
	
}
