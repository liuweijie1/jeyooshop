package com.jeyoo.mapper;

import com.jeyoo.pojo.GeoGscope;

public interface GeoGscopeMapper {
    int insert(GeoGscope record);

    int insertSelective(GeoGscope record);
}