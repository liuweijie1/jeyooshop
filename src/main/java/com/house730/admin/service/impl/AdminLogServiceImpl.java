
package com.house730.admin.service.impl;

import com.house730.admin.config.JwtInitProperties;
import com.house730.admin.mapper.SysOperationLogMapper;
import com.house730.admin.service.AdminLogService;
import com.house730.admin.utils.JwtUtils;
import com.house730.admin.vo.AdminLogEnum;
import com.house730.admin.vo.HouseEnum;
import com.house730.admin.vo.UserInfo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.kafka.KafkaProperties;
import org.springframework.stereotype.Service;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Service
@Slf4j
public class AdminLogServiceImpl implements AdminLogService {
    @Autowired
    private HttpServletRequest request;
    @Autowired
    private SysOperationLogMapper operationLogMapper;
    @Autowired
    private JwtInitProperties properties;

    /**
     * 获取员工编号
     * @return
     */
    @Override
    public String empCode() {
        return getUserInfo();
    }



    /**
     * 记录日志  插入数据库
     * @param model 模块
     * @param type 操作的类型
     * @param content 操作内容描述
     */
    @Override
    public void insertLog(String model, String type, String content) {
        String admin = getUserInfo();
        if (admin != null) {
            log.info(model+"..."+type+"..."+ content+"....操作人:"+admin);
            operationLogMapper.adminlog(model, type, content, admin);
        }
    }

    private String getUserInfo() {
        String token=null;
        String empcode=null;
        UserInfo userInfo =null;
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals(properties.getCookieName())) {
                token = cookie.getValue();
                // 解析token
                try {
                    userInfo = JwtUtils.getInfoFromToken(token, properties.getPublicKey());
                     empcode = userInfo.getEmpcode();
                } catch (Exception e) {
                    log.error("adminlog解析token错误"+e.getMessage(),e);
                }
            }
        }
        return empcode;
    }

    @Override
    public Map<String, Object> unauthorized(String model, String type, String content) {
        Map<String, Object> map = new HashMap<>();
        String admin = getUserInfo();
        if (admin != null) {
            log.info("非法操作....操作人:"+admin);
            operationLogMapper.adminlog(model, type, content, admin);
        }
        map.put("unauth", "非法操作");
        return map;
    }

    @Override
    public String getEmpno(){
        String token=null;
        String empno=null;
        UserInfo userInfo =null;
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals(properties.getCookieName())) {
                token = cookie.getValue();
                // 解析token
                try {
                    userInfo = JwtUtils.getInfoFromToken(token, properties.getPublicKey());
                    empno = userInfo.getEmpno();
                } catch (Exception e) {
                    log.error("adminlog解析token错误"+e.getMessage(),e);
                }
            }
        }
        return empno;
    }

}
