package com.jeyoo.resultpojo;


import java.util.Date;

import com.jeyoo.pojo.UserOrderRecord;

import lombok.Data;

@Data
public class UserOrderRecordResult extends UserOrderRecord{
    private String usercode;
	private Date evidenceTime;//上传凭证时间
}