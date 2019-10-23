package com.house730.admin.mapper;

import com.house730.admin.pojo.UserLandSearch;

public interface UserLandSearchMapper {
    int insert(UserLandSearch record);

    int insertSelective(UserLandSearch record);
}