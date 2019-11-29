package com.jeyoo.mapper;

import com.jeyoo.pojo.UserUsageRecord;

public interface UserUsageRecordMapper {
    int insert(UserUsageRecord record);

    int insertSelective(UserUsageRecord record);
}