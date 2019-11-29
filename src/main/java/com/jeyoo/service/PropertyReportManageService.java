package com.jeyoo.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageInfo;
import com.jeyoo.pojo.PropertyReport;


public interface PropertyReportManageService {
	
    /**
     * 分页查询检举列表
     * @return PageInfo<PropertyReport>
     */

	public PageInfo<PropertyReport>  findPropertyReport(Map<String, String> paramMap);

	void downExcel(Map<String,String> search, HttpServletResponse response); 
    
}
