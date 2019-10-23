package com.house730.admin.resultpojo;


import java.util.Date;

import com.house730.admin.pojo.UserOrderRecord;

import lombok.Data;

@Data
public class UserOrderRecordResult extends UserOrderRecord{
    private String usercode;
	private Date evidenceTime;//上传凭证时间
}