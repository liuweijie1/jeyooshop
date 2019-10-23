package com.house730.admin.mapper;

import com.house730.admin.pojo.Building;

public interface BuildingMapper {
    int insert(Building record);

    int insertSelective(Building record);
}