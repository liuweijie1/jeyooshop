package com.house730.admin.pojo;

import java.util.Date;

public class SysDictionary {
    private Integer dictionaryid;

    private Integer parentdictionaryid;

    private String dictionaryname;

    private String dictionarynameen;

    private String dictionaryvalue;

    private String itemname;

    private Boolean isshow;

    private Integer sequence;

    private String createuser;

    private Date createtime;

    private String updateuser;

    private Date updatetime;

    private Boolean isdelete;

    public SysDictionary(Integer dictionaryid, Integer parentdictionaryid, String dictionaryname, String dictionarynameen, String dictionaryvalue, String itemname, Boolean isshow, Integer sequence, String createuser, Date createtime, String updateuser, Date updatetime, Boolean isdelete) {
        this.dictionaryid = dictionaryid;
        this.parentdictionaryid = parentdictionaryid;
        this.dictionaryname = dictionaryname;
        this.dictionarynameen = dictionarynameen;
        this.dictionaryvalue = dictionaryvalue;
        this.itemname = itemname;
        this.isshow = isshow;
        this.sequence = sequence;
        this.createuser = createuser;
        this.createtime = createtime;
        this.updateuser = updateuser;
        this.updatetime = updatetime;
        this.isdelete = isdelete;
    }

    public SysDictionary() {
        super();
    }

    public Integer getDictionaryid() {
        return dictionaryid;
    }

    public void setDictionaryid(Integer dictionaryid) {
        this.dictionaryid = dictionaryid;
    }

    public Integer getParentdictionaryid() {
        return parentdictionaryid;
    }

    public void setParentdictionaryid(Integer parentdictionaryid) {
        this.parentdictionaryid = parentdictionaryid;
    }

    public String getDictionaryname() {
        return dictionaryname;
    }

    public void setDictionaryname(String dictionaryname) {
        this.dictionaryname = dictionaryname == null ? null : dictionaryname.trim();
    }

    public String getDictionarynameen() {
        return dictionarynameen;
    }

    public void setDictionarynameen(String dictionarynameen) {
        this.dictionarynameen = dictionarynameen == null ? null : dictionarynameen.trim();
    }

    public String getDictionaryvalue() {
        return dictionaryvalue;
    }

    public void setDictionaryvalue(String dictionaryvalue) {
        this.dictionaryvalue = dictionaryvalue == null ? null : dictionaryvalue.trim();
    }

    public String getItemname() {
        return itemname;
    }

    public void setItemname(String itemname) {
        this.itemname = itemname == null ? null : itemname.trim();
    }

    public Boolean getIsshow() {
        return isshow;
    }

    public void setIsshow(Boolean isshow) {
        this.isshow = isshow;
    }

    public Integer getSequence() {
        return sequence;
    }

    public void setSequence(Integer sequence) {
        this.sequence = sequence;
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