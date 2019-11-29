package com.jeyoo.controller;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import com.jeyoo.Exception.ExceptionEnum;
import com.jeyoo.Exception.JeyooException;
import com.jeyoo.pojo.UserOrderRecord;
import com.jeyoo.resultpojo.UserOrderRecordResult;
import com.jeyoo.service.IUserOrderRecordService;
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
public class CustomerController {
	
	@Autowired
	private IUserOrderRecordService userOrderRecordService;
	
	/**
	 *  交易管理页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value ="/process" ,method =RequestMethod.GET)
	public String toProcess(Model model) {
		return "customer/customer";
	}
	
	/**
	 *  交易管理页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value ="/member" ,method =RequestMethod.GET)
	public String toMember(Model model) {
		return "customer/member";
	}
	
	@RequestMapping(value ="/record" ,method =RequestMethod.GET)
	public String torecord(Model model) {
		return "customer/curecord";
	}
	/**
	 *  獲取分頁
	 * @param model
	 * @param paramMap
	 * @return
	 */
	@ResponseBody
	@PostMapping(value ="/getPage")
	public Object getPage(Model model,@RequestParam Map<String, String> paramMap) {
		PageInfo<UserOrderRecordResult> pageInfo = userOrderRecordService.findPage(paramMap);
		Map<String, Object> map = PageUtils.getMap(pageInfo);
		return map;
	}
	
	/**
	 * 獲取訂單詳情
	 * @param model
	 * @param orderid
	 * @return
	 */
	@GetMapping(value = "/tradeDetail")
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
	}
	
	/**
	 *  储值屋币
	 * @param model
	 * @param userOrder
	 * @return
	 */
	@PostMapping(value = "/storeValue")
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
	}
}
