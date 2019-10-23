package com.house730.admin.controller;

import com.github.pagehelper.PageInfo;
import com.house730.admin.Exception.ExceptionEnum;
import com.house730.admin.Exception.HouseException;
import com.house730.admin.pojo.AdminEmployee;
import com.house730.admin.pojo.User;
import com.house730.admin.requestSearch.UserSearch;
import com.house730.admin.service.UserService;
import com.house730.admin.utils.PageUtils;
import com.house730.admin.vo.HouseEnum;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("user")
public class UserManageController {
    @Autowired
    private UserService userService;

    /**
     * 查询会员列表
     * @return 返回会员列表视图
     */
    @RequestMapping("query")
    public String index() {
        return "/userManage/index";
    }

    /**
     * 查詢會員詳情頁面
     * @param model 返回给页面的model
     * @param userid  根据userid 查询
     * @return 返回视图名称
     */
    @RequestMapping("query/detailindex")
    public String detailIndex(Model model, @RequestParam(value = "userid") String userid) {
        Integer integer = Integer.parseInt(userid);
        Map<String, Object> map = userService.queryDetail(integer);
        model.addAttribute("user", map);
        return "/userManage/detail";
    }

    /**
     * 根据条件查询会员列表
     * 会员编号
     * 注册渠道
     * 会员类型
     *  账号状态
     * 会员资料审核状态
     *开始时间
     * 结束时间
     *当前页
     * 每页显示条数
     * @return
     */
    @ResponseBody
    @GetMapping("query/data")
    public Map<String, Object> queryUser(@RequestParam Map<String, Object> paramMap) {
        PageInfo pageInfo = userService.query(paramMap);
        Map map = PageUtils.getMap(pageInfo);
        return map;
    }


    /**
     * 查封解封账号
     * @param id 会员id
     * @param status 当前状态
     * @param content 操作的内容
     * @param request 请求
     * @return 响应码
     */
    @ResponseBody
    @GetMapping("/query/detail/updatestatus")
    public Map<String, Object> updateStatus(@RequestParam("userid") Integer id, @RequestParam("status") String status, @RequestParam(value = "content", required = false) String content, HttpServletRequest request) {
        String detail;
        if ("Normal".equals(status)) {
            status = HouseEnum.Disable.getStatus();
            detail = HouseEnum.Disable.getDetail();
        } else {
            status = HouseEnum.Normal.getStatus();
            detail = HouseEnum.Normal.getDetail();
        }

        AdminEmployee admin = (AdminEmployee) request.getSession().getAttribute("admin");
        String employeeid = admin.getEmployeeid().toString();
        String statusCode = userService.updateStatus(id, status, employeeid, detail);
        Map<String, Object> map = new HashMap<>();

        map.put("statusCode", statusCode);
        return map;
    }

    //查询用户查封解封理由
    @GetMapping("/query/reason")
    @ResponseBody
    public Map<String, String> queryReason(@RequestParam("usercode") String usercode) {
        String reason = userService.queryReason(usercode);
        Map<String, String> map = new HashMap<>();
        map.put("data", reason);
        System.out.println(map);
        return map;
    }

    //审核会员信息通过&不通过
    @ResponseBody
    @GetMapping("/query/check/approval")
    public String checkApproval(@RequestParam("userid") Integer userid, @RequestParam("approvalstatus") String status) {

        String resCode = userService.checkApproval(userid, status);

        return resCode;
    }

    //权重分值管理
    @ResponseBody
    @GetMapping("/change/identityscore")
    public String changeScore(@RequestParam("userid") Integer userid, @RequestParam("score") String score) {
        Integer parseInt = Integer.parseInt(score);
        String resCode = userService.changeScore(userid, parseInt);
        return resCode;
    }

    //下载Excel表格
    @ResponseBody
    @GetMapping("/down/excel")
    public String downExcel(HttpServletResponse response, @RequestParam(value = "usercode", required = false) String userCode,
                            @RequestParam(value = "source", required = false) String source,
                            @RequestParam(value = "ispropertyagent", required = false) Boolean ispropertyagent,
                            @RequestParam(value = "status", required = false) String status,
                            @RequestParam(value = "approvalStatus", required = false) String approvalStatus,
                            @RequestParam(value = "startTime", required = false) String startTime,
                            @RequestParam(value = "endTime", required = false) String endTime){

        UserSearch search = new UserSearch();
        formatTime(startTime, endTime, search);
        search.setApprovalStatus(approvalStatus);
        search.setSource(source);
        search.setUserCode(userCode);
        search.setIspropertyagent(ispropertyagent);
        search.setStatus(status);
        userService.downExcel(search, response);

        return "success";
    }
    private void formatTime(String startTime, String endTime, UserSearch search) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd ");
        try {
            if (null != startTime && startTime != "") {
                Date start = sdf.parse(startTime);
                search.setStartTime(start);
            }
            if (null != endTime && endTime != "") {
                Date end = sdf.parse(endTime);
                search.setEndTime(end);
            }
        } catch (ParseException e) {
            throw new HouseException(ExceptionEnum.DATA_PARSE_FAIL, e);
        }
    }


}
