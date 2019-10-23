package com.house730.admin.mapper;

import com.house730.admin.pojo.EstateProjectInfo;

public interface EstateProjectInfoMapper {
    int insert(EstateProjectInfo record);

    int insertSelective(EstateProjectInfo record);
}