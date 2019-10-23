package com.house730.admin.vo;

import lombok.Getter;

@Getter
public enum ManagerPropertyEnum {
	
	PROPERTY_PROPERTYSTATUS("2","管理員下架",2 ),
	PROPERTY_PAYMENT_STATUS("1","已付款",1 ),
	PROPERTY_APPROVAL_STATUS("1","已審核",1 ),
	PROPERTY_APPROVAL_PASS("1","审核通過",1 ),
	PROPERTY_APPROVAL_NOPASS("-1","审核不通过",-1 ),
	PROPERTY_ORDER_STATUS_PAY("1","已通過",1 ),
	PROPERTY_ORDER_SOURCETYPE("PropertyCoin","屋幣儲值",1 );
	
	private String name;
	private String code;
	private Integer status;
	
	ManagerPropertyEnum(String code,String name,Integer status){
		this.name = name;
        this.code = code;
        this.status = status;
	}
}
