package com.jeyoo.mapper;

import com.jeyoo.pojo.PropertyImage;

public interface PropertyImageMapper {
    int insert(PropertyImage record);

    int insertSelective(PropertyImage record);
}