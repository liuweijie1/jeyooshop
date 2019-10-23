package com.house730.admin.pojo;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;
@Data
public class Property {
    private Long propertyid;

    private String gscopecode;

    private Long estateid;

    private Long parentestateid;

    private Long buildingid;

    private Long unitid;

    private String estatename;

    private String estatenameen;

    private String estateaddress;

    private String estateaddressen;

    private String buildingname;

    private Integer buildingage;

    private Integer propertysource;

    private Integer rentaltype;

    private Boolean islinkparking;

    private BigDecimal buildingarea;

    private BigDecimal saleablearea;

    private Boolean isverifyarea;

    private Integer propertycategory;

    private BigDecimal saleprice;

    private BigDecimal rentprice;

    private BigDecimal buildingavgprice;

    private BigDecimal saleableavgprice;

    private Date beginrenttime;

    private String propertyno;

    private String titlecn;

    private String titleen;

    private Boolean isjoinagentintroduce;

    private Integer unitfloor;

    private Integer roomnumber;

    private BigDecimal propertymanagementfee;

    private String imagepath;

    private Integer toptype;

    private Integer propertystatus;

    private Integer paymentstatus;

    private Integer approvalstatus;//目前未審核：0 ， 已通過：1，未通過：2

    private Date publictime;

    private Date expiretime;

    private Integer browsenumber;

    private Integer imagenumber;

    private Integer collectionnumber;

    private Integer leavemessagenumber;

    private Boolean isnamely;

    private Date namelyexpiretime;

    private Boolean isverify;

    private Boolean isverifyimage;

    private Date refreshtime;

    private  Boolean isverifylabel;

    private Boolean isrecommend;

    private Integer saleform;

    private Boolean ishide;

    private Integer identityscore;

    private Integer accountid;

    private Integer userid;

    private Float sequence;

    private String createuser;

    private Date createtime;

    private String updateuser;

    private Date updatetime;

    private Boolean isdelete;
    
    private Date approvalTime;
    
    private Boolean isadminoffline;

}