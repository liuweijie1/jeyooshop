package com.house730.admin.mapper;

import com.house730.admin.pojo.UserAgentCompany;
import org.apache.ibatis.annotations.Param;

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