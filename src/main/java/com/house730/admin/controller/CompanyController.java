package com.house730.admin.controller;

import com.github.pagehelper.PageInfo;
import com.house730.admin.Exception.ExceptionEnum;
import com.house730.admin.Exception.HouseException;
import com.house730.admin.pojo.UserAgentCompany;
import com.house730.admin.service.CompanyService;
import com.house730.admin.utils.PageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("company")
public class CompanyController {
    @Autowired
    private CompanyService companyService;

    /**
     * 查代理公司名称
     *
     * @param model
     * @return
     */
    @GetMapping("/manage/company")
    public String companylist(Model model) {
        List<String> companyname = companyService.queryCompanyName();
        model.addAttribute("companyname", companyname);
        return "company/companyManage/index";
    }

    /**
     * 添加代理公司
     *
     * @return
     */
    @GetMapping("/manage/addcompany")
    public String addcompany() {
        return "company/companyManage/insert";
    }

    /**
     * 查看代理公司列表
     *
     * @param paramMap 传参
     * @return
     */
    @GetMapping("/manage/companylist")
    @ResponseBody
    public Map<String, Object> getPage(@RequestParam Map<String, Object> paramMap) {
        PageInfo pageInfo = companyService.getCompanyPage(paramMap);
        Map<String, Object> map = PageUtils.getMap(pageInfo);
        return map;
    }

    /**
     * 查看代理公司詳情
     *
     * @param model
     * @return
     */
    @GetMapping("/manage/companydetail")
    public String companydetail(Model model, @RequestParam("companyid") Integer companyid) {
        UserAgentCompany company = companyService.getDetail(companyid);
        model.addAttribute("company", company);
        return "company/companyManage/detail";
    }

    @GetMapping("/manage/updatecompany")
    @ResponseBody
    public Map<String, Object> updateCompany(@RequestParam Map<String, Object> map) {
        Map<String, Object> mp = new HashMap<>();
        try {
            companyService.updateCompany(map);
            mp.put("msg", "success");
            return mp;
        } catch (Exception e) {
            new HouseException(ExceptionEnum.BAD_REQUEST);
            mp.put("msg", "err");
            return mp;
        }
    }

    @GetMapping("/manage/deletecompany")
    @ResponseBody
    public Map<String, Object> deleteCompany(@RequestParam("companyid") Integer companyid) {
        Map<String, Object> mp = new HashMap<>();
        try {
            companyService.deleteCompany(companyid);
            mp.put("msg", "success");
            return mp;
        } catch (Exception e) {
            new HouseException(ExceptionEnum.BAD_REQUEST);
            mp.put("msg", "err");
            return mp;
        }
    }


}