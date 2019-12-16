package com.jeyoo.mapper;

import com.jeyoo.pojo.AdminDepartment;
import com.jeyoo.pojo.ShopConfig;


public interface ShopConfigMapper {
   
	
    /**
     * 查询店铺在线信息
     * 1在线，0下线
     * @param shopid 店铺ID
     */
	ShopConfig getShopConfig(long shopid);
}