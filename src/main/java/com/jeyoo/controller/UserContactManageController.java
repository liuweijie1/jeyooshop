package com.jeyoo.controller;


import com.github.pagehelper.PageInfo;
import com.jeyoo.Exception.ExceptionEnum;
import com.jeyoo.Exception.JeyooException;
import com.jeyoo.pojo.UserContact;
import com.jeyoo.pojo.UserContactattachment;
import com.jeyoo.resultpojo.UserContactResult;
import com.jeyoo.service.UserContactManageService;
import com.jeyoo.utils.PageUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 *  联络我们管理
 * @author wbliuwj
 *
 */
@Controller
@RequestMapping("page/allcategory")
public class UserContactManageController {
  
    @Autowired
    private UserContactManageService userContactService;

    
   
    @GetMapping("/process")
	public String toProcess(Model model) {
		return "/allcategory/allcategory2";
	}
    
 
    
    /**

     *联络我们查询
   * @param token
   * @return
   */


    @ResponseBody
	@GetMapping(value ="/getPage")
    public Object  getPage( HttpServletResponse response, HttpServletRequest request,@RequestParam Map<String, String> paramMap) {
        try {
        	
        	PageInfo<UserContactResult> pageList= userContactService.findUserContact(paramMap);
			Map<String, Object> mp = PageUtils.getMap(pageList);
			return mp;
            
        } catch (Exception e) {
        	
        	e.printStackTrace();
        	throw new  JeyooException(ExceptionEnum.SERVER_ERROR, e);
        }
    }
    

    
    /**
     * 查看詳情
     * @param response
     * @param request
     * @param paramMap
     * @return
     */
  
	@GetMapping(value ="/toDetail")
       public String  toDetail( Model model,HttpServletResponse response, HttpServletRequest request,@RequestParam Map<String, String> paramMap) {
           try {
           	
        	UserContactResult UserContactResult= userContactService.getUserContactById(paramMap);
           	Map<String,Object> filesMap=userContactService.getTachmentById(paramMap);
            //详情信息
           	model.addAttribute("UserContact", UserContactResult);
           	//附件预览
        	model.addAttribute("filesMap", filesMap);
       		return "userContact/checkOrder";
               
           } catch (Exception e) {
           	
           	e.printStackTrace();
           	throw new  JeyooException(ExceptionEnum.SERVER_ERROR, e);
           }
       }
}
