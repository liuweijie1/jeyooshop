package com.jeyoo.service;

import java.util.List;
import java.util.Map;


import com.github.pagehelper.PageInfo;
import com.jeyoo.pojo.UserContact;
import com.jeyoo.pojo.UserContactattachment;
import com.jeyoo.resultpojo.UserContactResult;


public interface UserContactManageService {
	
   

	/**
	 * 分頁查詢列表
	 * @param paramMap
	 * @return
	 */
	public PageInfo<UserContactResult>  findUserContact(Map<String, String> paramMap);

	/**
	 * 根據ID查詢聯絡我們
	 * @param paramMap
	 * @return UserContact
	 */
	public UserContactResult getUserContactById(Map<String, String> paramMap);

	/**
	 * 根據父ID查詢附件詳情
	 * @param paramMap
	 * @return List<UserContactattachment>
	 */
	public Map<String,Object> getTachmentById(Map<String, String> paramMap); 
    
}
