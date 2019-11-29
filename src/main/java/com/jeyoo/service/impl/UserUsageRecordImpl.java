package com.jeyoo.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeyoo.Exception.ExceptionEnum;
import com.jeyoo.Exception.JeyooException;
import com.jeyoo.mapper.UserUsageRecordMapper;
import com.jeyoo.pojo.UserUsageRecord;
import com.jeyoo.service.IUserOrderRecordService;
import com.jeyoo.service.IUserUsageRecordService;

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
				throw new JeyooException(ExceptionEnum.USAGE_RECORD_UPDATE_ERROR);
			}
		}else {
			throw new JeyooException(ExceptionEnum.BAD_REQUEST);
		}
		// TODO Auto-generated method stub
		
	}
	
	

}
