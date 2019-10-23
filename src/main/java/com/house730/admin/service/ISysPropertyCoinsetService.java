package com.house730.admin.service;

import java.util.List;
import java.util.Map;

import com.github.pagehelper.PageInfo;
import com.house730.admin.pojo.SysPropertyCoinset;

/**
 * 放盤service
 * @author wbqiutj
 *	2019年4月28日
 */
public interface ISysPropertyCoinsetService{
	
	PageInfo<SysPropertyCoinset> findCoinsetPage(Map<String, Object> paramMap);
	
	int insertCoinset(List<SysPropertyCoinset> coinset);
	
	void upOrDownCoinset(Integer setid);
	
}
