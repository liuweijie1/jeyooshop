package com.jeyoo.service.impl;


import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.jeyoo.Exception.ExceptionEnum;
import com.jeyoo.Exception.JeyooException;
import com.jeyoo.mapper.GoodsMapper;
import com.jeyoo.mapper.OrderMapper;
import com.jeyoo.mapper.ShopConfigMapper;
import com.jeyoo.mapper.UserLeaveMessageMapper;
import com.jeyoo.pojo.Goods;
import com.jeyoo.pojo.Order;
import com.jeyoo.pojo.ShopConfig;
import com.jeyoo.service.OrderService;
import com.jeyoo.service.ShopConfigService;
import com.jeyoo.utils.ID;

import lombok.extern.slf4j.Slf4j;

import org.apache.commons.lang.StringUtils;
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

import javax.servlet.http.HttpServletRequest;

@Service
@Slf4j
public class ShopConfigServiceImpl implements ShopConfigService{
	
	@Autowired
	private ShopConfigMapper shopConfigmapper;
	@Autowired
	private GoodsMapper goodsmapper;

	
	@Override
	public String getShopStauts(HttpServletRequest request) {
		
	/*	//判断店铺参数是否存在
		String shopid = request.getParameter("shopid") == null ? "": request.getParameter("shopid").toString();
		if (StringUtils.isBlank(shopid)) {
			shopid = request.getSession().getAttribute("shopid")==null ? "": request.getSession().getAttribute("shopid").toString();
			
		}
		
		if (StringUtils.isBlank(shopid)) {
			request.getSession().setAttribute("shopid", "");
			return "";
		}
		
		request.getSession().setAttribute("shopid", shopid);
		//根据shopid,时间、状态查询店铺
		ShopConfig shopConfig=shopConfigmapper.getShopConfig(shopid);
		if(shopConfig==null) {
			log.info("店铺不在时效范围内");
			return "0";
		}
		
		*/
		
		
		return "1";
	}
	
	
	
	
	
}
