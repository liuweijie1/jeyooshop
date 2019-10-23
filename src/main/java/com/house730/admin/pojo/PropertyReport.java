package com.house730.admin.pojo;

import java.math.BigDecimal;
import java.util.Date;

import lombok.Data;
@Data
public class PropertyReport {
    private Integer reportid;

    private Long propertyid;

    private String name;

    private String email;

    private String telephone;

    private String content;

    private Date createtime;

    private Boolean isdelete;

    private Boolean ishandle;
    
    private String  source;

	
    

}