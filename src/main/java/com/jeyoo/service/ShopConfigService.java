package com.jeyoo.service;

import com.github.pagehelper.PageInfo;
import com.jeyoo.pojo.UserDepartment;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface ShopConfigService {

	 /**
     * 查询店铺在线信息
     * 1在线，0下线
     * @param shopid 店铺ID
     */
	String getShopStauts(HttpServletRequest request);
}
