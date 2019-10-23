package com.house730.admin.controller;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.house730.admin.Exception.ExceptionEnum;
import com.house730.admin.Exception.HouseException;
import com.house730.admin.pojo.SysPropertyCoinset;
import com.house730.admin.service.ISysPropertyCoinsetService;

/**
 *  屋幣配置
 * @author wbqiutj
 *	2019年5月8日
 */
@Controller
@RequestMapping(value = "/coinset")
public class SysPropertyCoinsetController {
	
	@Autowired
	ISysPropertyCoinsetService sysPropertyCoinsetService;
	
	/**
	 *  放盤管理列表
	 * @param model
	 * @return
	 */
	@RequestMapping(value ="/process" ,method =RequestMethod.GET)
	public String toProcess(Model model) {
		model.addAttribute("resource","process");
		return "property-coinset/index";
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
		PageInfo<SysPropertyCoinset> pageInfo = sysPropertyCoinsetService.findCoinsetPage(paramMap);
		Map<String,Object> mp = new LinkedHashMap<>();
		mp.put("code", "0");
		if(pageInfo != null) {
			mp.put("count", pageInfo.getTotal());
			if(pageInfo.getTotal() > 0) {
				mp.put("msg", "獲取數據成功");
				mp.put("data", pageInfo.getList());
			}else {
				mp.put("msg", "無數據");
			}
		}else {
			mp.put("msg", new HouseException(ExceptionEnum.BAD_REQUEST));
		}
		return mp;
	}
	
	/**
	 * 添加屋币配置
	 * @param coinset
	 * @return
	 */
	@PostMapping(value = "/saveCoinset")
	@ResponseBody
	public Map<String,Object> saveCoinset(@RequestBody List<SysPropertyCoinset> coinset) {
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			sysPropertyCoinsetService.insertCoinset(coinset);
			map.put("success", true);
		}catch(Exception e) {
			e.printStackTrace();
			map.put("success", false);
			map.put("message", e.getMessage());
		}
		return map;
	}
	
	/**
	 *  屋币配置-上下架
	 * @param model
	 * @param userOrder
	 * @return
	 */
	@PostMapping(value = "/upOrDownCoinset")
	@ResponseBody
	public Map<String,Object> upOrDownCoinset(@RequestParam(value = "setid") Integer setid) {
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			sysPropertyCoinsetService.upOrDownCoinset(setid);
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
