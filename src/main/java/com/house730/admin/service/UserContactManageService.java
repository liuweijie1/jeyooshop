package com.house730.admin.service;

import java.util.List;
import java.util.Map;


import com.github.pagehelper.PageInfo;
import com.house730.admin.pojo.UserContact;
import com.house730.admin.pojo.UserContactattachment;
import com.house730.admin.resultpojo.UserContactResult;


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
