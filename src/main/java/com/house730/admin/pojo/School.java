package com.house730.admin.pojo;

import java.util.Date;

public class School {
    private Integer schoolid;

    private String gscopecode;

    private String schoolgrade;

    private String schoolname;

    private String schoolnameen;

    private String network;

    private String sex;

    private String supporttype;

    private String religion;

    private String address;

    private String mode;

    private String teachinglanguage;

    private Integer buildyear;

    private String telephone;

    private String fax;

    private String email;

    private String web;

    private Double longitudes;

    private Double latitudes;

    private Integer sequence;

    private String createuser;

    private Date createtime;

    private String updateuser;

    private Date updatetime;

    private Boolean isdelete;

    public School(Integer schoolid, String gscopecode, String schoolgrade, String schoolname, String schoolnameen, String network, String sex, String supporttype, String religion, String address, String mode, String teachinglanguage, Integer buildyear, String telephone, String fax, String email, String web, Double longitudes, Double latitudes, Integer sequence, String createuser, Date createtime, String updateuser, Date updatetime, Boolean isdelete) {
        this.schoolid = schoolid;
        this.gscopecode = gscopecode;
        this.schoolgrade = schoolgrade;
        this.schoolname = schoolname;
        this.schoolnameen = schoolnameen;
        this.network = network;
        this.sex = sex;
        this.supporttype = supporttype;
        this.religion = religion;
        this.address = address;
        this.mode = mode;
        this.teachinglanguage = teachinglanguage;
        this.buildyear = buildyear;
        this.telephone = telephone;
        this.fax = fax;
        this.email = email;
        this.web = web;
        this.longitudes = longitudes;
        this.latitudes = latitudes;
        this.sequence = sequence;
        this.createuser = createuser;
        this.createtime = createtime;
        this.updateuser = updateuser;
        this.updatetime = updatetime;
        this.isdelete = isdelete;
    }

    public School() {
        super();
    }

    public Integer getSchoolid() {
        return schoolid;
    }

    public void setSchoolid(Integer schoolid) {
        this.schoolid = schoolid;
    }

    public String getGscopecode() {
        return gscopecode;
    }

    public void setGscopecode(String gscopecode) {
        this.gscopecode = gscopecode == null ? null : gscopecode.trim();
    }

    public String getSchoolgrade() {
        return schoolgrade;
    }

    public void setSchoolgrade(String schoolgrade) {
        this.schoolgrade = schoolgrade == null ? null : schoolgrade.trim();
    }

    public String getSchoolname() {
        return schoolname;
    }

    public void setSchoolname(String schoolname) {
        this.schoolname = schoolname == null ? null : schoolname.trim();
    }

    public String getSchoolnameen() {
        return schoolnameen;
    }

    public void setSchoolnameen(String schoolnameen) {
        this.schoolnameen = schoolnameen == null ? null : schoolnameen.trim();
    }

    public String getNetwork() {
        return network;
    }

    public void setNetwork(String network) {
        this.network = network == null ? null : network.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public String getSupporttype() {
        return supporttype;
    }

    public void setSupporttype(String supporttype) {
        this.supporttype = supporttype == null ? null : supporttype.trim();
    }

    public String getReligion() {
        return religion;
    }

    public void setReligion(String religion) {
        this.religion = religion == null ? null : religion.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getMode() {
        return mode;
    }

    public void setMode(String mode) {
        this.mode = mode == null ? null : mode.trim();
    }

    public String getTeachinglanguage() {
        return teachinglanguage;
    }

    public void setTeachinglanguage(String teachinglanguage) {
        this.teachinglanguage = teachinglanguage == null ? null : teachinglanguage.trim();
    }

    public Integer getBuildyear() {
        return buildyear;
    }

    public void setBuildyear(Integer buildyear) {
        this.buildyear = buildyear;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone == null ? null : telephone.trim();
    }

    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax == null ? null : fax.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getWeb() {
        return web;
    }

    public void setWeb(String web) {
        this.web = web == null ? null : web.trim();
    }

    public Double getLongitudes() {
        return longitudes;
    }

    public void setLongitudes(Double longitudes) {
        this.longitudes = longitudes;
    }

    public Double getLatitudes() {
        return latitudes;
    }

    public void setLatitudes(Double latitudes) {
        this.latitudes = latitudes;
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