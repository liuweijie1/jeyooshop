package com.house730.admin.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.house730.admin.Exception.ExceptionEnum;
import com.house730.admin.Exception.HouseException;
import com.house730.admin.mapper.PropertyMapper;
import com.house730.admin.pojo.PropertySimilar;
import com.house730.admin.resultpojo.Agent;
import com.house730.admin.resultpojo.PropertyReleaseResult;
import com.house730.admin.service.IPropertyReleaseService;
import com.house730.admin.service.IUserOrderRecordService;
import com.house730.admin.service.IUserUsageRecordService;
import com.house730.admin.vo.ManagerPropertyEnum;

/**
 * 放盤管理
 * @author wbqiutj
 *	2019年4月20日
 */
@Service(value = "propertyReleaseService")
public class PropertyReleaseImpl implements IPropertyReleaseService{
	
	@Autowired
	private PropertyMapper propertyMapper;
	
	@Autowired
	IUserOrderRecordService iFindPageService;
	
	@Autowired
	IUserUsageRecordService userUsageRecordService;
	
	@Override
	public PageInfo<PropertyReleaseResult> findReleasePage(Map<String, Object> paramMap) {
		PageInfo<PropertyReleaseResult> pageInfo = null;
		if(null != paramMap) {
			try {
				//获取参数
				Integer pno=Integer.parseInt(String.valueOf(paramMap.get("page")));
				Integer pageSize=Integer.parseInt(String.valueOf(paramMap.get("limit")));
				PageHelper.startPage(pno, pageSize);
				List<PropertyReleaseResult> list = propertyMapper.findReleasePage(paramMap);
				pageInfo = new PageInfo<PropertyReleaseResult>(list);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return pageInfo;
	}

	@Override
	public PropertyReleaseResult findReleaseDetailByPropertyId(Long propertyId) {
		PropertyReleaseResult property = propertyMapper.findReleaseDetailByPropertyId(propertyId);
		//查詢經紀人
        List<Agent> user=  propertyMapper.getUserBypropertyid(propertyId);
        property.setUser(user);
        //查詢房源圖片
        List<String> propertyimg = propertyMapper.getProImage( propertyId);
        property.setProimg(propertyimg);
        //查詢審核圖片
        List<String> labelimg = propertyMapper.getLabelImage(propertyId);
        property.setLabelimg(labelimg);
        //查詢一級分類
        String category = propertyMapper.category(propertyId);
        property.setCategory(category);
        //查詢二級分類
        List<String> subcategory = propertyMapper.subcategory(propertyId);
        property.setSubcategory(subcategory);
        //查詢附近樓盤
        PropertySimilar similar = propertyMapper.similarProperty(propertyId);
        property.setSimilar(similar);
		return property;
	}
	
	@Override
	public void upOrDownProperty(Long propertyid,Boolean isadminoffline) {
		if(null == propertyid) throw new HouseException(ExceptionEnum.BAD_REQUEST);
		PropertyReleaseResult result = findReleaseDetailByPropertyId(propertyid);
		if(result != null) {
			//result.setPropertystatus(ManagerPropertyEnum.PROPERTY_PROPERTYSTATUS.getStatus());
			result.setIsadminoffline(isadminoffline);
			int num = propertyMapper.updateProperty(result);
			if(num == 0) {
				throw new HouseException(ExceptionEnum.PROPERTY_UPDATE_ERROR);
			}
		}
	}
	
	/**
	 * 放盤審核
	 * @param propertyid
	 * @param apply   (true：通過，false：不通過)
	 */
	@Override
	public int releaseApply(Long propertyId,Boolean apply) {
		if(null == propertyId) throw new HouseException(ExceptionEnum.BAD_REQUEST);
		PropertyReleaseResult result = findReleaseDetailByPropertyId(propertyId);
		if(result != null) {
			result.setApprovalTime(new Date());
			result.setApprovalstatus(apply?ManagerPropertyEnum.PROPERTY_APPROVAL_PASS.getStatus():ManagerPropertyEnum.PROPERTY_APPROVAL_NOPASS.getStatus());
			int num = propertyMapper.updateProperty(result);
			if(num == 0) {
				throw new HouseException(ExceptionEnum.PROPERTY_APPROVAL_ERROR);
			}
		}
		//propertyMapper.updateProperty(propertyId);
		return 0;
	}

}
