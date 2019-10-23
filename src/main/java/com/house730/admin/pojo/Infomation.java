package com.house730.admin.pojo;

import java.util.Date;

import lombok.Data;
@Data
public class Infomation {
    private Long informationid;

    private Integer categoryid;

    private Integer subcategoryid;

    private String imagepath;

    private String titleen;

    private String title;

    private String brief;
    
    private String briefen;
    
    private String content;
    
    private String contenten;

    private Date publishtime;

    private String source;

    private Boolean isoffline;
    
    private Boolean ispush;
    
    private Date pushtime;

    private String pushplatform;
    
    private Boolean issend;
    
    private String createuser;

    private Date createtime;

    private String updateuser;

    private Date updatetime;

    private Boolean isdelete;

   

}