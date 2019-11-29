package com.jeyoo.mapper;

import com.jeyoo.pojo.AdminDepartment;

public interface AdminDepartmentMapper {
    int insert(AdminDepartment record);

    int insertSelective(AdminDepartment record);
}