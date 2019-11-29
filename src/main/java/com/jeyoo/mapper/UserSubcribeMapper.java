package com.jeyoo.mapper;

import com.jeyoo.pojo.UserSubcribe;

public interface UserSubcribeMapper {
    int insert(UserSubcribe record);

    int insertSelective(UserSubcribe record);
}