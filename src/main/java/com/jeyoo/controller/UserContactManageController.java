package com.jeyoo.controller;


import com.jeyoo.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;

/**
 *  联络我们管理
 * @author wbliuwj
 *
 */
@Controller
@RequestMapping("page/allcategory")
@Slf4j
public class UserContactManageController {
  
    
    @Autowired
  	private UserService userService;
    
   
    @GetMapping("/process")
	public String toProcess(Model model,HttpServletRequest request) {
    	//判断用户有没有登录即有没有用户
    	if(!"1".equals(userService.getUserStauts(request))) {
    		log.info("用户有没有登录");
			return "";
    	}
		return "/allcategory/allcategory2";
	}
    
}
    
    /**

     *联络我们查询
   * @param token
   * @return
   */


   /* @ResponseBody
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
    

    */
    /**
     * 查看詳情
     * @param response
     * @param request
     * @param paramMap
     * @return
     */
  
	/*@GetMapping(value ="/toDetail")
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
*/