package com.house730.admin.mapper;

import com.house730.admin.pojo.InformationCategory;

public interface InformationCategoryMapper {
    int insert(InformationCategory record);

    int insertSelective(InformationCategory record);
}