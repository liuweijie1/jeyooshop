package com.house730.admin.mapper;

import java.util.List;
import java.util.Map;

import com.house730.admin.pojo.Infomation;
import com.house730.admin.pojo.InformationCategory;
import com.house730.admin.resultpojo.InfomationResult;
import com.house730.admin.resultpojo.InformationCategoryResult;
import com.house730.admin.resultpojo.UserContactResult;

public interface InfomationMapper {
    int insert(Infomation record);

    int insertSelective(Infomation record);
    /**
     * 查询大分类
     * @param paramMap
     * @return
     */
    List<InformationCategory> queryCatagoryList(Map<String, String> paramMap) ;
    /**
	 * 刪除資訊大分类
	 * @param paramMap
	 * @return
	 */
	int delCategory(String catagoryId);
	 /**
		 * 刪除資訊小分类
		 * @param paramMap
		 * @return
		 */
	int delSubCategory(String catagoryId);
	 /**
	 * 根据父ID查询資訊小分类
	 * @param List
	 * @return
	 */
	List<InformationCategory> findSubCategoryByParentID(String catagoryId);
	/**
	 * 新增大分類
	 * @param int
	 * @return
	 */
	int addCategory(InformationCategory paramMap);
	/**
	 * 根據id查詢大分類大分类
	 * @param catagoryId
	 * @param  
	 * @return InformationCategory
	 */
	InformationCategory getCategoryById(String catagoryId);
	/**
	 * 編輯資訊大分类
	 * @param paramMap
	 * @param employeename 
	 * @return
	 */
	int editCategory(InformationCategory informationCategory);
	
	
	
	 /**
     * 查询小分类
     * @param paramMap
     * @return
     */
	List<InformationCategoryResult> querySubCatagoryList(Map<String, String> paramMap);
	 /**
     * 查询大分类下拉
     * @param paramMap
     * @return
     */
	List<InformationCategory> findCategoryxl(Map<String, String> paramMap);
	 /**
     * 查询新聞咨詢
     * @param paramMap
     * @return
     */
	List<InfomationResult> queryInfomationList(Map<String, String> paramMap);
	 /**
      *   删除新聞咨詢
     * @param informationId
     * @return
     */
	int delInfomation(String informationId);
	 /**
     *   新增新聞咨詢
    * @param informationId
    * @return
    */
	int addInfomation(Infomation infomation);
	 /**
     *   修改新聞咨詢
    * @param informationId
    * @return
    */
	int updataInfomation(Infomation infomation);

	
}