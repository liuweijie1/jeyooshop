package com.house730.admin.mapper;

import com.house730.admin.pojo.Deal;

public interface DealMapper {
    int insert(Deal record);

    int insertSelective(Deal record);
}