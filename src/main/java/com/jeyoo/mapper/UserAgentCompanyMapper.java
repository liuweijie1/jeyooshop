package com.jeyoo.mapper;

import org.apache.ibatis.annotations.Param;

import com.jeyoo.pojo.UserAgentCompany;

import java.util.List;
import java.util.Map;

public interface UserAgentCompanyMapper {
    int insert(UserAgentCompany record);

    int insertSelective(UserAgentCompany record);

    List<String> queryCompanyName();

    List<UserAgentCompany> getCompanyPage(Map<String, Object> paramMap);

    UserAgentCompany getDetail(@Param("companyid") Integer companyid);

    void updateCompany(Map<String, Object> map);

    void deleteCompany(@Param("companyid") Integer companyid);
}