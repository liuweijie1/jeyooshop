package com.jeyoo.mapper;

import org.apache.ibatis.annotations.Param;

import com.jeyoo.pojo.SysOperationLog;

import java.util.Date;

public interface SysOperationLogMapper {
    int insert(SysOperationLog record);

    int insertSelective(SysOperationLog record);

    void adminlog(@Param("model") String model,@Param("type") String type,@Param("content") String content,@Param("empno") String empno);
}