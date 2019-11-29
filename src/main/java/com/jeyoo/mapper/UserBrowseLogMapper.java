package com.jeyoo.mapper;

import com.jeyoo.pojo.UserBrowseLog;

public interface UserBrowseLogMapper {
    int insert(UserBrowseLog record);

    int insertSelective(UserBrowseLog record);
}