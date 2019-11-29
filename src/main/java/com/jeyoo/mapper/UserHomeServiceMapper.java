package com.jeyoo.mapper;

import com.jeyoo.pojo.UserHomeService;

public interface UserHomeServiceMapper {
    int insert(UserHomeService record);

    int insertSelective(UserHomeService record);
}