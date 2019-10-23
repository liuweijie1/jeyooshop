package com.house730.admin.mapper;

import com.house730.admin.pojo.UserUsageRecord;

public interface UserUsageRecordMapper {
    int insert(UserUsageRecord record);

    int insertSelective(UserUsageRecord record);
}