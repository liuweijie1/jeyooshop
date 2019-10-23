package com.house730.admin.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.house730.admin.mapper.SysDictionaryMapper;
import com.house730.admin.mapper.UserMapper;
import com.house730.admin.pojo.SysDictionary;
import com.house730.admin.pojo.User;
import com.house730.admin.pojo.UserOptionInfo;
import com.house730.admin.pojo.UserOrderRecord;
import com.house730.admin.requestSearch.UserSearch;
import com.house730.admin.resultpojo.UserExcel;
import com.house730.admin.service.UserService;
import com.house730.admin.utils.ExcelUtils;
import com.house730.admin.utils.StringResourceUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletResponse;
import java.beans.Transient;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper mapper;
    @Autowired
    private SysDictionaryMapper dictionaryMapper;

    //下載Excel表格
    @Override
    public void downExcel(UserSearch search, HttpServletResponse response) {
        //条件查询结果
        List<UserExcel> list = mapper.downExcel(search);
        for (UserExcel user : list) {
            //根据结果查询楼盘字典中相应的值
            user.setGend( dictionaryMapper.queryselect(user.getGender()));
            user.setAge(dictionaryMapper.queryselect(user.getAgetype()));
            user.setSalary(dictionaryMapper.queryselect(user.getSalarytype()));
            user.setLive(dictionaryMapper.queryselect(user.getLivetype()));
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        //判断查询结果是否为空
        if (!list.isEmpty()) {
            String[] title = new String[]{"會員編號", "註冊電郵", "註冊電話","用戶名", "性別", "年齡組別 ", "每月個人月息",
                    "居所", "會員訊息", "地產代理","代理公司名稱","代理公司電話","代理公司地址","公司經濟牌照號碼","代理人牌照號碼",
                    "會員資料審核","賬戶狀態","權重分值"};
            String[][] values = new String[list.size()][];
            for (int i = 0; i < list.size(); i++) {
                values[i] = new String[title.length];
                UserExcel userExcel = list.get(i);
                values[i][0] = userExcel.getUsercode() == null ? "" : userExcel.getUsercode();
                values[i][1] = userExcel.getEmail() == null ? "" : userExcel.getEmail();
                values[i][2] = userExcel.getTelephone() == null ? "" : userExcel.getTelephone();
                values[i][3] = userExcel.getUsername() == null ? "" : userExcel.getUsername();
                values[i][4] = userExcel.getGend() == null ? "" : userExcel.getGend();
                values[i][5] = userExcel.getAge()==null ? "" : userExcel.getAge();
                values[i][6] = userExcel.getSalary() == null ? "" : userExcel.getSalary();
                values[i][7] = userExcel.getLive() == null ? "" : userExcel.getLive();
                values[i][8] = userExcel.getIsreceivemessage() == null ? "" : userExcel.getIsreceivemessage()?"接收":"不接收";
                values[i][9] = userExcel.getIspropertyagent() == null ? "" : userExcel.getIspropertyagent() ? "地產代理" : "普通用戶";
                values[i][10]= userExcel.getCompanynamecn() == null ? "" : userExcel.getCompanynamecn();
                values[i][11]= userExcel.getCompanytelephone() == null ? "" : userExcel.getCompanytelephone();
                values[i][12]= userExcel.getCompanyaddress() == null ? "" : userExcel.getCompanyaddress();
                values[i][13]= userExcel.getCompanylicense() == null ? "" : userExcel.getCompanylicense();
                values[i][14]= userExcel.getLicense() == null ? "" : userExcel.getLicense();
                if (null == userExcel.getApprovalStatus()) {
                    userExcel.setApprovalStatus("");
                }else if (userExcel.getApprovalStatus().equals("PassApproval")) {
                    userExcel.setApprovalStatus("已通過");
                }else if(userExcel.getApprovalStatus().equals("NotPassApproval")){
                    userExcel.setApprovalStatus("未通過");
                }else if (userExcel.getApprovalStatus().equals("UnderApproval")) {
                    userExcel.setApprovalStatus("待審核");
                }
                values[i][15] = userExcel.getApprovalStatus();
                values[i][16] = userExcel.getStatus() == null ? "" : userExcel.getStatus().equals("Normal") == true ? "正常" : "查封";
                values[i][17] = userExcel.getIdentityscore() == null ? "" : userExcel.getIdentityscore().toString();


            }
            SimpleDateFormat df = new SimpleDateFormat(StringResourceUtils.DFTYPETEXT);//设置日期格式
            HSSFWorkbook wb = ExcelUtils.getHSSFWorkbook(df.format(new Date()), title, values, null);
            ExcelUtils.closeOutputStream(response, "会员详情", wb);
        } else {
            String[] title = new String[]{"暫無數據"};
            String[][] values = new String[1][];
            values[0] = new String[title.length];
            values[0][0] = "當前查詢條件沒有數據";
            SimpleDateFormat df = new SimpleDateFormat(StringResourceUtils.DFTYPETEXT);//设置日期格式
            HSSFWorkbook wb = ExcelUtils.getHSSFWorkbook(df.format(new Date()), title, values, null);
            ExcelUtils.closeOutputStream(response, "会员详情", wb);


        }

    }

    @Override
    @Transactional
    public String changeScore(Integer userid, Integer score) {
        Integer changesore = mapper.changesore(userid, score);

        return changesore == 1 ? "success" : "err";
    }

    @Override
    @Transactional
    public String checkApproval(Integer userid, String status) {
        Integer code = mapper.checkapproval(userid, status);

        return code == 1 ? "success" : "err";
    }

    //查询查封解封理由
    @Override
    @Transactional
    public String queryReason(String usercode) {
        Integer userid = mapper.queryIdByuserCode(usercode);
        String reason = mapper.queryReasonByUserid(userid);
        return reason;
    }

    //更新会员状态
    @Override
    @Transactional
    public String updateStatus(Integer id, String status, String empId, String detail) {
        //更新user表中的账号状态
        Integer integer = mapper.updateStatus(id, status);
        //向userOptionInfo中插入查封解封记录
        Integer integer1 = mapper.insertUserOptionInfo(id, status, empId, detail);
        return integer == integer1 ? "success" : "err";
    }

    //查詢會員詳情
    @Override
    @Transactional
    public Map<String, Object> queryDetail(Integer userid) {
        Map<String, Object> map = mapper.querydetailAll(userid);
        return map;
    }

    @Override
    public PageInfo<User> query(Map<String, Object> paramMap) {
        PageInfo<User> pageInfo = null;
        if(null != paramMap) {
            try {
                //获取参数
                Integer pno=Integer.parseInt(String.valueOf(paramMap.get("page")));
                Integer pageSize=Integer.parseInt(String.valueOf(paramMap.get("limit")));
                PageHelper.startPage(pno, pageSize);
                List<User> userList = mapper.query(paramMap);
                pageInfo = new PageInfo<User>(userList);
            }catch(Exception e) {
                e.printStackTrace();
            }
        }
        return pageInfo;
    }
}
