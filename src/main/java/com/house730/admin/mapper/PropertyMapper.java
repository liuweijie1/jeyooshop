package com.house730.admin.mapper;

import java.util.List;
import java.util.Map;

import com.house730.admin.pojo.Property;
import com.house730.admin.pojo.PropertySimilar;
import com.house730.admin.pojo.PropertyUserInfo;
import com.house730.admin.pojo.User;
import com.house730.admin.resultpojo.Agent;
import com.house730.admin.resultpojo.PropertyAuditResult;
import com.house730.admin.resultpojo.PropertyReleaseResult;
import org.apache.ibatis.annotations.Param;

public interface PropertyMapper{

    
    List<PropertyReleaseResult> findReleasePage(Map<String, Object> paramMap);
    
    PropertyReleaseResult findReleaseDetailByPropertyId(Long propertyId);

    List<PropertyAuditResult> getAuditPage(Map<String, Object> requestMap);

    PropertyReleaseResult getDetailPage(@Param("propertyid") Long propertyid);
    
    int updateProperty(PropertyReleaseResult result);

    List<Agent> getUserBypropertyid(@Param("propertyid") Long propertyid);

    List<String> getProImage(@Param("propertyid") Long propertyid);

    List<String> getLabelImage(@Param("propertyid") Long propertyid);

    void checklabelStatus(@Param("isverify") Boolean isverify,@Param("propertyid") Long propertyid);

    String category(@Param("propertyid") Long propertyid);

    List<String> subcategory(@Param("propertyid") Long propertyid);

    PropertySimilar similarProperty(@Param("propertyid") Long propertyid);

    List<PropertyAuditResult> getselfPage(Map<String, Object> requestMap);

    PropertyReleaseResult getSelfDetailPage(Long propertyid);

    void propertyStatus(@Param("approvalstatus") Integer approvalstatus,@Param("propertyid") Long propertyid);
}