package com.house730.admin.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.house730.admin.Exception.ExceptionEnum;
import com.house730.admin.Exception.HouseException;
import com.house730.admin.mapper.UserUsageRecordMapper;
import com.house730.admin.pojo.UserUsageRecord;
import com.house730.admin.service.IUserOrderRecordService;
import com.house730.admin.service.IUserUsageRecordService;

/**
 * 	 屋币使用记录
 * @author wbqiutj
 *	2019年4月25日
 */
@Service(value = "userUsageRecordService")
public class UserUsageRecordImpl implements IUserUsageRecordService{
	
	@Autowired
	private UserUsageRecordMapper userUsageRecordMapper;
	
	@Autowired
	IUserOrderRecordService iFindPageService;

	@Override
	public void saveUsageRecord(UserUsageRecord record) {
		if(null != record) {
			int num = userUsageRecordMapper.insertSelective(record);
			if(num == 0) {
				throw new HouseException(ExceptionEnum.USAGE_RECORD_UPDATE_ERROR);
			}
		}else {
			throw new HouseException(ExceptionEnum.BAD_REQUEST);
		}
		// TODO Auto-generated method stub
		
	}
	
	

}
