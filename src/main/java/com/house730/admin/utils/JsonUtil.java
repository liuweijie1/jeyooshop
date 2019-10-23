package com.house730.admin.utils;

import com.alibaba.fastjson.JSON;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.List;

/**
 * JSON转换工具类 
 */
public class JsonUtil {
				
	private static Logger logger = LoggerFactory.getLogger(JsonUtil.class);
	
	 /**
     * 解析JsonObject数据
     * 
     * @param jsonString
     *            Json格式字符串
     * @param cls
     *            封装类
     * 
     */
    public static <T> T parseObject(String jsonString, Class<T> cls) {
        T t = null;
        try {
            t = JSON.parseObject(jsonString, cls);
        } catch (Exception e) {
            logger.error(e.toString());
        }
        return t;
    }

    /**
     * 解析JsonArray数据
     * 
     * @param jsonString
     * @param cls
     * @return
     */
    public static <T> List<T> parseArray(String jsonString, Class<T> cls) {
        List<T> list = new ArrayList<T>();
        try {
            list = JSON.parseArray(jsonString, cls);
        } catch (Exception e) {
            logger.error(e.toString());
        }
        return list;
    }

    /**
     * 解析list转换为json
     * @param lists 传入的List
     * @return
     */
    public static <T> String parseList(List<T>  lists) {
    	
    	String num ="";
    	try {
    		ObjectMapper objectMapper = new ObjectMapper();
			num= objectMapper.writeValueAsString(lists);
		} catch (JsonProcessingException e) {
			logger.error(e.toString());
		}
    	return num;
    }
	
    
    
    
}
