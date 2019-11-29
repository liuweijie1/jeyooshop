package com.jeyoo.service;

import java.util.Map;

public interface AdminLogService {
    /**
     * 记录日志表方法
     * @param model 模块
     * @param type 操作的类型
     * @param content 操作内容描述
     */
    void insertLog(String model, String type, String content);

    String empCode();

    String getEmpno();

    Map<String,Object> unauthorized(String model, String type, String content);
}
