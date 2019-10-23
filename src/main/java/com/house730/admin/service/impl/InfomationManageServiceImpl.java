package com.house730.admin.service.impl;



import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.house730.admin.Exception.ExceptionEnum;
import com.house730.admin.Exception.HouseException;
import com.house730.admin.mapper.InfomationMapper;
import com.house730.admin.pojo.Infomation;
import com.house730.admin.pojo.InformationCategory;
import com.house730.admin.resultpojo.InfomationResult;
import com.house730.admin.resultpojo.InformationCategoryResult;
import com.house730.admin.service.InfomationManageService;
import com.house730.admin.utils.NumberUtils;

@Service("InfomationManageService")
public class InfomationManageServiceImpl implements InfomationManageService {
	
	@Autowired
	private InfomationMapper infomationMapper;
	
	@Override
	public PageInfo<InformationCategory>  findCategory(Map<String, String> paramMap) {
		//如果是第一进入页面，默认第一页
		//获取参数
		Integer pageNum=Integer.parseInt(paramMap.get("page"));
		Integer pageSize=Integer.parseInt(paramMap.get("limit"));
		//1、设置分页信息，包括当前页数和每页显示的总计数
		PageHelper.startPage(pageNum, pageSize);
		//2、分页查询
    	List<InformationCategory> pageList=infomationMapper.queryCatagoryList(paramMap);
    	//3、包装分页数据
    	PageInfo<InformationCategory> pagelist= new PageInfo<InformationCategory>(pageList);
    	
		return pagelist;
	}

	@Override
	@Transactional
	public void delCategory(String catagoryId) {
		int catnum= infomationMapper.delCategory(catagoryId);
		if(catnum == 0) {
			throw new HouseException(ExceptionEnum.ORDER_UPDATE_ERROR);
		}
		List<InformationCategory> subCategory =infomationMapper.findSubCategoryByParentID(catagoryId);
		if(subCategory!=null&&subCategory.size()>0) {
			int cubnum =infomationMapper.delSubCategory(catagoryId);
			if(cubnum == 0) {
				throw new HouseException(ExceptionEnum.ORDER_UPDATE_ERROR);
			}
		}
		
		
	}

	@Override
	public int addCategory(Map<String, String> paramMap,String employeename) {
		
		InformationCategory informationCategory=new InformationCategory();
		informationCategory.setCatagoryid(Integer.valueOf(NumberUtils.generateCode(11)));
		informationCategory.setCategoryname(paramMap.get("categoryname"));
		informationCategory.setCategorynameen(paramMap.get("categorynameen"));
		informationCategory.setSeqence(Integer.valueOf(paramMap.get("sequence")));
		if(paramMap.containsKey("isshow")) {
			informationCategory.setIsshow(paramMap.get("isshow").equals("0")?false:true);;
		}else {
			informationCategory.setIsshow(true);;
		}
		
		informationCategory.setCreatetime(new Date());
		informationCategory.setCreateuser(employeename);
		informationCategory.setParentcategoryid(Integer.valueOf(paramMap.get("parentcategoryid")));
	/*	informationCategory.setUpdatetime(new Date());
		informationCategory.setUpdateuser(employeename);*/
		return  infomationMapper.addCategory(informationCategory);
	}

	@Override
	public InformationCategory getCategoryById(String catagoryId) {
		InformationCategory informationCategory=infomationMapper.getCategoryById(catagoryId);
		return informationCategory;
	}

	@Override
	public int editCategory(Map<String, String> paramMap, String employeename) {
		InformationCategory informationCategory=new InformationCategory();
		informationCategory.setCatagoryid(Integer.valueOf(paramMap.get("catagoryid")));
		informationCategory.setCategoryname(paramMap.get("categoryname"));
		informationCategory.setCategorynameen(paramMap.get("categorynameen"));
		informationCategory.setSeqence(Integer.valueOf(paramMap.get("sequence")));
		if(paramMap.containsKey("isshow")) {
			informationCategory.setIsshow(paramMap.get("isshow").equals("0")?false:true);;
		}else {
			informationCategory.setIsshow(true);;
		}
		
		informationCategory.setUpdatetime(new Date());
		informationCategory.setUpdateuser(employeename);
		return  infomationMapper.editCategory(informationCategory);
		
	}
//---------------------------------------------小分類開始--------------------------------------------------------//
	
	
	@Override
	public PageInfo<InformationCategoryResult>  findSubCategory(Map<String, String> paramMap) {
		//如果是第一进入页面，默认第一页
		//获取参数
		Integer pageNum=Integer.parseInt(paramMap.get("page"));
		Integer pageSize=Integer.parseInt(paramMap.get("limit"));
		//1、设置分页信息，包括当前页数和每页显示的总计数
		PageHelper.startPage(pageNum, pageSize);
		//2、分页查询
    	List<InformationCategoryResult> pageList=infomationMapper.querySubCatagoryList(paramMap);
    	//3、包装分页数据
    	PageInfo<InformationCategoryResult> pagelist= new PageInfo<InformationCategoryResult>(pageList);
    	
		return pagelist;
	}

	@Override
	public List<InformationCategory> findCategoryxl(Map<String, String> paramMap) {
		Map<String, Object> map = new HashMap<String, Object>();
		return infomationMapper.queryCatagoryList( paramMap);
	}

	@Override
	public PageInfo<InfomationResult> findInfomation(Map<String, String> paramMap) {
		//如果是第一进入页面，默认第一页
				//获取参数
				Integer pageNum=Integer.parseInt(paramMap.get("page"));
				Integer pageSize=Integer.parseInt(paramMap.get("limit"));
				//1、设置分页信息，包括当前页数和每页显示的总计数
				PageHelper.startPage(pageNum, pageSize);
				//2、分页查询
		    	List<InfomationResult> pageList=infomationMapper.queryInfomationList(paramMap);
		    	//3、包装分页数据
		    	PageInfo<InfomationResult> pagelist= new PageInfo<InfomationResult>(pageList);
		    	
				return pagelist;
	}

	@Override
	public void delInfomation(String informationId) {
		int catnum= infomationMapper.delInfomation(informationId);
		if(catnum == 0) {
			throw new HouseException(ExceptionEnum.ORDER_UPDATE_ERROR);
		}
	}

	@Override
	public int addInfomation(Map<String, String> paramMap, String employeename) {
		try {
			Infomation infomation = new Infomation();
			infomation.setInformationid(Long.valueOf(NumberUtils.generateCode(20)));
			infomation.setCategoryid(Integer.valueOf(paramMap.get("categoryid")));
			infomation.setSubcategoryid(Integer.valueOf(paramMap.get("subcategoryid")));
			infomation.setTitle(paramMap.get("title").trim());
			infomation.setTitleen(paramMap.get("titleen").trim());
			infomation.setContent(paramMap.get("content"));
			infomation.setContenten(paramMap.get("contenten"));
			infomation.setIspush(paramMap.get("ispush").equals("0") ? false : true);
			String dateInString = paramMap.get("pushtime");
			if("newDate".equals(dateInString)) {
				infomation.setPushtime(new Date());
			  }else {
			
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
				Date date = formatter.parse(dateInString);
				infomation.setPushtime(date);
			  }
			infomation.setPublishtime(new Date());
			infomation.setPushplatform(paramMap.get("pushplatform"));
			infomation.setCreatetime(new Date());
			infomation.setCreateuser(employeename);
			int result = infomationMapper.addInfomation(infomation);
			return result;
		} catch (Exception e) {
			  throw new  HouseException(ExceptionEnum.SERVER_ERROR, e);
		}
		

	}

	@Override
	public InfomationResult getInfomationById(Map<String, String> paramMap) {
		List<InfomationResult> InfomationList=infomationMapper.queryInfomationList(paramMap);
		InfomationResult InfomationResult=InfomationList.get(0);
		return InfomationResult;
	}

	@Override
	public int editInfomation(Map<String, String> paramMap, String employeename) {
		try {
			Infomation infomation = new Infomation();
			infomation.setInformationid(Long.valueOf(paramMap.get("informationid")));
			infomation.setCategoryid(Integer.valueOf(paramMap.get("categoryid")));
			infomation.setSubcategoryid(Integer.valueOf(paramMap.get("subcategoryid")));
			infomation.setTitle(paramMap.get("title").trim());
			infomation.setTitleen(paramMap.get("titleen").trim());
			infomation.setContent(paramMap.get("content"));
			infomation.setContenten(paramMap.get("contenten"));
			infomation.setIspush(paramMap.get("ispush").equals("0") ? false : true);
			String dateInString = paramMap.get("pushtime");
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			Date date = formatter.parse(dateInString);
			infomation.setPushtime(date);
			infomation.setPushplatform(paramMap.get("pushplatform"));
			
			infomation.setUpdatetime(new Date());
			infomation.setUpdateuser(employeename);
			int result = infomationMapper.updataInfomation(infomation);
			return result;
		} catch (Exception e) {
			  throw new  HouseException(ExceptionEnum.SERVER_ERROR, e);
		}
		

	}

	@Override
	public List<InformationCategory> checkData(Map<String, String> paramMap) {
		List<InformationCategory> pageList=infomationMapper.queryCatagoryList(paramMap);
		return pageList;
	}


/*	@Override
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
*/




	



}
