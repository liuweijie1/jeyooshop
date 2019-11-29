package com.jeyoo.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jeyoo.mapper.UserCompanyAccountMapper;
import com.jeyoo.mapper.UserDepartmentMapper;
import com.jeyoo.resultpojo.DepartmentEmplResult;
import com.jeyoo.service.BranchService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class BranchServiceImpl implements BranchService {
    @Autowired
    private UserDepartmentMapper departmentMapper;
    @Autowired
    private UserCompanyAccountMapper accountMapper;

    @Override
    public PageInfo agentlist(Map<String, Object> paramMap) {
        PageInfo<DepartmentEmplResult> pageInfo = null;
        if(null != paramMap) {
            try {
                //获取参数
                Integer pno=Integer.parseInt(String.valueOf(paramMap.get("page")));
                Integer pageSize=Integer.parseInt(String.valueOf(paramMap.get("limit")));
                PageHelper.startPage(pno, pageSize);
                List<DepartmentEmplResult> result = accountMapper.agentlist(paramMap);
                pageInfo = new PageInfo<DepartmentEmplResult>(result);
            }catch(Exception e) {
                e.printStackTrace();
            }
        }
        return pageInfo;
    }

    @Override
    public PageInfo branchlist(Map<String,Object> paramMap) {

        PageInfo<Map<String,Object>> pageInfo = null;
        if(null != paramMap) {
            try {
                //获取参数
                Integer pno=Integer.parseInt(String.valueOf(paramMap.get("page")));
                Integer pageSize=Integer.parseInt(String.valueOf(paramMap.get("limit")));
                PageHelper.startPage(pno, pageSize);
                List<Map<String, Object>> result = departmentMapper.branchlist(paramMap);
                pageInfo = new PageInfo<Map<String,Object>>(result);
            }catch(Exception e) {
                e.printStackTrace();
            }
        }
        return pageInfo;
    }

    @Override
    public List<Map<String,Object>> queryBranchname(Integer companyid) {
        List<Map<String,Object>> branchList = departmentMapper.queryBranchName(companyid);
        return branchList;
    }
}
