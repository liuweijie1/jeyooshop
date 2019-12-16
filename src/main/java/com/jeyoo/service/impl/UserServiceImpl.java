package com.jeyoo.service.impl;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jeyoo.mapper.UserMapper;
import com.jeyoo.pojo.User;
import com.jeyoo.service.AdminLogService;
import com.jeyoo.service.UserService;
import com.jeyoo.utils.ID;
import com.jeyoo.utils.LoginAuthUtil;

import com.jeyoo.vo.AdminLogEnum;
import com.jeyoo.vo.HouseEnum;

import lombok.extern.slf4j.Slf4j;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import net.sf.json.JSONObject;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public User getUserInfo(HttpServletRequest request) {
		User user =new User();
		HttpSession session = request.getSession();
		String shopid = session.getAttribute("shopid")==null ? "": session.getAttribute("shopid").toString();
		String openid = session.getAttribute("WX_OPEN_ID")==null ? "": session.getAttribute("WX_OPEN_ID").toString();
		if(StringUtils.isNotBlank(shopid)&&StringUtils.isNotBlank(openid)) {
		
			user=mapper.getUser(Long.valueOf(shopid),openid);
		}
		
		return user;
	}
	
	@Override
	public String getUserStauts(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String shopid = session.getAttribute("shopid")==null ? "": session.getAttribute("shopid").toString();
		String openid = session.getAttribute("WX_OPEN_ID")==null ? "": session.getAttribute("WX_OPEN_ID").toString();
		if(StringUtils.isBlank(shopid)||StringUtils.isBlank(openid)) {
			return "0";
		}
		
		String nickname = session.getAttribute("nickname")==null ? "": session.getAttribute("nickname").toString();
		String headimgurl = session.getAttribute("headimgurl")==null ? "": session.getAttribute("headimgurl").toString();
		if(StringUtils.isBlank(nickname)||StringUtils.isBlank(headimgurl)) {
			//调用微信接口获取头像和昵称
			String accesstoken = session.getAttribute("ACCESSTOKEN")==null ? "": session.getAttribute("ACCESSTOKEN").toString();
			
			String str=LoginAuthUtil.getWXUserInfo(openid, accesstoken);
			if (StringUtils.isNotBlank(str)) {// 有返回值
				JSONObject obj = JSONObject.fromObject(str);
				String nicknamestr = obj.getString("nickname");
				String headimgurlstr = obj.getString("headimgurl");

				
				if (StringUtils.isNotBlank(nicknamestr)&&StringUtils.isNotBlank(headimgurlstr)) {// openid不为空
					session.setAttribute("nickname", nicknamestr);
					session.setAttribute("headimgurl", headimgurlstr);
					
				}
			}
		}
		
		
		//从session获取
		String seuserid = session.getAttribute(shopid+openid)==null ? "": session.getAttribute(shopid+openid).toString();
		if(StringUtils.isNotBlank(seuserid)) {
			return "1";
		}
		//从数据库查询
		User user =new User();
		user=mapper.getUser(Long.valueOf(shopid),openid);
		if(user!=null) {
			session.setAttribute(shopid+openid,String.valueOf(user.getUserid()));
			return "1";
		}
		//数据库没有新增并放session
		User usernew =new User();
		Long id=ID.getId();
		
		usernew.setUserid(id);
		usernew.setOpenid(openid);
		usernew.setShopid(Long.valueOf(shopid));
		usernew.setVipcard(String.valueOf(Long.valueOf(new SimpleDateFormat("yymmssSSS").format(new Date()).toString())*2));
		int i=mapper.insert(usernew);
		if(i==1) {
			session.setAttribute(shopid+openid,String.valueOf(id));
			return "1";
		}
		
		
		
		return "";
	}
	
	
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
