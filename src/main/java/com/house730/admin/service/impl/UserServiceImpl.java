package com.house730.admin.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.house730.admin.mapper.UserMapper;

import com.house730.admin.pojo.User;


import com.house730.admin.service.AdminLogService;
import com.house730.admin.service.UserService;


import com.house730.admin.utils.ResultDataF;
import com.house730.admin.vo.AdminLogEnum;
import com.house730.admin.vo.HouseEnum;
import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Slf4j
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper mapper;
    @Autowired
    private AdminLogService adminLogService;
   /* @Autowired
    private HouseApiProperties apiProperties;*/


    @Override
    public Map<String, Object> recharge(Map<String, Object> paramMap) {
        Map<String, Object> map = new HashMap<>();

            JSONObject obj = new JSONObject();
            obj.put("userId", paramMap.get("userid"));
            obj.put("number", paramMap.get("number"));
            obj.put("itemName", paramMap.get("itemName"));
          //  ResultDataF resultData = Httpclient.doPost(obj,"http://testapi.house730.com/User/AddPropertyCoin");
           // if(resultData!=null && resultData.getResult()){
                map.put("msg", "success");
                adminLogService.insertLog(AdminLogEnum.USER.getLog(), AdminLogEnum.INSERT.getLog(), "会员金币储值"+paramMap);
           // }else{
                map.put("msg", "error");
          //  }


        return map;
    }

    @Override
    @Transactional
    public Map<String,Object> changeScore(Integer userid, Integer score) {
        Map<String, Object> map = new HashMap<>();
        String empCode = adminLogService.empCode();
        try {
            mapper.changesore(userid, score, empCode);
            adminLogService.insertLog(AdminLogEnum.USER.getLog(), AdminLogEnum.UPDATE.getLog(), "改变权重分值"+"userid为"+userid+"的权重分值更改为"+score);
            map.put(HouseEnum.SUCCESS.getName(), HouseEnum.SUCCESS.getValue());
        } catch (Exception e) {
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            log.error("改变权重分值失败" + e);
            map.put(HouseEnum.ERROR.getName(), HouseEnum.ERROR.getValue());
        }
        return map;
    }

    @Override
    @Transactional
    public Map<String, Object> checkApproval(Integer userid, String status) {
        Map<String, Object> map = new HashMap<>();
        try {
            mapper.checkapproval(userid, status);
            adminLogService.insertLog(AdminLogEnum.USER.getLog(), AdminLogEnum.UPDATE.getLog(), "审核会员信息"+"userid为"+userid+"的更改会员资料审核状态为"+status);
            map.put(HouseEnum.SUCCESS.getName(), HouseEnum.SUCCESS.getValue());
        } catch (Exception e) {
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            log.error("审核会员信息失败" + e.getMessage(), e);
            map.put(HouseEnum.ERROR.getName(), HouseEnum.ERROR.getValue());
        }

        return map;
    }

    //查询查封解封理由
    @Override
    @Transactional
    public String queryReason(String usercode) {
        Integer userid = mapper.queryIdByuserCode(usercode);

        return  mapper.queryReasonByUserid(userid);
    }

    //更新会员状态
    @Override
    @Transactional
    public Map<String, Object> updateStatus(Integer id, String status, String detail) {
        Map<String, Object> map = new HashMap<>();
        try {
            String empcode = adminLogService.empCode();
            //更新user表中的账号状态
            mapper.updateStatus(id, status, empcode);
            //向userOptionInfo中插入查封解封记录
            mapper.insertUserOptionInfo(id, status, empcode, detail);
            adminLogService.insertLog(AdminLogEnum.USER.getLog(), AdminLogEnum.UPDATE.getLog(), "更新会员状态"+"userid为"+id+"的更改会员状态为"+status);
            map.put(HouseEnum.SUCCESS.getName(), HouseEnum.SUCCESS.getValue());

        } catch (Exception e) {
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            log.error("更新会员状态失败" + e.getMessage(), e);
            map.put(HouseEnum.ERROR.getName(), HouseEnum.ERROR.getValue());
        }
        return map;
    }

    //查詢會員詳情
    @Override
    public Map<String, Object> queryDetail(Integer userid) {

        return  mapper.querydetailAll(userid);
    }

    @Override
    public PageInfo<User> query(Map<String, Object> paramMap) {
        PageInfo<User> pageInfo = null;
        if (null != paramMap) {
            try {
                //获取参数
                Integer pno = Integer.parseInt(String.valueOf(paramMap.get("page")));
                Integer pageSize = Integer.parseInt(String.valueOf(paramMap.get("limit")));
                PageHelper.startPage(pno, pageSize);
                List<User> userList = mapper.query(paramMap);
                pageInfo = new PageInfo<>(userList);
            } catch (Exception e) {
                log.error("查询会员列表失败" + e.getMessage(),e);
            }
        }
        return pageInfo;
    }
}
