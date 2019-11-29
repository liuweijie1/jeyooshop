package com.jeyoo.mapper;


import com.jeyoo.pojo.UserOrderRecord;
import com.jeyoo.resultpojo.UserOrderRecordResult;

/**
 * 
 * @author wbqiutj
 *
 */
public interface UserOrderRecordMapper extends GetPageMapper<UserOrderRecordResult>{
	
    int insert(UserOrderRecord record);

    int insertSelective(UserOrderRecord record);
    
    /*List<UserOrderRecord> getPage(Map<String, String> paramMap);*/
    
    UserOrderRecordResult findTradeDetailByOrderId(Long orderId);
    
    int updateStoreValue(UserOrderRecordResult userOrder);
    
}