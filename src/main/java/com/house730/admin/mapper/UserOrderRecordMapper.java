package com.house730.admin.mapper;


import com.house730.admin.pojo.UserOrderRecord;
import com.house730.admin.resultpojo.UserOrderRecordResult;

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