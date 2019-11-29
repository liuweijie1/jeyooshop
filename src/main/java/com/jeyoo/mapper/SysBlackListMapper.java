package com.jeyoo.mapper;

import com.jeyoo.pojo.SysBlackList;

public interface SysBlackListMapper {
    int insert(SysBlackList record);

    int insertSelective(SysBlackList record);
}