package com.jeyoo.controller;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.jeyoo.Exception.ExceptionEnum;
import com.jeyoo.Exception.JeyooException;
import com.jeyoo.mapper.ShopConfigMapper;
import com.jeyoo.pojo.ShopConfig;
import com.jeyoo.pojo.User;
import com.jeyoo.pojo.UserOrderRecord;
import com.jeyoo.resultpojo.UserOrderRecordResult;
import com.jeyoo.service.IUserOrderRecordService;
import com.jeyoo.service.UserService;
import com.jeyoo.service.impl.UserServiceImpl;
import com.jeyoo.utils.PageUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

/**
 *   交易管理
 * @author wbqiutj
 *
 */
@Controller
@RequestMapping(value = "page/customer")
public class UserController {
	@Autowired
	private ShopConfigMapper shopConfigmapper;
	@Autowired
	private UserService userService;
	
	/**
	 *  会员页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value ="/process" ,method =RequestMethod.GET)
	public String toProcess(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		String nickname = session.getAttribute("nickname")==null ? "": session.getAttribute("nickname").toString();
		String headimgurl = session.getAttribute("headimgurl")==null ? "": session.getAttribute("headimgurl").toString();
		 model.addAttribute("nickname", nickname);
		 model.addAttribute("headimgurl", headimgurl);
		 model.addAttribute("user",userService.getUserInfo(request));
		 
		 String shopid = session.getAttribute("shopid") == null ? "": session.getAttribute("shopid").toString().trim();
		 ShopConfig shopConfig=shopConfigmapper.getShopConfig(Long.valueOf(shopid));
		 model.addAttribute("shop",shopConfig);
		
		return "customer/customer";
	}
	
	/**
	 *  会员充值页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value ="/member" ,method =RequestMethod.GET)
	public String toMember(Model model,HttpServletRequest request) {
		 model.addAttribute("user",userService.getUserInfo(request));
		return "customer/member";
	}
	/**
	 *  会员消费记录
	 * @param model
	 * @return
	 */
	@RequestMapping(value ="/record" ,method =RequestMethod.GET)
	public String torecord(Model model,HttpServletRequest request) {
	
		String userid=userService.getUserId(request);
		List<Map<String,String>> record=userService.queryRecord(Long.valueOf(userid));
		 model.addAttribute("recordMap",record);
		return "customer/curecord";
	}
	/**
	 *  獲取分頁
	 * @param model
	 * @param paramMap
	 * @return
	 */
	/*@ResponseBody
	@PostMapping(value ="/getPage")
	public Object getPage(Model model,@RequestParam Map<String, String> paramMap) {
		PageInfo<UserOrderRecordResult> pageInfo = userOrderRecordService.findPage(paramMap);
		Map<String, Object> map = PageUtils.getMap(pageInfo);
		return map;
	}*/
	
	/**
	 * 獲取訂單詳情
	 * @param model
	 * @param orderid
	 * @return
	 */
	/*@GetMapping(value = "/tradeDetail")
	public String getDetail(Model model,@RequestParam(value = "orderid") Long orderid) {
		try {
			if(null == orderid) {
				throw new JeyooException(ExceptionEnum.BAD_REQUEST);
			}
			UserOrderRecordResult userOrder = userOrderRecordService.findTradeDetailByOrderId(orderid);
			model.addAttribute("userOrder", userOrder);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return "trade-manage/checkOrder";
	}*/
	
	/**
	 *  储值屋币
	 * @param model
	 * @param userOrder
	 * @return
	 */
	/*@PostMapping(value = "/storeValue")
	@ResponseBody
	public Map<String,Object> storeValue(UserOrderRecordResult userOrder) {
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			userOrderRecordService.updateStroeValue(userOrder);
			map.put("success", true);
			map.put("message", "儲值成功");
		}catch(Exception e) {
			e.printStackTrace();
			map.put("success", false);
			map.put("message", e.getMessage());
		}
		return map;
	}*/
}
