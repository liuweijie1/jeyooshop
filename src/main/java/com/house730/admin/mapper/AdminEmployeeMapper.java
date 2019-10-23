package com.house730.admin.mapper;

import com.house730.admin.pojo.AdminEmployee;
import org.apache.ibatis.annotations.Param;

public interface AdminEmployeeMapper {
    int insert(AdminEmployee record);

    int insertSelective(AdminEmployee record);

    AdminEmployee selectByUsernameAndPassword(@Param("username")String username, @Param("password") String password);
}