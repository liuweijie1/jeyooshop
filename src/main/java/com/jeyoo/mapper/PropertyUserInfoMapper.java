package com.jeyoo.mapper;

import com.jeyoo.pojo.PropertyUserInfo;

public interface PropertyUserInfoMapper {
    int insert(PropertyUserInfo record);

    int insertSelective(PropertyUserInfo record);
}