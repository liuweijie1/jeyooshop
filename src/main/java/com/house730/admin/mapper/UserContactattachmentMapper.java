package com.house730.admin.mapper;

import java.util.List;
import java.util.Map;

import com.house730.admin.pojo.UserContactattachment;

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