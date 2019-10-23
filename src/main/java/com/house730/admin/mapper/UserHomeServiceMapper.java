package com.house730.admin.mapper;

import com.house730.admin.pojo.UserHomeService;

public interface UserHomeServiceMapper {
    int insert(UserHomeService record);

    int insertSelective(UserHomeService record);
}