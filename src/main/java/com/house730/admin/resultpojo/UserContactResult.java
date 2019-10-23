package com.house730.admin.resultpojo;

import java.util.Date;

import lombok.Data;
@Data
public class UserContactResult {
    private Integer contactid;

    private String contactperson;

    private String email;

    private String phone;

    private Integer helptopic;

    private String title;

    private String content;

    private Integer status;

    private String createuser;

    private Date createtime;

    private String updateuser;

    private Date updatetime;

    private Boolean isdelete;
    
    private String dictionaryname;
    
  
}