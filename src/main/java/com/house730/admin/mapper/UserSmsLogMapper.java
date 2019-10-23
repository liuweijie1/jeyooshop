package com.house730.admin.mapper;

import com.house730.admin.pojo.UserSmsLog;

public interface UserSmsLogMapper {
    int insert(UserSmsLog record);

    int insertSelective(UserSmsLog record);
}