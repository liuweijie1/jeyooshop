package com.house730.admin.service.impl;

import com.house730.admin.mapper.SysOperationLogMapper;
import com.house730.admin.pojo.AdminEmployee;
import com.house730.admin.service.AdminLogService;
import com.house730.admin.vo.AdminLogEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

@Service
public class AdminLogServiceImpl implements AdminLogService {
    @Autowired
    private SysOperationLogMapper operationLogMapper;
    @Override
    public void insertLog(String model, String type, String content) {
        ServletRequestAttributes servletRequestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = servletRequestAttributes.getRequest();
        AdminEmployee admin = (AdminEmployee)request.getSession().getAttribute("admin");
        operationLogMapper.adminlog(model, type, content, admin.getEmployeeno());
    }
}
