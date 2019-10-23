package com.house730.admin.mapper;

import java.util.List;
import java.util.Map;


import com.house730.admin.pojo.UserContact;
import com.house730.admin.pojo.UserContactattachment;
import com.house730.admin.resultpojo.UserContactResult;

public interface UserContactMapper {
    int insert(UserContact record);

    int insertSelective(UserContact record);

    /**
     * 查询联络我们
     * @param paramMap
     * @return
     */
    List<UserContactResult> queryList(Map<String, String> paramMap) ;

	/**
	 * 根據父ID查詢詳情
	 * @param paramMap
	 * @return
	 */
	List<UserContactattachment> getTachmentById(Map<String, String> paramMap);
}