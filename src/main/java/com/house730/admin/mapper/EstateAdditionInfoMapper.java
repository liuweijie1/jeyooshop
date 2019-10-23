package com.house730.admin.mapper;

import com.house730.admin.pojo.EstateAdditionInfo;

public interface EstateAdditionInfoMapper {
    int insert(EstateAdditionInfo record);

    int insertSelective(EstateAdditionInfo record);
}