package com.jeyoo.mapper;

import com.jeyoo.pojo.Building;

public interface BuildingMapper {
    int insert(Building record);

    int insertSelective(Building record);
}