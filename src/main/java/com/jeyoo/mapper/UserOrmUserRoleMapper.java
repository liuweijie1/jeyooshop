package com.jeyoo.mapper;

import com.jeyoo.pojo.UserOrmUserRole;

public interface UserOrmUserRoleMapper {
    int insert(UserOrmUserRole record);

    int insertSelective(UserOrmUserRole record);
}