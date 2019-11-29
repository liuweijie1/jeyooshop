package com.jeyoo.service;

import com.jeyoo.resultpojo.UserOrderRecordResult;

public interface IUserOrderRecordService extends IFindPageService<UserOrderRecordResult>{
	
	public UserOrderRecordResult findTradeDetailByOrderId(Long orderid);
	
	void updateStroeValue(UserOrderRecordResult userOrder);
}
