package com.jeyoo.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jeyoo.mapper.UserContactMapper;
import com.jeyoo.mapper.UserContactattachmentMapper;
import com.jeyoo.pojo.UserContact;
import com.jeyoo.pojo.UserContactattachment;
import com.jeyoo.resultpojo.UserContactResult;
import com.jeyoo.service.UserContactManageService;

@Service("UserContactManageService")
public class UserContactManageServiceImpl implements UserContactManageService {
	
	@Autowired
	private UserContactMapper userContactMapper;
	
	@Override
	public PageInfo<UserContactResult>  findUserContact(Map<String, String> paramMap) {
		//如果是第一进入页面，默认第一页
		//获取参数
		Integer pageNum=Integer.parseInt(paramMap.get("page"));
		Integer pageSize=Integer.parseInt(paramMap.get("limit"));
		//1、设置分页信息，包括当前页数和每页显示的总计数
		PageHelper.startPage(pageNum, pageSize);
		//2、分页查询
    	List<UserContactResult> pageList=userContactMapper.queryList(paramMap);
    	//3、包装分页数据
    	PageInfo<UserContactResult> pagelist= new PageInfo<UserContactResult>(pageList);
    	
		return pagelist;
	}


	@Override
	public UserContactResult getUserContactById(Map<String, String> paramMap) {
		List<UserContactResult> pageList=userContactMapper.queryList(paramMap);
		if(pageList!=null && pageList.size()>0) {
			return pageList.get(0);

		}
		return null;
	}


	@Override
	public Map<String, Object> getTachmentById(Map<String, String> paramMap) {
		List<UserContactattachment> pageList=userContactMapper.getTachmentById(paramMap);
	    List<Map<String, String>> picList=new ArrayList<>();
	    List<Map<String, String>> otherList=new ArrayList<>();
		Map<String, Object> filesMap=new HashMap<>();
		//遍历附件
		
		for (UserContactattachment userContactattachment : pageList) {
			
			String filePath=userContactattachment.getAttachmentpath().trim();
			if(!filePath.isEmpty()) {
				
			
			//文件名
			String fileName = filePath.substring(filePath.lastIndexOf("/")+1);  
			String[] strArray= fileName.toLowerCase().split("\\."); 
		    
		    String suffix = strArray[strArray.length -1];
		    String pics[]= {"jpg","gif","jpeg","png","tif","tiff"};
		    String other[]= {"doc","docx","pdf"};
			// 是否完全匹配
			if(Arrays.asList(pics).contains(suffix)){
				//图片
				Map<String, String> picmap=new HashMap<>();
				picmap.put("fileName", fileName);
				picmap.put("filePath", filePath);
				
            	picList.add(picmap);
            	
            	
			}else if(Arrays.asList(other).contains(suffix)){
				//文档
				Map<String, String> othermap=new HashMap<>();
				othermap.put("fileName", fileName);
				othermap.put("filePath", filePath);
			
				otherList.add(othermap);
			}
			
			}
			
		}
		filesMap.put("images", picList);
		filesMap.put("other", otherList);
		return filesMap;
		
		
		
		
		
	}


	



}
