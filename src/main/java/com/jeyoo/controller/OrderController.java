package com.jeyoo.controller;


import com.jeyoo.Exception.ExceptionEnum;
import com.jeyoo.Exception.JeyooException;
import com.jeyoo.mapper.ShopConfigMapper;
import com.jeyoo.pojo.Order;
import com.jeyoo.pojo.ShopConfig;
import com.jeyoo.pojo.User;
import com.jeyoo.service.OrderService;
import com.jeyoo.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 *  检举管理
 * @author wbliuwjs
 *
 */
@Controller
@RequestMapping("page/order")
@Slf4j
public class OrderController {
  
    @Autowired
    private OrderService orderService;
    @Autowired
	private UserService userService;
    @Autowired
	private ShopConfigMapper shopConfigmapper;
    @GetMapping("/process")
   	public String placeOrder(ModelMap modelMap, HttpServletRequest request) {
    	User user=new User();
		user=userService.getUserInfo(request);
		String phone=user.getTelephone();
		if(StringUtils.isBlank(phone)) {
			modelMap.addAttribute("mobilephone",null);
		}else {
			String encryptionMobile=user.getTelephone().substring(0, 3)+"****"+user.getTelephone().substring(7, 11);
			modelMap.addAttribute("mobilephone",encryptionMobile);
		}
	
   		return "/order/order";
   	}
    

    @ResponseBody
  	@PostMapping(value ="/savephone")
      public String  savePhone( HttpServletResponse response, HttpServletRequest request,String mobilephone)  {
          try {
      		String userid=userService.getUserId(request);
      		userService.updatePhone(Long.valueOf(userid),mobilephone);
            return "success";
              
          } catch (Exception e) {
        	 
          	e.printStackTrace();
          	throw new  JeyooException(ExceptionEnum.SERVER_ERROR, e);
          }
      }
    
    @ResponseBody
  	@PostMapping(value ="/qrbuy")
      public String  qrBuy( HttpServletResponse response, HttpServletRequest request,String number)  {
          try {

        	int i=orderService.qrBuy(number);
        	if(i==1) {
        	  return "success";
        	}else {
        		return "faile";
        	}
          
            
              
          } catch (Exception e) {
        	 
          	e.printStackTrace();
          	throw new  JeyooException(ExceptionEnum.SERVER_ERROR, e);
          }
		
      }
    /**

     *房源检举查询
   * @param token
   * @return
     * @throws IOException 
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
  	@PostMapping(value ="/payinit")
      public Map<String,String>  payInit( HttpServletResponse response, HttpServletRequest request,String goodlist,String paytype)  {
          try {
      		  User user=new User();
      		  user=userService.getUserInfo(request);
        	  Map<String,String> map =orderService.cheakOrder(user,goodlist,paytype);
      	      return map;
            
              
          } catch (Exception e) {
        	 
          	e.printStackTrace();
          	throw new  JeyooException(ExceptionEnum.SERVER_ERROR, e);
          }
      }
    
    @ResponseBody
  	@PostMapping(value ="/plaorder")
      public String  plaorder( HttpServletResponse response, HttpServletRequest request,/*@RequestParam Map<String, String> paramMap*/String goodlist,
    		  String qctime,String remark,String pricetotal,String state,int totalcount,String paytype) {
          try {//判断用户有没有登录即有没有用户
          	if(!"1".equals(userService.getUserStauts(request))) {
        		log.info("用户有没有登录");
    			return "";
        	}
          	  User user=new User();
     		  user=userService.getUserInfo(request);
              Map<String,String> map =orderService.cheakOrder(user,goodlist,paytype);
              String number=orderService.plaOrder(user.getUserid(),goodlist,qctime,remark,pricetotal,state,totalcount,paytype,map);
              orderService.setVipPay(user,map,number);
              return number;
            
              
          } catch (Exception e) {
          	e.printStackTrace();
          	throw new  JeyooException(ExceptionEnum.SERVER_ERROR, e);
          }
      }
    
    @RequestMapping("/orderlist")
   	public String orderlist( ModelMap modelMap,HttpServletRequest request, HttpServletResponse response) {
    	
    	HttpSession session = request.getSession();
    	String openId = (String) session.getAttribute("WX_OPEN_ID");
    	 List<Order>  order=orderService.getOrderToday();
    	 List<Order> ordermap=orderService.queryOrderDetails(null);
    	 modelMap.addAttribute("order",order);
    	 modelMap.addAttribute("orderimg",ordermap);
   		return "/order/orderlist";
   	}
    
    
    @RequestMapping("/showdetails")
   	public String orderDetails( ModelMap modelMap ,HttpServletRequest request,String  number) {
    	//判断用户有没有登录即有没有用户
    	if(!"1".equals(userService.getUserStauts(request))) {
    		log.info("用户有没有登录");
			return "";
    	}
    	if(StringUtils.isBlank(number)) {
    		throw new  JeyooException(ExceptionEnum.SERVER_ERROR);
    	}
    	 List<Order>  orderlist=orderService.getOrder(number);
    	 Order order=orderlist.get(0);
    	 List<Order> orderDetail=orderService.queryOrderDetails(number);
    	 String shopid = request.getSession().getAttribute("shopid")==null ? "": request.getSession().getAttribute("shopid").toString();
    	 ShopConfig shopConfig=shopConfigmapper.getShopConfig(Long.valueOf(shopid));
    	 modelMap.addAttribute("order",order);
    	 modelMap.addAttribute("orderDetail",orderDetail);
    	 modelMap.addAttribute("shop",shopConfig);
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
