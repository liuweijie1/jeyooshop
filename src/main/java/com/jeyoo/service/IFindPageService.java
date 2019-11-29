package com.jeyoo.service;

import java.util.Map;

import com.github.pagehelper.PageInfo;

public interface IFindPageService<T> {
	
	/**
	 * 查询分页
	 * @param paramMap
	 * @return
	 */
	PageInfo<T> findPage(Map<String, String> paramMap);
}
