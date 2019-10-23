package com.house730.admin.pojo;

import java.util.Date;

import lombok.Data;

@Data
public class UserUsageRecord {
    private Long usagerecordid;

    private Integer userid;

    private String usagecode;

    private String usageitem;

    private Integer propertycoin;

    private String ref;

    private Date createtime;

    private Date updatetime;

    private Boolean isdelete;
    
    private String sourceType;

    private Integer accountid;

    
}