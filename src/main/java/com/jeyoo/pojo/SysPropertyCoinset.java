package com.jeyoo.pojo;

import java.math.BigDecimal;
import java.util.Date;

import lombok.Data;

@Data
public class SysPropertyCoinset {
    private Integer setid;

    private Integer propertycoin;

    private BigDecimal money;

    private Float discount;

    private Boolean isshow;

    private String createuser;

    private Date createtime;

    private String updateuser;

    private Date updatetime;

    private Boolean isdelete;
    
    private Integer type;

   
}