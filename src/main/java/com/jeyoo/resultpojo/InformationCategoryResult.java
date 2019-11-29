package com.jeyoo.resultpojo;

import java.util.Date;

import lombok.Data;
@Data
public class InformationCategoryResult {
    private Integer catagoryid;

    private String categoryname;

    private String categorynameen;

    private String subcategoryname;

    private String subcategorynameen;
    
    private Integer parentcategoryid;

    private Boolean isshow;

    private Integer seqence;

    private String createuser;

    private Date createtime;

    private String updateuser;

    private Date updatetime;

    private Boolean isdelete;

}