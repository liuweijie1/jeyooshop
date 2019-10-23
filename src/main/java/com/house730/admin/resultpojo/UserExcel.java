package com.house730.admin.resultpojo;

import lombok.Data;

import java.util.Date;
@Data
public class UserExcel {
    private Integer userid;

    private String username;

    private String usercode;

    private String email;

    private String telephone;

    private Boolean isreceivemessage;

    private Boolean ispropertyagent;

    private String companynamecn;

    private String companytelephone;

    private String companyaddress;

    private String companylicense;

    private String license;

    private Integer identityscore;

    private Boolean isimportestate;

    private String status;

    private String source;

    private String approvalStatus;

    private Integer gender;

    private String gend;

    private Integer agetype;

    private String age;

    private Integer salarytype;

    private String salary;

    private Integer livetype;

    private String live;

    private Boolean isdelete;
}
