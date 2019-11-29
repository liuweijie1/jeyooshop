package com.jeyoo.utils;

import com.github.pagehelper.PageInfo;
import com.jeyoo.Exception.ExceptionEnum;
import com.jeyoo.Exception.JeyooException;
import com.jeyoo.resultpojo.PropertyAuditResult;

import java.util.LinkedHashMap;
import java.util.Map;

//分页计算工具类
public class PageUtils<T> {
		
		//每页显示条数 
	    private static int pageCount=10; 
	    
	    private static final int NAVIGATEPAGES = 7; // 导航页码数


	public static Map<String, Object> getMap(PageInfo pageinfo) {
		Map<String, Object> mp = new LinkedHashMap<>();
		mp.put("code", "0");
		if (pageinfo != null) {
			mp.put("count", pageinfo.getTotal());
			if (pageinfo.getTotal() > 0) {
				mp.put("msg", "獲取數據成功");
				mp.put("data", pageinfo.getList());
			} else {
				mp.put("msg", "無數據");
			}
		} else {
			mp.put("msg", new JeyooException(ExceptionEnum.BAD_REQUEST));
		}
		return mp;
	}
		
		 	
	//当前页 总记录数 每页显示数量
	public static PageSearch shzwo(String pageNum,int alltotal,int pageSize,String url,boolean isys,String param) {
		if("".equals(pageNum)||pageNum==null) {
			pageNum="1";
		}
		int pageIndex = Integer.parseInt(pageNum);
		PageSearch page = new PageSearch();//填充对象
		//计算总页数
			if((alltotal%pageSize)!=0){//有多余数据则计算出的总页数+1
				page.setAllPages((alltotal/pageSize)+1);
			}else {//无多余数据则直接赋值
				page.setAllPages(alltotal/pageSize);
			}
		if(page.getAllPages()<=NAVIGATEPAGES) {//等于分页导航数量且小于等于分页导航显示数量
			//填充当前页 
			page.setPageshow(pageIndex);
			//填充是否第一页
			page.setFirstPage(pageIndex==1);
			page.setAlltotal(alltotal);
			page.setListPage(page.getAllPages());
			page.setLastPage(pageIndex==page.getAllPages()&&pageIndex!=1);
			page.setHasNextPage(pageIndex<page.getAllPages());
			page.setHasPreviousPage(pageIndex>1);
			//  
			int[] navigatePageNumbers=new int[page.getAllPages()];
			for(int i=0;i<navigatePageNumbers.length;i++) {
				navigatePageNumbers[i]=i+1;
			}
			page.setPageshows(navigatePageNumbers);//填充列表
			if(isys) {
				page.setPageUrl(url+"?index=");
			}else {
				if(param.contains("index")) {
					param = param.substring(0,param.lastIndexOf('&'));
				}
				page.setPageUrl(url+"?"+param+"&index=");
			}
	    }else{//满足分页导航数并有多余数
	    	//填充当前页 
			page.setPageshow(pageIndex);
			//填充是否第一页
			page.setFirstPage(pageIndex==1);
			page.setListPage(page.getAllPages());
			page.setLastPage(pageIndex==NAVIGATEPAGES && pageIndex!=1);
			page.setHasNextPage(pageIndex<page.getAllPages());
			page.setHasPreviousPage(pageIndex>1);
			int[] navigatePageNumbers=new int[NAVIGATEPAGES];
			//计算分页导航栏第一页的页数
			 int startNum=pageIndex-8/2;
	            int endNum=pageIndex+8/2;
	            if(startNum<1){
	                startNum=1;
	                //(最前navigatePages页
	                for(int i=0;i<NAVIGATEPAGES;i++){
	                    navigatePageNumbers[i]=startNum++;
	                }
	            }else if(endNum>page.getAllPages()){
	                endNum=page.getAllPages();
	                //最后navigatePages页
	                for(int i=NAVIGATEPAGES-1;i>=0;i--){
	                    navigatePageNumbers[i]=endNum--;
	                }
	            }else{
	                //所有中间页
	                for(int i=0;i<NAVIGATEPAGES;i++){
	                    navigatePageNumbers[i]=startNum++;
	                }
	            }
			page.setPageshows(navigatePageNumbers);//填充列表
			if(isys) {
				page.setPageUrl(url+"?index=");
			}else {
				if(param.contains("index")) {
					param = param.substring(0,param.lastIndexOf('&'));
				}
				page.setPageUrl(url+"?"+param+"&index=");
			}
	    }
		//计算页面边界及显示样式
		return page;
	}
	
}
