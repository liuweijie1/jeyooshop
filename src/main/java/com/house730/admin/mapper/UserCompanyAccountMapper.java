package com.house730.admin.mapper;

import com.house730.admin.resultpojo.DepartmentEmplResult;

import java.util.List;
import java.util.Map;

public interface UserCompanyAccountMapper {

    List<DepartmentEmplResult> agentlist(Map<String, Object> paramMap);
}
