package com.jeyoo.mapper;

import com.jeyoo.pojo.UserCollection;

public interface UserCollectionMapper {
    int insert(UserCollection record);

    int insertSelective(UserCollection record);
}