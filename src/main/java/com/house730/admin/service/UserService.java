package com.house730.admin.service;

import com.house730.admin.pojo.User;
import com.house730.admin.requestSearch.UserSearch;
import com.github.pagehelper.PageInfo;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

public interface UserService {
    //根据条件查询会员列表
    PageInfo<User> query(Map<String, Object> paramMap);
    //查詢會員詳情
    Map<String, Object> queryDetail(Integer userid);
    //更新会员状态
    String updateStatus(Integer id, String status, String empId,String detail);
    //查询查封解封理由
    String queryReason(String usercode);
    //审核会员信息
    String checkApproval(Integer userid, String status);
    //改变权重分值
    String changeScore(Integer userid, Integer score);
    //下载excel表格
    void downExcel(UserSearch search, HttpServletResponse response);
}
