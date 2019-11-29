package com.jeyoo.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jeyoo.mapper.UserAgentCompanyMapper;
import com.jeyoo.pojo.UserAgentCompany;
import com.jeyoo.service.CompanyService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CompanyServiceImpl implements CompanyService {
    @Autowired
    private UserAgentCompanyMapper companyMapper;

    @Override
    public void deleteCompany(Integer companyid) {
        companyMapper.deleteCompany(companyid);
    }

    @Override
    public void updateCompany(Map<String, Object> map) {
        companyMapper.updateCompany(map);
    }

    @Override
    public UserAgentCompany getDetail(Integer companyid) {
        UserAgentCompany company = companyMapper.getDetail(companyid);
        return company;
    }

    @Override
    public PageInfo<UserAgentCompany> getCompanyPage(Map<String, Object> paramMap) {
        PageInfo<UserAgentCompany> pageInfo = null;
        if(null != paramMap) {
            try {
                //获取参数
                Integer pno=Integer.parseInt(String.valueOf(paramMap.get("page")));
                Integer pageSize=Integer.parseInt(String.valueOf(paramMap.get("limit")));
                PageHelper.startPage(pno, pageSize);
                List<UserAgentCompany> list = companyMapper.getCompanyPage(paramMap);
                pageInfo = new PageInfo<UserAgentCompany>(list);
            }catch(Exception e) {
                e.printStackTrace();
            }
        }
        return pageInfo;
    }

    @Override
    public List<String> queryCompanyName() {
        List<String> company = companyMapper.queryCompanyName();
        return company;
    }
}
