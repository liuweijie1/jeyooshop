package com.house730.admin.service;

import java.util.List;
import java.util.Map;


import com.github.pagehelper.PageInfo;
import com.house730.admin.pojo.Infomation;
import com.house730.admin.pojo.InformationCategory;
import com.house730.admin.pojo.UserContact;
import com.house730.admin.pojo.UserContactattachment;
import com.house730.admin.resultpojo.InfomationResult;
import com.house730.admin.resultpojo.InformationCategoryResult;
import com.house730.admin.resultpojo.UserContactResult;


public interface InfomationManageService {
	
   

	/**
	 * 查询大分类
	 * @param paramMap
	 * @return
	 */
	

	public PageInfo<InformationCategory> findCategory(Map<String, String> paramMap);
	/**
	 * 刪除資訊大分类
	 * @param paramMap
	 * @return
	 */
	
	public void delCategory(String catagoryId);
	/**
	 * 新增資訊大分类
	 * @param paramMap
	 * @param employeename 
	 * @return
	 */
	public int addCategory(Map<String, String> paramMap, String employeename);
	/**
	 * 根據id查詢大分類大分类
	 * @param paramMap
	 * @param employeename 
	 * @return
	 */
	public InformationCategory getCategoryById(String catagoryId);
	
	/**
	 * 編輯資訊大分类
	 * @param paramMap
	 * @param employeename 
	 * @return
	 */
	public int editCategory(Map<String, String> paramMap, String employeename);
	
	/**
	 *檢查排序是否存在
	 * @param employeename
	 * @param paramMap
	 * @return
	 */
	public List<InformationCategory> checkData(Map<String, String> paramMap); 
	
	//-----------------------------------小分類開始-------------------------------------//
	/**
	 * 查询小分类
	 * @param paramMap
	 * @return
	 */
	
	PageInfo<InformationCategoryResult> findSubCategory(Map<String, String> paramMap);
	/**
	 * 查询大分类下拉框
	 * @param string
	 * @return
	 */
	
	public List<InformationCategory> findCategoryxl(Map<String, String> paramMap);
	
	
	
	
	//-----------------------------------新聞開始-------------------------------------//
	/**
	 * 查询新聞咨詢
	 * @param paramMap
	 * @return
	 */
	public PageInfo<InfomationResult> findInfomation(Map<String, String> paramMap);
	/**
	 * 删除新聞咨詢
	 * @param informationId
	 * @return
	 */
	public void delInfomation(String informationId);
	/**
	 * 新增新聞咨詢
	 * @param employeename
	 * @param paramMap
	 * @return
	 */
	public int addInfomation(Map<String, String> paramMap, String employeename);
	/**
	 * 查询新聞咨詢
	 * @param paramMap
	 * @return
	 */
	public InfomationResult getInfomationById(Map<String, String> paramMap);
	/**
	 *编辑新聞咨詢
	 * @param employeename
	 * @param paramMap
	 * @return
	 */
	public int editInfomation(Map<String, String> paramMap, String employeename);
	
    
}
