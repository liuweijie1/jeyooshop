package com.jeyoo.controller;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import com.jeyoo.Exception.ExceptionEnum;
import com.jeyoo.Exception.JeyooException;
import com.jeyoo.resultpojo.PropertyReleaseResult;
import com.jeyoo.service.IPropertyReleaseService;
import com.jeyoo.utils.PageUtils;
import com.jeyoo.vo.ManagerPropertyEnum;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

/**
 *  放盤管理
 * @author wbqiutj
 *	2019年4月28日
 */
@Controller
@RequestMapping(value = "/property")
public class PropertyReleaseController {
	
	@Autowired
	private IPropertyReleaseService propertyReleaseService;
	
	/**
	 *  放盤管理列表
	 * @param model
	 * @return
	 */
	@RequestMapping(value ="/process" ,method =RequestMethod.GET)
	public String toProcess(Model model) {
		model.addAttribute("resource","process");
		return "property-manage/index";
	}
	
	/**
	 *  獲取分頁
	 * @param model
	 * @param paramMap
	 * @return
	 */
	@ResponseBody
	@PostMapping(value ="/getPage")
	public Object getPage(Model model,@RequestParam Map<String, Object> paramMap) {
		if(paramMap != null) {
			Object upperOrLower = paramMap.get("upperOrLower");
			Object resource = paramMap.get("resource");
			if(upperOrLower != null) {//初始化頁面的時候默認為null
				if(StringUtils.isNotEmpty(upperOrLower.toString())) {
					paramMap.put("upperOrLowers", ((String) upperOrLower).split(","));
				}
			}
			if(resource != null) {
				String res = resource.toString();
				if(res.equals("releaseApply")) {//根據不同頁面進行傳參
					paramMap.put("paymentStatus", ManagerPropertyEnum.PROPERTY_PAYMENT_STATUS.getCode());
				}
				if(res.equals("process")) {
					paramMap.put("paymentStatus", ManagerPropertyEnum.PROPERTY_PAYMENT_STATUS.getCode());
					paramMap.put("approvalStatus", ManagerPropertyEnum.PROPERTY_APPROVAL_STATUS.getCode());
				}
			}
		}
		PageInfo<PropertyReleaseResult> pageInfo = propertyReleaseService.findReleasePage(paramMap);
		Map<String, Object> mp = PageUtils.getMap(pageInfo);
		return mp;
	}
	
	/**
	 *  獲取放盤詳情
	 * @param model
	 * @param orderid
	 * @return
	 */
	@GetMapping(value = "/propertyDetail")
	public String getDetail(Model model,@RequestParam(value = "propertyid") Long propertyid,String resource) {
		try {
			if(null == propertyid) {
				throw new JeyooException(ExceptionEnum.BAD_REQUEST);
			}
			PropertyReleaseResult releaseResult = propertyReleaseService.findReleaseDetailByPropertyId(propertyid);
			if(releaseResult!=null) {
				if(resource.equals("releaseApply")) {
					//過濾手動輸入propertyid
					if(ManagerPropertyEnum.PROPERTY_PAYMENT_STATUS.getStatus() != releaseResult.getPaymentstatus())
						releaseResult = null;
				}
				if(resource.equals("process")) {
					//過濾手動輸入propertyid
					if(ManagerPropertyEnum.PROPERTY_PAYMENT_STATUS.getStatus() != releaseResult.getPaymentstatus() || ManagerPropertyEnum.PROPERTY_APPROVAL_STATUS.getStatus() != releaseResult.getApprovalstatus())
						releaseResult = null;
				}
			}
			model.addAttribute("releaseResult", releaseResult);
			model.addAttribute("resource", resource);
		}catch(Exception e) {
			try {
				throw new JeyooException(ExceptionEnum.BAD_REQUEST,e);
			}catch(Exception p) {
				p.printStackTrace();
			}
		}
		
		return "property-manage/propertyDetail";
	}
	
	/**
	 *   上下架
	 * @return
	 */
	@PostMapping(value = "/upOrDownProperty")
	@ResponseBody
	public Map<String,Object> upOrDownProperty(@RequestParam(value = "propertyid") Long propertyId
			,Boolean isadminoffline) {
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			propertyReleaseService.upOrDownProperty(propertyId,isadminoffline);
			map.put("message", "操作成功");
			map.put("success", true);
		}catch(Exception e) {
			e.printStackTrace();
			map.put("success", false);
			map.put("message", e.getMessage());
		}
		return map;
	}
	
	/**
	 * 放盤審核頁面
	 * @param model
	 * @return
	 */
	@RequestMapping(value ="/release" ,method =RequestMethod.GET)
	public String releaseApply(Model model) {
		model.addAttribute("resource","releaseApply");
		return "property-manage/releaseApply";
	}
	
	/**
	 * 放盤審核
	 * @param propertyid
	 * @return
	 */
	@PostMapping(value = "/releaseApply")
	@ResponseBody
	public Map<String,Object> releaseApply(@RequestParam(value = "propertyid") Long propertyid,
			@RequestParam(value = "apply") Boolean apply) {
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			propertyReleaseService.releaseApply(propertyid,apply);
			map.put("message", "操作成功");
			map.put("success", true);
		}catch(Exception e) {
			e.printStackTrace();
			map.put("success", false);
			map.put("message", e.getMessage());
		}
		return map;
	}
}
