package com.jeyoo.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class User {
    private long userid;

    private String openid;
    
    private long shopid;
    
    private String username;

    private String usercode;

    private String password;

    private String nickname;

    private String email;

    private String telephone;
    
    private String vipcard;
    
    private Double balance;
    
    private Integer vipstate;
    
    
    

    private Boolean isreceivemessage;

    private Boolean isreceivesms;

    private Boolean ispropertyagent;

    private String companynamecn;

    private String companynameen;

    private String companytelephone;

    private String companyaddress;

    private String companyaddressen;

    private String signature;

    private String companylicense;

    private String license;

    private Integer identityscore;

    private Boolean isimportestate;

    private Integer propertynumber;

    private Integer dealnumber;

    private Integer browsenumber;

    private String status;

    private String source;

    private String approvalStatus;

    private String registerSource;

    private Integer remainderpropertycoin;

    private Date lastlogintime;

    private Integer gender;

    private Integer agetype;

    private Integer salarytype;

    private Integer livetype;

    private Integer departmentid;

    private String facebookaccount;

    private String googleaccount;

    private Integer languagetype;

    private Date createtime;

    private Date updatetime;

    private Boolean isdelete;


/*    public enum ApprovalStatus {
        /// <summary>
        /// 審核不通過
        /// </summary>
        NotPassApproval,

        /// <summary>
        /// 審批中
        /// </summary>
        UnderApproval,
        //
        //        /// <summary>
        /// 审核通过
        /// </summary>
        PassApproval,
    }
    public enum UserStatus
    {
        Normal,
        Disable,
    }*/
}