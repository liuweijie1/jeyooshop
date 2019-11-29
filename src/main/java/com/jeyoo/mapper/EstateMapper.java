package com.jeyoo.mapper;

import com.jeyoo.pojo.Estate;

public interface EstateMapper {
    int insert(Estate record);

    int insertSelective(Estate record);
}