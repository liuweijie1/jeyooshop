package com.house730.admin.mapper;

import com.house730.admin.pojo.Sequence;

public interface SequenceMapper {
    int insert(Sequence record);

    int insertSelective(Sequence record);
}