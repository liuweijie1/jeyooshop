package com.jeyoo.mapper;

import com.jeyoo.pojo.EstateProjectInfo;

public interface EstateProjectInfoMapper {
    int insert(EstateProjectInfo record);

    int insertSelective(EstateProjectInfo record);
}