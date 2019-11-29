package com.jeyoo.mapper;

import com.jeyoo.pojo.CommonImage;

public interface CommonImageMapper {
    int insert(CommonImage record);

    int insertSelective(CommonImage record);
}