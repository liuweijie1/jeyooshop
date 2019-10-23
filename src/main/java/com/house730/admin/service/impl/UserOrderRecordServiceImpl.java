package com.house730.admin.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.house730.admin.Exception.ExceptionEnum;
import com.house730.admin.Exception.HouseException;
import com.house730.admin.mapper.UserMapper;
import com.house730.admin.mapper.UserOrderRecordMapper;
import com.house730.admin.pojo.User;
import com.house730.admin.pojo.UserUsageRecord;
import com.house730.admin.resultpojo.UserOrderRecordResult;
import com.house730.admin.service.IUserOrderRecordService;
import com.house730.admin.service.IUserUsageRecordService;
import com.house730.admin.vo.ManagerPropertyEnum;

/**
 * 交易记录
 * @author wbqiutj
 *	2019年4月20日
 */
@Service(value = "userOrderRecordService")
public class UserOrderRecordServiceImpl implements IUserOrderRecordService{
	
	@Autowired
	private UserOrderRecordMapper userOrderRecordMapper;
	
	@Autowired
	IUserOrderRecordService iFindPageService;
	
	@Autowired
	IUserUsageRecordService userUsageRecordService;
	
	@Autowired
    private UserMapper mapper;
	
	@Override
	public PageInfo<UserOrderRecordResult> findPage(Map<String, String> paramMap) {
		PageInfo<UserOrderRecordResult> pageInfo = null;
		if(null != paramMap) {
			try {
				//获取参数
				Integer pno=Integer.parseInt(String.valueOf(paramMap.get("page")));
				Integer pageSize=Integer.parseInt(String.valueOf(paramMap.get("limit")));
				PageHelper.startPage(pno, pageSize);
				
				List<UserOrderRecordResult> list = userOrderRecordMapper.getPage(paramMap);
				pageInfo = new PageInfo<UserOrderRecordResult>(list);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return pageInfo;
	}

	@Override
	public UserOrderRecordResult findTradeDetailByOrderId(Long orderId) {
		UserOrderRecordResult result = userOrderRecordMapper.findTradeDetailByOrderId(orderId);
		return result;
	}
	
	@Transactional
	@Override
	public void updateStroeValue(UserOrderRecordResult userOrder) {
		if(null != userOrder ) {
			if(null != userOrder.getOrderid()) {
				UserOrderRecordResult order = userOrderRecordMapper.findTradeDetailByOrderId(userOrder.getOrderid());
				if(null != order) {
					//屋幣量>0 
					if(null == order.getPropertycoin()  || 0 == order.getPropertycoin())throw new HouseException(ExceptionEnum.BAD_REQUEST);
					//訂單狀態為未付款
					if(null == order.getOrderstatus()  || 0 != order.getOrderstatus())throw new HouseException(ExceptionEnum.BAD_REQUEST);
					//訂單類型為“PropertyCoin-屋幣儲值”
					if(!ManagerPropertyEnum.PROPERTY_ORDER_SOURCETYPE.getCode().equals(order.getSourcetype()))
						throw new HouseException(ExceptionEnum.BAD_REQUEST);
					order.setOrderstatus(ManagerPropertyEnum.PROPERTY_ORDER_STATUS_PAY.getStatus());
					order.setUpdatetime(new Date());
					int num =  userOrderRecordMapper.updateStoreValue(order);
					if(num == 0) {
						throw new HouseException(ExceptionEnum.ORDER_UPDATE_ERROR);
					}
					UserUsageRecord record = new UserUsageRecord();
					record.setCreatetime(new Date());
					record.setPropertycoin(order.getPropertycoin());
					record.setRef(order.getOrderid()+"");
					record.setUpdatetime(new Date());
					record.setUsageitem(order.getItem());
					record.setUserid(order.getUserid());
					record.setSourceType(order.getSourcetype());
					
					//更新数据到屋币使用记录表
					userUsageRecordService.saveUsageRecord(record);
					
					//更新用戶表數據
					Integer userid = order.getUserid();
					if(userid == null)throw new HouseException(ExceptionEnum.BAD_REQUEST);
					User u = mapper.queryDetail(userid);
					if(null == u)throw new HouseException(ExceptionEnum.USER_NOTFOUND_ERROR);
					u.setRemainderpropertycoin(record.getPropertycoin()+u.getRemainderpropertycoin());
					
					mapper.changePropertycoin(u);
					return ;
				}
			}
		}
		throw new HouseException(ExceptionEnum.ORDER_NOT_FOUND);
	}

}
