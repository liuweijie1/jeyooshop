package com.jeyoo.pojo;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data
public class ShopConfig {
	
    private Long shopid;

    private String url;

    private String shopname;

    private String shopaddress;
    
    private String shoptel;
    
    private String weid;
    
    private Date creattime;
    
    private Date duetime;
    
    private Date starttime;
    
    private Date endtime;
    
    private Integer isdelete;

    private Integer state;

 

   

}