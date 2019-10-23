package com.house730.admin.mapper;

import com.house730.admin.pojo.UserSeedDealLog;

public interface UserSeedDealLogMapper {
    int insert(UserSeedDealLog record);

    int insertSelective(UserSeedDealLog record);
}