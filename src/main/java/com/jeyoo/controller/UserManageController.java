package com.jeyoo.controller;

import com.github.pagehelper.PageInfo;
import com.jeyoo.service.UserService;
import com.jeyoo.utils.PageUtils;
import com.jeyoo.vo.HouseEnum;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Controller
@RequestMapping("user")
public class UserManageController {
    @Autowired
    private UserService userService;

    /**
     * 查询会员列表
     *
     * @return 返回会员列表视图
     */
    @GetMapping("index")
    public String index() {
        return "userManage/index";
    }

    /**
     * 查詢會員詳情頁面
     *
     * @param model  返回给页面的model
     * @param userid 根据userid 查询
     * @return 返回视图名称
     */
    @GetMapping("query/detailindex")
    public String detailIndex(Model model, @RequestParam(value = "userid") String userid) {
        Integer integer = Integer.parseInt(userid);
        Map<String, Object> map = userService.queryDetail(integer);
        model.addAttribute("user", map);
        return "userManage/detail";
    }

    /**
     * 根据条件查询会员列表
     * 会员编号
     * 注册渠道
     * 会员类型
     * 账号状态
     * 会员资料审核状态
     * 开始时间
     * 结束时间
     * 当前页
     * 每页显示条数
     *
     * @return
     */
    @ResponseBody
    @GetMapping("query/data")
    public Map<String, Object> queryUser(@RequestParam Map<String, Object> paramMap) {
        PageInfo pageInfo = userService.query(paramMap);

        return PageUtils.getMap(pageInfo);
    }


    /**
     * 查封解封账号
     *
     * @param id      会员id
     * @param status  当前状态
     * @param content 操作的内容
     * @param request 请求
     * @return 响应码
     */
    @ResponseBody
    @GetMapping("/query/detail/updatestatus")
    public Map<String, Object> updateStatus(@RequestParam("userid") Integer id, @RequestParam("status") String status, @RequestParam(value = "content", required = false) String content, HttpServletRequest request) {
        String detail;
        if ("Normal".equals(status)) {
            status = HouseEnum.DISABLE.getName();
            detail = HouseEnum.DISABLE.getValue();
        } else {
            status = HouseEnum.NORMAL.getName();
            detail = HouseEnum.NORMAL.getValue();
        }


        return userService.updateStatus(id, status, detail);
    }


    //查询用户查封解封理由
    @GetMapping("/query/reason")
    @ResponseBody
    public Map<String, String> queryReason(@RequestParam("usercode") String usercode) {
        String reason = userService.queryReason(usercode);
        Map<String, String> map = new HashMap<>();
        map.put("data", reason);
        return map;
    }

    //审核会员信息通过&不通过
    @ResponseBody
    @GetMapping("/query/check/approval")
    public Map<String, Object> checkApproval(@RequestParam("userid") Integer userid, @RequestParam("approvalstatus") String status) {


        return userService.checkApproval(userid, status);
    }

    //权重分值管理
    @ResponseBody
    @GetMapping("/change/identityscore")
    public Map<String, Object> changeScore(@RequestParam("userid") Integer userid, @RequestParam("score") String score) {
        Integer parseInt = Integer.parseInt(score);

        return userService.changeScore(userid, parseInt);
    }

    @PostMapping("/propertycoin/recharge")
    @ResponseBody
    public Map<String, Object> recharge(@RequestParam Map<String, Object> paramMap) {

      return  userService.recharge(paramMap);
    }
}
