package com.house730.admin.controller;


import com.github.pagehelper.PageInfo;
import com.house730.admin.Exception.ExceptionEnum;
import com.house730.admin.Exception.HouseException;
import com.house730.admin.pojo.PropertyReport;
import com.house730.admin.service.PropertyReportManageService;
import com.house730.admin.utils.PageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 *  检举管理
 * @author wbliuwjs
 *
 */
@Controller
@RequestMapping("propertyreportmanage/")
public class PropertyReportManageController {
  
    @Autowired
    private PropertyReportManageService propertyReportService;

    
   
    @GetMapping("/process")
	public String toProcess(Model model) {
		return "propertyReport/index";
	}
    
    
    /**

     *房源检举查询
   * @param token
   * @return
   */


    @ResponseBody
	@GetMapping(value ="/getPage")
    public Object  getPage( HttpServletResponse response, HttpServletRequest request,@RequestParam Map<String, String> paramMap) {
        try {
        	
        	PageInfo<PropertyReport> pageList= propertyReportService.findPropertyReport(paramMap);
            Map<String, Object> mp = PageUtils.getMap(pageList);
            return mp;
          
            
        } catch (Exception e) {
        	e.printStackTrace();
        	throw new  HouseException(ExceptionEnum.SERVER_ERROR, e);
        }
    }
    /**

     *导出
   * @param token
   * @return
   */

    @ResponseBody
  	@GetMapping(value ="/downexcel")
      public String  downExcel( HttpServletResponse response, HttpServletRequest request,@RequestParam Map<String, String> paramMap) {
          try {
           propertyReportService.downExcel(paramMap,response);
      	   return "success";
            
              
          } catch (Exception e) {
          	e.printStackTrace();
          	throw new  HouseException(ExceptionEnum.SERVER_ERROR, e);
          }
      }
}
