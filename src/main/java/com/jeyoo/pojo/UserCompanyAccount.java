package com.jeyoo.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class UserCompanyAccount {

    private Integer accountid;

    private String account;

    private String password;

    private String email;

    private Integer companyid;

    private Integer departmentid;

    private Integer roleid;

    private String status;

    private Integer  remainderpropertycoin;

    private String imagepath;

    private Date createtime;

    private Date updatetime;

    private Boolean isdelete;

}
