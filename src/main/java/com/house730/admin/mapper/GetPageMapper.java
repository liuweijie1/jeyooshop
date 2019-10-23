package com.house730.admin.mapper;

import java.util.List;
import java.util.Map;

/**
 * 公共接口
 * @author wbqiutj
 *
 * @param <T>
 */
public interface GetPageMapper<T> {
    
	List<T> getPage(Map<String, String> paramMap);
}