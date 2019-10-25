package com.house730.admin.pojo;

import lombok.Data;

import java.util.Date;
@Data
public class AdminEmployee {
    private Integer employeeid;

    private String employeecode;

    private Integer departmentid;

    private String employeename;

    private String employeeno;

    private String password;

    private String mobile;

    private String remarks;

    private String status;

    private String createuser;

    private Date createtime;

    private String updateuser;

    private Date updatetime;

    private Boolean isdelete;

}