package com.house730.admin.mapper;

import com.house730.admin.pojo.UserSubcribe;

public interface UserSubcribeMapper {
    int insert(UserSubcribe record);

    int insertSelective(UserSubcribe record);
}