package com.jeyoo.mapper;

import java.util.List;
import java.util.Map;

import com.jeyoo.pojo.PropertyReport;

/**
 * @author liuwj
 *
 */
public interface PropertyReportMapper {
	
    int insert(PropertyReport record);

    int insertSelective(PropertyReport record);
    
    List<PropertyReport> queryPropertyReportList(Map<String, String> paramMap);

	


}