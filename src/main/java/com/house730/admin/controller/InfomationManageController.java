package com.house730.admin.controller;


import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.house730.admin.Exception.ExceptionEnum;
import com.house730.admin.Exception.HouseException;
import com.house730.admin.pojo.AdminEmployee;
import com.house730.admin.pojo.Infomation;
import com.house730.admin.pojo.InformationCategory;
import com.house730.admin.pojo.UserContact;
import com.house730.admin.pojo.UserContactattachment;
import com.house730.admin.resultpojo.InfomationResult;
import com.house730.admin.resultpojo.InformationCategoryResult;
import com.house730.admin.resultpojo.UserContactResult;
import com.house730.admin.service.InfomationManageService;
import com.house730.admin.service.UserContactManageService;

import com.house730.admin.utils.PageUtils;
import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 *  资讯管理
 * @author wbliuwj
 *
 */
@Slf4j
@Controller
@RequestMapping("infomationmanage")
public class InfomationManageController {
  
    @Autowired
    private InfomationManageService infomationManageService;
    
    
  //-----------------------------------大分類開始---------------------------------------------//
    
    
    
    
    @GetMapping("/category")
	public String toProcess(Model model) {
		return "infomationManage/category";
	}
    
    
    /**

     *咨询大分类查询
   * @param
   * @return
   */


    @ResponseBody
	@GetMapping(value ="/getCategoryPage")
    public Object  getCategoryPage( HttpServletResponse response, HttpServletRequest request,@RequestParam Map<String, String> paramMap) {
        try {
        	
        	paramMap.put("parentcategoryid", "0");
        	PageInfo<InformationCategory> pageList= infomationManageService.findCategory(paramMap);
			Map<String, Object> mp = PageUtils.getMap(pageList);
			return mp;
            
        } catch (Exception e) {
        	
        	throw new  HouseException(ExceptionEnum.SERVER_ERROR, e);
        }
    }
    
    /**

     *刪除咨询大分类查询
   * @param
   * @return
   */
    
	@GetMapping("/delCategory")
	@ResponseBody
	public Map<String, Object> delCategory(@RequestParam("catagoryId") String catagoryId) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			infomationManageService.delCategory(catagoryId);
			map.put("success", true);
			map.put("message", "1");

		} catch (Exception e) {
            e.printStackTrace();
			map.put("success", false);
			map.put("message", "0");
		}
		return map;
	}
	
	 /**

     *新增咨詢大分类查询
   * @param
   * @return
   */
    
	@GetMapping("/addCategory")
	@ResponseBody
	public String addCategory(HttpServletRequest request,@RequestParam Map<String, String> paramMap) {
	
		try {
			AdminEmployee adminEmployee=(AdminEmployee) request.getSession().getAttribute("admin");
			String employeename =adminEmployee.getEmployeename() == null ? "": adminEmployee.getEmployeename();
			int result =infomationManageService.addCategory(paramMap,employeename);
			return String.valueOf(result);
			
		} catch (Exception e) {
            throw new  HouseException(ExceptionEnum.SERVER_ERROR, e);
		}
		
	}
	
	  /**

     *大分类查询
   * @param
   * @return
   */
    
	@GetMapping("/getCategoryById")
	@ResponseBody
	public Map<String, Object> getCategoryById(@RequestParam("catagoryId") String catagoryId) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			InformationCategory informationCategory=infomationManageService.getCategoryById(catagoryId);
			map.put("informationCategory", informationCategory);
		
		} catch (Exception e) {
			  throw new  HouseException(ExceptionEnum.SERVER_ERROR, e);
		}
		return map;
	}
	
	
	/**

     *新增咨詢大分类查询
   * @param
   * @return
   */
    
	@GetMapping("/editCategory")
	@ResponseBody
	public String editCategory(HttpServletRequest request,@RequestParam Map<String, String> paramMap) {
	
		try {
			AdminEmployee adminEmployee=(AdminEmployee) request.getSession().getAttribute("admin");
			String employeename =adminEmployee.getEmployeename() == null ? "": adminEmployee.getEmployeename();
			int result =infomationManageService.editCategory(paramMap,employeename);
			return String.valueOf(result);
			
		} catch (Exception e) {
            throw new  HouseException(ExceptionEnum.SERVER_ERROR, e);
		}
		
	}
	
	
	
	//-----------------------------------大分類結束---------------------------------------------//
    
	//-----------------------------------小分類開始---------------------------------------------//
	
	
	

    
    @GetMapping("/subcategory")
	public String toSubcategory(Model model) {
		return "infomationManage/subcategory";
	}
    /**

     *查詢大小分类下拉框
   * @param
   * @return
   */
    
	@GetMapping("/findCategoryxl")
	@ResponseBody
	public Object findCategoryxl(@RequestParam  Map<String, String> paramMap) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			List<InformationCategory> categorynameList= infomationManageService.findCategoryxl(paramMap);
			List<InformationCategory> subcategorynameList= infomationManageService.findCategoryxl(paramMap);
			map.put("categorynameList", categorynameList);
			map.put("subcategorynameList", subcategorynameList);
			return map;
		} catch (Exception e) {
			  throw new  HouseException(ExceptionEnum.SERVER_ERROR, e);
		}
		
	}
	
	 /**

     *檢查排序是否存在
   * @param
   * @return
   */
    
	@GetMapping("/checkData")
	@ResponseBody
	public Object checkData(@RequestParam  Map<String, String> paramMap) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			List<InformationCategory> categorynameList= infomationManageService.checkData(paramMap);
			if(categorynameList!=null&&categorynameList.size()>0) {
				map.put("result", false);
			}else {
				map.put("result", true);
			}
			
			return map;
		} catch (Exception e) {
			  throw new  HouseException(ExceptionEnum.SERVER_ERROR, e);
		}
		
	}
    
    /**

     *咨询大分类查询
   * @param
   * @return
   */


    @ResponseBody
	@GetMapping(value ="/getSubCategoryPage")
    public Object  getSubCategoryPage( HttpServletResponse response, HttpServletRequest request,@RequestParam Map<String, String> paramMap) {
        try {
        	//log.debug(msg);
        	PageInfo<InformationCategoryResult> pageList= infomationManageService.findSubCategory(paramMap);
			Map<String, Object> mp = PageUtils.getMap(pageList);
			return mp;
            
        } catch (Exception e) {
        	
        	throw new  HouseException(ExceptionEnum.SERVER_ERROR, e);
        }
    }
    
	
	
	
	//-----------------------------------新聞咨詢開始---------------------------------------------//
	
	
    
    @GetMapping("/infomation")
	public String toInfomation(Model model) {
		return "infomationManage/infomation";
	}
    
    
    /**

     *咨询大分类查询
   * @param
   * @return
   */


    @ResponseBody
	@GetMapping(value ="/getInfomationPage")
    public Object  getInfomationPage( HttpServletResponse response, HttpServletRequest request,@RequestParam Map<String, String> paramMap) {
        try {
        	//log.debug(msg);
        	
        	PageInfo<InfomationResult> pageList= infomationManageService.findInfomation(paramMap);
			Map<String, Object> mp = PageUtils.getMap(pageList);
			return mp;
            
        } catch (Exception e) {
        	
        	throw new  HouseException(ExceptionEnum.SERVER_ERROR, e);
        }
    }
    
	

    /**

      *刪除资讯
    * @param token
    * @return
    */
     
 	@GetMapping("/delInfomation")
 	@ResponseBody
 	public Map<String, Object> delInfomation(@RequestParam("informationId") String informationId) {
 		Map<String, Object> map = new HashMap<String, Object>();
 		try {
 			infomationManageService.delInfomation(informationId);
 			map.put("success", true);
 			map.put("message", "1");

 		} catch (Exception e) {
             e.printStackTrace();
 			map.put("success", false);
 			map.put("message", "0");
 		}
 		return map;
 	}
 	
 	
 	
 	
 	 @GetMapping("/toAddInfomation")
 		public String toAddInfomation(Model model) {
 			return "infomationManage/addInfomation";
 		}
 	
	
	
	
	 /**

      *新增咨詢大分类查询
    * @param
    * @return
    */
     
 	@PostMapping("/addInfomation")
 	@ResponseBody
 	public String addInfomation(HttpServletRequest request,@RequestParam Map<String, String> paramMap) {
 	
 		try {
 			AdminEmployee adminEmployee=(AdminEmployee) request.getSession().getAttribute("admin");
 			String employeename =adminEmployee.getEmployeename() == null ? "": adminEmployee.getEmployeename();
 			int result =infomationManageService.addInfomation(paramMap,employeename);
 			return String.valueOf(result);
 			
 		} catch (Exception e) {
             throw new  HouseException(ExceptionEnum.SERVER_ERROR, e);
 		}
 		
 	}

    /**
     * 查看詳情
     * @param response
     * @param request
     * @param paramMap
     * @return
     */
  
	@GetMapping(value ="/toEditInfomation")
       public String  toEditInfomation( Model model,HttpServletResponse response, HttpServletRequest request,@RequestParam Map<String, String> paramMap) {
           try {
        	   
        	InfomationResult InfomationResult= infomationManageService.getInfomationById(paramMap);
            //详情信息
           	model.addAttribute("InfomationResult", InfomationResult);
       		return "infomationManage/editInfomation";
               
           } catch (Exception e) {
           	
           	e.printStackTrace();
           	throw new  HouseException(ExceptionEnum.SERVER_ERROR, e);
           }
       }
	
	
	 /**

     *新增咨詢大分类查询
   * @param
   * @return
   */
    
	@PostMapping("/editInfomation")
	@ResponseBody
	public String editInfomation(HttpServletRequest request,@RequestParam Map<String, String> paramMap) {
	
		try {
			AdminEmployee adminEmployee=(AdminEmployee) request.getSession().getAttribute("admin");
			String employeename =adminEmployee.getEmployeename() == null ? "": adminEmployee.getEmployeename();
			int result =infomationManageService.editInfomation(paramMap,employeename);
			return String.valueOf(result);
			
		} catch (Exception e) {
            throw new  HouseException(ExceptionEnum.SERVER_ERROR, e);
		}
		
	}
}
