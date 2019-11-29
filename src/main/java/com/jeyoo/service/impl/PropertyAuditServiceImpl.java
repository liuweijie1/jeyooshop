package com.jeyoo.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jeyoo.mapper.PropertyMapper;
import com.jeyoo.mapper.SysOperationLogMapper;
import com.jeyoo.pojo.Property;
import com.jeyoo.pojo.PropertySimilar;
import com.jeyoo.pojo.PropertyUserInfo;
import com.jeyoo.pojo.User;
import com.jeyoo.resultpojo.Agent;
import com.jeyoo.resultpojo.PropertyAuditResult;
import com.jeyoo.resultpojo.PropertyReleaseResult;
import com.jeyoo.service.PropertyAuditService;
import com.jeyoo.vo.AdminLogEnum;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class PropertyAuditServiceImpl implements PropertyAuditService {
    @Autowired
    private PropertyMapper propertyAuditMapper;

    @Override
    public void propertyStatus(Integer approvalstatus, Long propertyid) {
        propertyAuditMapper.propertyStatus(approvalstatus, propertyid);
    }

    @Override
    public PropertyReleaseResult selfDetailPage(Long propertyid) {
        PropertyReleaseResult property = propertyAuditMapper.getSelfDetailPage(propertyid);
        //查詢經紀人
        List<Agent> user=  propertyAuditMapper.getUserBypropertyid(propertyid);
        property.setUser(user);
        //查詢房源圖片
        List<String> propertyimg = propertyAuditMapper.getProImage( propertyid);
        property.setProimg(propertyimg);
        //查詢一級分類
        String category = propertyAuditMapper.category(propertyid);
        property.setCategory(category);
        //查詢二級分類
        List<String> subcategory = propertyAuditMapper.subcategory(propertyid);
        property.setSubcategory(subcategory);
        //查詢附近樓盤
        PropertySimilar similar = propertyAuditMapper.similarProperty(propertyid);
        property.setSimilar(similar);
        return property;
    }

    @Override
    public PageInfo<PropertyAuditResult> getselfPage(Map<String, Object> requestMap) {
        PageInfo<PropertyAuditResult> pageInfo = null;
        if(null != requestMap) {
            try {
                //获取参数
                Integer pno=Integer.parseInt(String.valueOf(requestMap.get("page")));
                Integer pageSize=Integer.parseInt(String.valueOf(requestMap.get("limit")));
                PageHelper.startPage(pno, pageSize);

                List<PropertyAuditResult> list = propertyAuditMapper.getselfPage(requestMap);
                pageInfo = new PageInfo<PropertyAuditResult>(list);
            }catch(Exception e) {
                e.printStackTrace();
            }
        }
        return pageInfo;
    }

    @Override
    public void checklabelStatus(Boolean isverify, Long propertyid) {
        propertyAuditMapper.checklabelStatus(isverify, propertyid);
    }

    @Override
    public PropertyReleaseResult getDetailPage(Long propertyid) {
        PropertyReleaseResult property = propertyAuditMapper.getDetailPage(propertyid);
        //查詢經紀人
         List<Agent> user=  propertyAuditMapper.getUserBypropertyid(propertyid);
         property.setUser(user);
        //查詢房源圖片
        List<String> propertyimg = propertyAuditMapper.getProImage( propertyid);
        property.setProimg(propertyimg);
        //查詢審核圖片
        List<String> labelimg = propertyAuditMapper.getLabelImage(propertyid);
        property.setLabelimg(labelimg);
        //查詢一級分類
        String category = propertyAuditMapper.category(propertyid);
        property.setCategory(category);
        //查詢二級分類
        List<String> subcategory = propertyAuditMapper.subcategory(propertyid);
        property.setSubcategory(subcategory);
        //查詢附近樓盤
        PropertySimilar similar = propertyAuditMapper.similarProperty(propertyid);
        property.setSimilar(similar);
        return property;
    }

    @Override
    public PageInfo<PropertyAuditResult> getPage(Map<String, Object> requestMap) {
        PageInfo<PropertyAuditResult> pageInfo = null;
        if(null != requestMap) {
            try {
                //获取参数
                Integer pno=Integer.parseInt(String.valueOf(requestMap.get("page")));
                Integer pageSize=Integer.parseInt(String.valueOf(requestMap.get("limit")));
                PageHelper.startPage(pno, pageSize);

                List<PropertyAuditResult> list = propertyAuditMapper.getAuditPage(requestMap);
                pageInfo = new PageInfo<PropertyAuditResult>(list);
            }catch(Exception e) {
                e.printStackTrace();
            }
        }
        return pageInfo;
    }
}
