package com.jeyoo.mapper;

import org.apache.ibatis.annotations.Param;

import com.jeyoo.pojo.SysDictionary;

import java.util.List;

public interface SysDictionaryMapper {

    //从楼盘字典中获取年龄组别 收入范围
    String queryselect(@Param("args") Integer args);

    List<String> queryList(@Param("gender") Integer gender,@Param("agetype") Integer agetype,@Param("salarytype") Integer salarytype, @Param("livetype") Integer livetype);
}