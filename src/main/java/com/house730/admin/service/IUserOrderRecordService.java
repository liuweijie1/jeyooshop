package com.house730.admin.service;

import com.house730.admin.resultpojo.UserOrderRecordResult;

public interface IUserOrderRecordService extends IFindPageService<UserOrderRecordResult>{
	
	public UserOrderRecordResult findTradeDetailByOrderId(Long orderid);
	
	void updateStroeValue(UserOrderRecordResult userOrder);
}
