package com.house730.admin.vo;

import com.house730.admin.mapper.SysOperationLogMapper;
import com.house730.admin.pojo.AdminEmployee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
public class AdminLogRecord {
    @Autowired
    private  SysOperationLogMapper operationLogMapper;
    public  void adminlog( String model, String type, String content) {
        ServletRequestAttributes servletRequestAttributes = (ServletRequestAttributes)RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = servletRequestAttributes.getRequest();
        AdminEmployee admin = (AdminEmployee)request.getSession().getAttribute("admin");
        operationLogMapper.adminlog(AdminLogEnum.PROPERTY.getLog(), AdminLogEnum.UPDATE.getLog(), content, admin.getEmployeeno());
    }
}
