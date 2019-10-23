package com.house730.admin.mapper;

import java.util.List;
import java.util.Map;

import com.house730.admin.pojo.PropertyReport;

/**
 * @author liuwj
 *
 */
public interface PropertyReportMapper {
	
    int insert(PropertyReport record);

    int insertSelective(PropertyReport record);
    
    List<PropertyReport> queryPropertyReportList(Map<String, String> paramMap);

	


}