package com.house730.admin.mapper;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserDepartmentMapper {

    List<Map<String,Object>> queryBranchName(@Param("companyid") Integer companyid);

    List<Map<String,Object>> branchlist(Map<String, Object> paramMap);
}
