package com.house730.admin.controller;

import com.github.pagehelper.PageInfo;
import com.house730.admin.Exception.ExceptionEnum;
import com.house730.admin.Exception.HouseException;
import com.house730.admin.pojo.UserLeaveMessage;
import com.house730.admin.requestSearch.LeaveMessageSearch;
import com.house730.admin.service.LeaveMessage;
import com.house730.admin.service.impl.LeaveMessageImpl;
import com.house730.admin.utils.JsonUtil;
import com.house730.admin.utils.PageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;


import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("admin")
/**
 * 留言反馈管理
 */
public class LeaveMessagemanageController {
    @Autowired
    private LeaveMessageImpl messageService;

    @RequestMapping("message")
    public String index() {
        return "/leaveMessage/index";
    }

    /**
     * 查询留言记录
     * <p>
     * <p>
     * 会员ID
     * 来源
     * 查询开始时间
     * 查询截止时间
     *
     * @return
     * @throws ParseException
     */
    @GetMapping("leavemessage/query")
    @ResponseBody
    public Map<String, Object> showLeaveMessage(@RequestParam Map<String, Object> parmMap) {
        PageInfo pageInfo = messageService.selectLeaveMessage(parmMap);
        Map<String, Object> mp = PageUtils.getMap(pageInfo);
        return mp;
    }

    //下载Excel表格
/*    @ResponseBody
    @RequestMapping("/down/excel")
    public void downExcel(HttpServletResponse response,@RequestParam Map<String, Object> parmMap) {
        messageService.downLeaveMessage(parmMap, response);


    }*/

}
