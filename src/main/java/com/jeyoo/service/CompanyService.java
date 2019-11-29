package com.jeyoo.service;

import com.github.pagehelper.PageInfo;
import com.jeyoo.pojo.UserAgentCompany;

import org.apache.poi.ss.formula.functions.T;

import java.util.List;
import java.util.Map;

public interface CompanyService {
    List<String> queryCompanyName();

    PageInfo getCompanyPage(Map<String, Object> paramMap);

    UserAgentCompany getDetail(Integer companyid);

    void updateCompany(Map<String, Object> map);

    void deleteCompany(Integer companyid);
}
