package com.house730.admin.controller;

import com.github.pagehelper.PageInfo;
import com.house730.admin.pojo.UserDepartment;
import com.house730.admin.service.BranchService;
import com.house730.admin.service.CompanyService;
import com.house730.admin.utils.PageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("branch")
public class BranchController {
    @Autowired
    private BranchService branchService;

    @GetMapping("/querybranch")
    public String queryBranch(Model model, @RequestParam("companyid") Integer companyid) {
        List<Map<String, Object>> departments = branchService.queryBranchname(companyid);
        model.addAttribute("branchname", departments);
        model.addAttribute("companyid", companyid);
        return "/company/branch/branchList";
    }

    @GetMapping("/branchlist")
    @ResponseBody
    public Map<String, Object> branchlist(@RequestParam Map<String, Object> param) {
        PageInfo pageInfo = branchService.branchlist(param);
        Map<String, Object> map = PageUtils.getMap(pageInfo);
        return map;
    }

    @GetMapping("/queryagent")
    public String queryagent() {
      return "/company/branch/agentList";
    }


    @GetMapping("/agentlist")
    @ResponseBody
    public Map<String, Object> agentlist(@RequestParam Map<String, Object> param) {
        PageInfo pageInfo = branchService.agentlist(param);
        Map<String, Object> map = PageUtils.getMap(pageInfo);
        return map;
    }

}
