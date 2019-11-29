package com.jeyoo.mapper;

import com.jeyoo.pojo.EstateImage;

public interface EstateImageMapper {
    int insert(EstateImage record);

    int insertSelective(EstateImage record);
}