package com.jeyoo.mapper;

import com.jeyoo.pojo.EstateAdditionInfo;

public interface EstateAdditionInfoMapper {
    int insert(EstateAdditionInfo record);

    int insertSelective(EstateAdditionInfo record);
}