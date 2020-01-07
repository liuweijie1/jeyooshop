package com.jeyoo.pojo;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;
@Data
public class Order {
    private Long orderid; 
    
    private Long ordergoodid;
    
    private Long userid;

    private String number;

    private String paymenttype;
    
    private BigDecimal totalmoney;
    
    private BigDecimal realmoney;
    
    private BigDecimal maxdel;
    
    private Integer totalcount;
    
    private Date updatetime;
    
    private Date ordertime;
    
    private Integer deliverytype;
    
    private String deliverytime;
    
    private Integer state;
    
    private String remark;
    
    private Integer sort;
    
    private Integer isdelete;
    
    
    
    private String foodname;

    private String goodimg;
    
    private Integer amount;
    
    private double foodprice;
   
}