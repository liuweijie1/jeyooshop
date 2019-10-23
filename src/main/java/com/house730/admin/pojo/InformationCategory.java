package com.house730.admin.pojo;

import java.util.Date;

public class InformationCategory {
    private Integer catagoryid;

    private String categoryname;

    private String categorynameen;

    private Integer parentcategoryid;

    private Boolean isshow;

    private Integer seqence;

    private String createuser;

    private Date createtime;

    private String updateuser;

    private Date updatetime;

    private Boolean isdelete;

    public InformationCategory(Integer catagoryid, String categoryname, String categorynameen, Integer parentcategoryid, Boolean isshow, Integer seqence, String createuser, Date createtime, String updateuser, Date updatetime, Boolean isdelete) {
        this.catagoryid = catagoryid;
        this.categoryname = categoryname;
        this.categorynameen = categorynameen;
        this.parentcategoryid = parentcategoryid;
        this.isshow = isshow;
        this.seqence = seqence;
        this.createuser = createuser;
        this.createtime = createtime;
        this.updateuser = updateuser;
        this.updatetime = updatetime;
        this.isdelete = isdelete;
    }

    public InformationCategory() {
        super();
    }

    public Integer getCatagoryid() {
        return catagoryid;
    }

    public void setCatagoryid(Integer catagoryid) {
        this.catagoryid = catagoryid;
    }

    public String getCategoryname() {
        return categoryname;
    }

    public void setCategoryname(String categoryname) {
        this.categoryname = categoryname == null ? null : categoryname.trim();
    }

    public String getCategorynameen() {
        return categorynameen;
    }

    public void setCategorynameen(String categorynameen) {
        this.categorynameen = categorynameen == null ? null : categorynameen.trim();
    }

    public Integer getParentcategoryid() {
        return parentcategoryid;
    }

    public void setParentcategoryid(Integer parentcategoryid) {
        this.parentcategoryid = parentcategoryid;
    }

    public Boolean getIsshow() {
        return isshow;
    }

    public void setIsshow(Boolean isshow) {
        this.isshow = isshow;
    }

    public Integer getSeqence() {
        return seqence;
    }

    public void setSeqence(Integer seqence) {
        this.seqence = seqence;
    }

    public String getCreateuser() {
        return createuser;
    }

    public void setCreateuser(String createuser) {
        this.createuser = createuser == null ? null : createuser.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getUpdateuser() {
        return updateuser;
    }

    public void setUpdateuser(String updateuser) {
        this.updateuser = updateuser == null ? null : updateuser.trim();
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    public Boolean getIsdelete() {
        return isdelete;
    }

    public void setIsdelete(Boolean isdelete) {
        this.isdelete = isdelete;
    }
}