package com.house730.admin.service;

import com.github.pagehelper.PageInfo;
import com.house730.admin.pojo.UserDepartment;

import java.util.List;
import java.util.Map;

public interface BranchService {

    List<Map<String,Object>> queryBranchname(Integer companyid);

    PageInfo branchlist(Map<String,Object> param);

    PageInfo agentlist(Map<String, Object> param);
}
