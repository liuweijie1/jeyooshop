package com.jeyoo.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import com.jeyoo.Exception.ExceptionEnum;
import com.jeyoo.Exception.JeyooException;
import com.jeyoo.mapper.SysOperationLogMapper;
import com.jeyoo.pojo.AdminEmployee;
import com.jeyoo.pojo.Property;
import com.jeyoo.resultpojo.PropertyAuditResult;
import com.jeyoo.resultpojo.PropertyReleaseResult;
import com.jeyoo.service.AdminLogService;
import com.jeyoo.service.PropertyAuditService;
import com.jeyoo.utils.PageUtils;
import com.jeyoo.vo.AdminLogEnum;
import com.jeyoo.vo.AdminLogRecord;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.kafka.KafkaProperties;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

@Controller
@RequestMapping("/property")
@Slf4j
public class PropertyAuditController {
    @Autowired
    private PropertyAuditService propertyAuditService;

    @Autowired
    private AdminLogService logService;

    //附加審核 验证楼盘页面
    @GetMapping("/audit/index")
    public String checkindex() {

        return "property-manage/propertyAudit/checkLabel/index";
    }


    @GetMapping("/audit/detail")
    public String detail(Model model, @RequestParam("propertyid") Long propertyid) {
        PropertyReleaseResult property = propertyAuditService.getDetailPage(propertyid);
        model.addAttribute("releaseResult", property);
        return "property-manage/propertyAudit/checkLabel/detail";
    }
    //自建楼盘相关
    @GetMapping("/self/index")
    public String selfIndex() {
        return "property-manage/propertyAudit/selfProperty/index";
    }

    //自建樓盤詳情頁
    @GetMapping("/self/detail")
    public String selfDetailPage(Model model, @RequestParam("propertyid") Long propertyid) {
        PropertyReleaseResult self = propertyAuditService.selfDetailPage(propertyid);
        model.addAttribute("releaseResult", self);
        return "property-manage/propertyAudit/selfProperty/detail";
    }


    @GetMapping("/audit/getpage")
    @ResponseBody
    public Map<String, Object> getPage(@RequestParam Map<String, Object> requestMap) {

        PageInfo<PropertyAuditResult> pageinfo = propertyAuditService.getPage(requestMap);
        Map<String, Object> mp = PageUtils. getMap(pageinfo);
        return mp;
    }

    @GetMapping("/audit/checklabelStatus")
    @ResponseBody
    public void checklabelStatus(@RequestParam("isverify") Boolean isverify, @RequestParam("propertyid") Long propertyid) {
        propertyAuditService.checklabelStatus(isverify, propertyid);
        logService.insertLog(AdminLogEnum.PROPERTY.getLog(),AdminLogEnum.UPDATE.getLog(),propertyid.toString());

    }


    @GetMapping("/self/getPage")
    @ResponseBody
    public Map<String, Object> getselfPage(@RequestParam Map<String, Object> requestMap) {

        PageInfo<PropertyAuditResult> pageinfo = propertyAuditService.getselfPage(requestMap);
        Map<String, Object> mp = PageUtils.getMap(pageinfo);
        return mp;
    }
    //自建樓盤審核
    @GetMapping("/self/propertyStatus")
    @ResponseBody
    public Map<String, Object> propertyStatus(@RequestParam("approvalstatus") Integer approvalstatus, @RequestParam("propertyid") Long propertyid) {
        Map<String, Object> map = new HashMap<>();
        try {
            propertyAuditService.propertyStatus(approvalstatus, propertyid);
            map.put("message", "操作成功");
            map.put("success", true);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success", false);
            map.put("message", e.getMessage());
        }
        return map;
    }
}
