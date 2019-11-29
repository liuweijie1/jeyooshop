package com.jeyoo.mapper;

import com.jeyoo.pojo.Deal;

public interface DealMapper {
    int insert(Deal record);

    int insertSelective(Deal record);
}