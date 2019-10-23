package com.house730.admin.mapper;

import com.house730.admin.pojo.PropertyUserInfo;

public interface PropertyUserInfoMapper {
    int insert(PropertyUserInfo record);

    int insertSelective(PropertyUserInfo record);
}