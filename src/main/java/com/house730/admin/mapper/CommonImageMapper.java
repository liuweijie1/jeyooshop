package com.house730.admin.mapper;

import com.house730.admin.pojo.CommonImage;

public interface CommonImageMapper {
    int insert(CommonImage record);

    int insertSelective(CommonImage record);
}