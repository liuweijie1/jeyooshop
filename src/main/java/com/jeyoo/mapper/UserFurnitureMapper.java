package com.jeyoo.mapper;

import com.jeyoo.pojo.UserFurniture;

public interface UserFurnitureMapper {
    int insert(UserFurniture record);

    int insertSelective(UserFurniture record);
}