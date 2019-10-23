package com.house730.admin.mapper;

import com.house730.admin.pojo.School;

public interface SchoolMapper {
    int insert(School record);

    int insertSelective(School record);
}