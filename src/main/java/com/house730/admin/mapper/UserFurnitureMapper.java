package com.house730.admin.mapper;

import com.house730.admin.pojo.UserFurniture;

public interface UserFurnitureMapper {
    int insert(UserFurniture record);

    int insertSelective(UserFurniture record);
}