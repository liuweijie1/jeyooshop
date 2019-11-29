package com.jeyoo.service;

import com.github.pagehelper.PageInfo;
import com.jeyoo.pojo.User;

import java.util.Map;

public interface GoodsService {
    //根据条件查询会员列表
   // PageInfo<User> query(Map<String, Object> paramMap);
    //查詢會員詳情
   // Map<String, Object> queryDetail(Integer userid);
    //更新会员状态
   // Map<String, Object> updateStatus(Integer id, String status,String detail);
    //查询查封解封理由
  //  String queryReason(String usercode);
    //审核会员信息
  //  Map<String, Object> checkApproval(Integer userid, String status);
    //改变权重分值
   // Map<String,Object> changeScore(Integer userid, Integer score);


   // Map<String,Object> recharge(Map<String, Object> paramMap);
}
