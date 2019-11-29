package com.jeyoo.mapper;

import java.util.List;
import java.util.Map;

import com.jeyoo.resultpojo.DepartmentEmplResult;

public interface UserCompanyAccountMapper {

    List<DepartmentEmplResult> agentlist(Map<String, Object> paramMap);
}
