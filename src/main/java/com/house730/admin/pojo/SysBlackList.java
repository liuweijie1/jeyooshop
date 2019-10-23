package com.house730.admin.pojo;

import java.util.Date;

public class SysBlackList {
    private Integer blackid;

    private String model;

    private String modelvalue;

    private String remark;

    private Date createtime;

    public SysBlackList(Integer blackid, String model, String modelvalue, String remark, Date createtime) {
        this.blackid = blackid;
        this.model = model;
        this.modelvalue = modelvalue;
        this.remark = remark;
        this.createtime = createtime;
    }

    public SysBlackList() {
        super();
    }

    public Integer getBlackid() {
        return blackid;
    }

    public void setBlackid(Integer blackid) {
        this.blackid = blackid;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model == null ? null : model.trim();
    }

    public String getModelvalue() {
        return modelvalue;
    }

    public void setModelvalue(String modelvalue) {
        this.modelvalue = modelvalue == null ? null : modelvalue.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }
}