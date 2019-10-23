package com.house730.admin.mapper;

import com.house730.admin.pojo.SysOperationLog;
import org.apache.ibatis.annotations.Param;

import java.util.Date;

public interface SysOperationLogMapper {
    int insert(SysOperationLog record);

    int insertSelective(SysOperationLog record);

    void adminlog(@Param("model") String model,@Param("type") String type,@Param("content") String content,@Param("empno") String empno);
}