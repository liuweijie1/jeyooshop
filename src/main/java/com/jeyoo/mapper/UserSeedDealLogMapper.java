package com.jeyoo.mapper;

import com.jeyoo.pojo.UserSeedDealLog;

public interface UserSeedDealLogMapper {
    int insert(UserSeedDealLog record);

    int insertSelective(UserSeedDealLog record);
}