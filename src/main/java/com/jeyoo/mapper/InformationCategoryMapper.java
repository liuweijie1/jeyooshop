package com.jeyoo.mapper;

import com.jeyoo.pojo.InformationCategory;

public interface InformationCategoryMapper {
    int insert(InformationCategory record);

    int insertSelective(InformationCategory record);
}