package com.jeyoo.mapper;

import com.jeyoo.pojo.Sequence;

public interface SequenceMapper {
    int insert(Sequence record);

    int insertSelective(Sequence record);
}