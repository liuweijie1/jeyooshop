package com.jeyoo.service;

import java.util.Map;

import com.github.pagehelper.PageInfo;
import com.jeyoo.resultpojo.PropertyReleaseResult;

/**
 * 放盤service
 * @author wbqiutj
 *	2019年4月28日
 */
public interface IPropertyReleaseService{
	
	public PropertyReleaseResult findReleaseDetailByPropertyId(Long propertyid);
	
	void upOrDownProperty(Long propertyId,Boolean isadminoffline);
	
	PageInfo<PropertyReleaseResult> findReleasePage(Map<String, Object> paramMap);
	
	int releaseApply(Long propertyId,Boolean apply);
}
