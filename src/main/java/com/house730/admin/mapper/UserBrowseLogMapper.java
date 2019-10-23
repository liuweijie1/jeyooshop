package com.house730.admin.mapper;

import com.house730.admin.pojo.UserBrowseLog;

public interface UserBrowseLogMapper {
    int insert(UserBrowseLog record);

    int insertSelective(UserBrowseLog record);
}