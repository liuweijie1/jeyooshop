package com.jeyoo.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class UserDepartment {
    private Integer departmentid;

    private String departmentname;

    private String departmentnameen;

    private Integer parentid;

    private String address;

    private String addressen;

    private String telephone;

    private Integer companyid;

    private Date createtime;

    private Date  updatetime;

    private Boolean  isdelete;
}
