package com.jeyoo.mapper;

import com.jeyoo.pojo.UserLandSearch;

public interface UserLandSearchMapper {
    int insert(UserLandSearch record);

    int insertSelective(UserLandSearch record);
}