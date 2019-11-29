package com.jeyoo.mapper;

import org.apache.ibatis.annotations.Param;

import com.jeyoo.pojo.AdminEmployee;

public interface AdminEmployeeMapper {
    int insert(AdminEmployee record);

    int insertSelective(AdminEmployee record);

    AdminEmployee selectByUsernameAndPassword(@Param("username")String username, @Param("password") String password);
}