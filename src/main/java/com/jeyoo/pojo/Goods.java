package com.jeyoo.pojo;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class Goods {
    private Long goodid;

    private String details;

    private String foodname;

    private String goodimg;
    
    private Integer isdelete;

    private Integer sort;

    private Double foodprice;

   

}