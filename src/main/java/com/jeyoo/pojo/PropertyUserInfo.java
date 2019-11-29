
package com.jeyoo.pojo;

import lombok.Data;

import java.util.Date;
@Data
public class PropertyUserInfo {
    private Long id;
    private Long propertyid;

    private Long userid;

    private String contactnamecn;

    private String contactnameen;

    private String email;

    private String telphone;

    private Boolean isshowtel;

    private Boolean isshowwhatsapp;

    private Boolean isshowwechat;

    private String companytel;

    private String customertel;

    private String companynamecn;

    private String companynameen;

    private String companyaddress;

    private String companyaddressen;

    private String companylicencenumber;

    private String agentlicencenumber;

    private String agentintroduce;

    private String createuser;

    private Date createtime;

    private String updateuser;

    private Date updatetime;

    private Boolean isdelete;

    private Integer sequence;



}