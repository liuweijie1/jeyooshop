package com.jeyoo.pojo;

import lombok.Data;

import java.util.Date;
@Data
public class UserAgentCompany {
    private Integer companyid;

    private String companylicense;

    private String companyname;

    private String companynameen;

    private String email;

    private String web;

    private String telephone;

    private String identityScore;

    private String address;

    private String addressen;

    private String introduce;

    private String introduceen;

    private String logo;

    private String facebookaccount;

    private Integer maxdepartmentnumber;

    private String status;

    private String createuser;

    private Date createtime;

    private String updateuser;

    private Date updatetime;

    private Boolean isdelete;


}