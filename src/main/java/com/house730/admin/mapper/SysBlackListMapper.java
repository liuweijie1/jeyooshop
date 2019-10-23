package com.house730.admin.mapper;

import com.house730.admin.pojo.SysBlackList;

public interface SysBlackListMapper {
    int insert(SysBlackList record);

    int insertSelective(SysBlackList record);
}