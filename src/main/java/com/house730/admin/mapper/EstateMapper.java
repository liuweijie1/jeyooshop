package com.house730.admin.mapper;

import com.house730.admin.pojo.Estate;

public interface EstateMapper {
    int insert(Estate record);

    int insertSelective(Estate record);
}