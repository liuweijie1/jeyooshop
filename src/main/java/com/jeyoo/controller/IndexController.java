package com.jeyoo.controller;


import com.github.pagehelper.PageInfo;
import com.jeyoo.Exception.ExceptionEnum;
import com.jeyoo.Exception.JeyooException;
import com.jeyoo.pojo.Order;
import com.jeyoo.pojo.PropertyReport;
import com.jeyoo.service.OrderService;
import com.jeyoo.service.PropertyReportManageService;
import com.jeyoo.service.UserService;
import com.jeyoo.utils.PageUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
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
@RequestMapping("page/index")
public class IndexController {
  
    @Autowired
    private OrderService orderService;
    @Autowired
    private UserService userService;
   
    @GetMapping("/process")
   	public String placeOrder(Model model) {
   		return "/home/index";
   	}
    
    
    /**

     *房源检举查询
   * @param token
   * @return
   */


   /* @ResponseBody
	@GetMapping(value ="/getPage")
    public Object  getPage( HttpServletResponse response, HttpServletRequest request,@RequestParam Map<String, String> paramMap) {
        try {
        	
        	PageInfo<PropertyReport> pageList= propertyReportService.findPropertyReport(paramMap);
            Map<String, Object> mp = PageUtils.getMap(pageList);
            return mp;
          
            
        } catch (Exception e) {
        	e.printStackTrace();
        	throw new  JeyooException(ExceptionEnum.SERVER_ERROR, e);
        }
    }*/
    
    
    
    @ResponseBody
  	@PostMapping(value ="/plaorder")
      public String  plaorder( HttpServletResponse response, HttpServletRequest request,/*@RequestParam Map<String, String> paramMap*/String goodlist,
    		  String qctime,String remark,String pricetotal,String state,int totalcount) {
          try {
        	  String userid=userService.getUserInfo(request);
        	 
        	  orderService.plaOrder(userid,goodlist,qctime,remark,pricetotal,state,totalcount);
      	      return "success";
            
              
          } catch (Exception e) {
          	e.printStackTrace();
          	throw new  JeyooException(ExceptionEnum.SERVER_ERROR, e);
          }
      }
    
    @RequestMapping("/orderlist")
   	public String orderlist( ModelMap modelMap) {
    	 List<Order>  order=orderService.getOrder(null);
    	 List<Order> ordermap=orderService.queryOrderDetails(null);
    	 modelMap.addAttribute("order",order);
    	 modelMap.addAttribute("orderimg",ordermap);
   		return "/order/orderlist";
   	}
    
    
    @RequestMapping("/showdetails")
   	public String orderDetails( ModelMap modelMap ,String  number) {
    	 List<Order>  orderlist=orderService.getOrder(number);
    	 Order order=orderlist.get(0);
    	 List<Order> orderDetail=orderService.queryOrderDetails(number);
    	 modelMap.addAttribute("order",order);
    	 modelMap.addAttribute("orderDetail",orderDetail);
   		return "/order/orderdetail";
   	}
    
    /**

     *导出
   * @param token
   * @return
   */

  /*  @ResponseBody
  	@GetMapping(value ="/downexcel")
      public String  downExcel( HttpServletResponse response, HttpServletRequest request,@RequestParam Map<String, String> paramMap) {
          try {
           propertyReportService.downExcel(paramMap,response);
      	   return "success";
            
              
          } catch (Exception e) {
          	e.printStackTrace();
          	throw new  JeyooException(ExceptionEnum.SERVER_ERROR, e);
          }
      }*/
}