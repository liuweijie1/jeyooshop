package com.jeyoo.mapper;

import com.jeyoo.pojo.School;

public interface SchoolMapper {
    int insert(School record);

    int insertSelective(School record);
}