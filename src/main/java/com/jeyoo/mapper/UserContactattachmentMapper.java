package com.jeyoo.mapper;

import java.util.List;
import java.util.Map;

import com.jeyoo.pojo.UserContactattachment;

public interface UserContactattachmentMapper {
    int insert(UserContactattachment record);

    int insertSelective(UserContactattachment record);

	/**
	 * 根據ID查詢附件詳情
	 * @param paramMap
	 * @return
	 */
	List<UserContactattachment> queryList(Map<String, String> paramMap);
}