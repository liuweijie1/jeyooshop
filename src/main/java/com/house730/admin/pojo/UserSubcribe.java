package com.house730.admin.pojo;

import java.util.Date;

public class UserSubcribe {
    private Integer subscribeid;

    private Integer userid;

    private Integer propertytype;

    private String gscopecode;

    private Integer propertysource;

    private Integer propertycategory;

    private String pricerange;

    private String areatype;

    private String arearange;

    private Integer roomnumber;

    private Integer buildingage;

    private Integer pushnotification;

    private Integer pushtime;

    private Integer pushmethod;

    private String createuser;

    private Date createtime;

    private String updateuser;

    private Date updatetime;

    private Boolean isdelete;

    public UserSubcribe(Integer subscribeid, Integer userid, Integer propertytype, String gscopecode, Integer propertysource, Integer propertycategory, String pricerange, String areatype, String arearange, Integer roomnumber, Integer buildingage, Integer pushnotification, Integer pushtime, Integer pushmethod, String createuser, Date createtime, String updateuser, Date updatetime, Boolean isdelete) {
        this.subscribeid = subscribeid;
        this.userid = userid;
        this.propertytype = propertytype;
        this.gscopecode = gscopecode;
        this.propertysource = propertysource;
        this.propertycategory = propertycategory;
        this.pricerange = pricerange;
        this.areatype = areatype;
        this.arearange = arearange;
        this.roomnumber = roomnumber;
        this.buildingage = buildingage;
        this.pushnotification = pushnotification;
        this.pushtime = pushtime;
        this.pushmethod = pushmethod;
        this.createuser = createuser;
        this.createtime = createtime;
        this.updateuser = updateuser;
        this.updatetime = updatetime;
        this.isdelete = isdelete;
    }

    public UserSubcribe() {
        super();
    }

    public Integer getSubscribeid() {
        return subscribeid;
    }

    public void setSubscribeid(Integer subscribeid) {
        this.subscribeid = subscribeid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getPropertytype() {
        return propertytype;
    }

    public void setPropertytype(Integer propertytype) {
        this.propertytype = propertytype;
    }

    public String getGscopecode() {
        return gscopecode;
    }

    public void setGscopecode(String gscopecode) {
        this.gscopecode = gscopecode == null ? null : gscopecode.trim();
    }

    public Integer getPropertysource() {
        return propertysource;
    }

    public void setPropertysource(Integer propertysource) {
        this.propertysource = propertysource;
    }

    public Integer getPropertycategory() {
        return propertycategory;
    }

    public void setPropertycategory(Integer propertycategory) {
        this.propertycategory = propertycategory;
    }

    public String getPricerange() {
        return pricerange;
    }

    public void setPricerange(String pricerange) {
        this.pricerange = pricerange == null ? null : pricerange.trim();
    }

    public String getAreatype() {
        return areatype;
    }

    public void setAreatype(String areatype) {
        this.areatype = areatype == null ? null : areatype.trim();
    }

    public String getArearange() {
        return arearange;
    }

    public void setArearange(String arearange) {
        this.arearange = arearange == null ? null : arearange.trim();
    }

    public Integer getRoomnumber() {
        return roomnumber;
    }

    public void setRoomnumber(Integer roomnumber) {
        this.roomnumber = roomnumber;
    }

    public Integer getBuildingage() {
        return buildingage;
    }

    public void setBuildingage(Integer buildingage) {
        this.buildingage = buildingage;
    }

    public Integer getPushnotification() {
        return pushnotification;
    }

    public void setPushnotification(Integer pushnotification) {
        this.pushnotification = pushnotification;
    }

    public Integer getPushtime() {
        return pushtime;
    }

    public void setPushtime(Integer pushtime) {
        this.pushtime = pushtime;
    }

    public Integer getPushmethod() {
        return pushmethod;
    }

    public void setPushmethod(Integer pushmethod) {
        this.pushmethod = pushmethod;
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