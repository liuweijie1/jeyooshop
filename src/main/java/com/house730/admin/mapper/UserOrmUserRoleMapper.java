package com.house730.admin.mapper;

import com.house730.admin.pojo.UserOrmUserRole;

public interface UserOrmUserRoleMapper {
    int insert(UserOrmUserRole record);

    int insertSelective(UserOrmUserRole record);
}