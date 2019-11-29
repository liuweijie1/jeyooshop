package com.jeyoo.service;

import com.github.pagehelper.PageInfo;
import com.jeyoo.pojo.Property;
import com.jeyoo.resultpojo.PropertyAuditResult;
import com.jeyoo.resultpojo.PropertyReleaseResult;

import java.util.Map;

public interface PropertyAuditService {
    //获取验证标签楼盘列表
    PageInfo<PropertyAuditResult> getPage(Map<String, Object> requestMap);

    PropertyReleaseResult getDetailPage(Long propertyid);
    //審核標籤狀態
    void checklabelStatus(Boolean isverify, Long propertyid);
    //自建樓盤列表
    PageInfo<PropertyAuditResult> getselfPage(Map<String, Object> requestMap);
    //自建樓盤詳情
    PropertyReleaseResult selfDetailPage(Long propertyid);
    //自建樓盤審核
    void propertyStatus(Integer approvalstatus, Long propertyid);
}
