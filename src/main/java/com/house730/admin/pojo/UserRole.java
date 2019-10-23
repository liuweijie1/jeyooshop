package com.house730.admin.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class UserRole {
    private Integer roleid;

    private String rolename;

    private String roledesc;

    private String status;

    private Integer sequence;

    private Date createtime;

    private Date updatetime;

    private Boolean isdelete;
}
