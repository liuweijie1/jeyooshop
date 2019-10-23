package com.house730.admin.mapper;

import com.house730.admin.pojo.AdminDepartment;

public interface AdminDepartmentMapper {
    int insert(AdminDepartment record);

    int insertSelective(AdminDepartment record);
}