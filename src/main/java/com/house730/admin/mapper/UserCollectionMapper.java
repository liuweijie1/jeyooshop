package com.house730.admin.mapper;

import com.house730.admin.pojo.UserCollection;

public interface UserCollectionMapper {
    int insert(UserCollection record);

    int insertSelective(UserCollection record);
}