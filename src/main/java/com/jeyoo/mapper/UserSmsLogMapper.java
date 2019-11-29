package com.jeyoo.mapper;

import com.jeyoo.pojo.UserSmsLog;

public interface UserSmsLogMapper {
    int insert(UserSmsLog record);

    int insertSelective(UserSmsLog record);
}