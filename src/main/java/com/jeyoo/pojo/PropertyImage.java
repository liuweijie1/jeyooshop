package com.jeyoo.pojo;

import lombok.Data;

import java.util.Date;
@Data
public class PropertyImage {
    private Long imageid;

    private Long propertyid;

    private Integer imagetype;

    private String imagepath;

    private String imagedesc;

    private String imagedescen;

    private Boolean isdefault;

    private Integer sequence;

    private String createuser;

    private Date createtime;
    //是否驗證圖片
    private Boolean isVerifyImage;

    private String updateuser;

    private Date updatetime;

    private Boolean isdelete;

}