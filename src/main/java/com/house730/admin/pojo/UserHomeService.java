package com.house730.admin.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class UserHomeService {
    private Integer homeserviceid;

    private Long userid;

    private Integer homeservicecategory;

    private String smallcategory;

    private String title;

    private String titleen;

    private String serviceproject;

    private String serviceprojecten;

    private String feature;

    private String featureen;

    private String servicezone;

    private String discount;

    private String companyname;

    private String companynameen;

    private String companyaddress;

    private String companyaddressen;

    private String email;

    private String telephone;

    private BigDecimal money;

    private Integer sequence;

    private Date expiretime;

    private Boolean isonline;

    private String createuser;

    private Date createtime;

    private String updateuser;

    private Date updatetime;

    private Boolean isdelete;

    public UserHomeService(Integer homeserviceid, Long userid, Integer homeservicecategory, String smallcategory, String title, String titleen, String serviceproject, String serviceprojecten, String feature, String featureen, String servicezone, String discount, String companyname, String companynameen, String companyaddress, String companyaddressen, String email, String telephone, BigDecimal money, Integer sequence, Date expiretime, Boolean isonline, String createuser, Date createtime, String updateuser, Date updatetime, Boolean isdelete) {
        this.homeserviceid = homeserviceid;
        this.userid = userid;
        this.homeservicecategory = homeservicecategory;
        this.smallcategory = smallcategory;
        this.title = title;
        this.titleen = titleen;
        this.serviceproject = serviceproject;
        this.serviceprojecten = serviceprojecten;
        this.feature = feature;
        this.featureen = featureen;
        this.servicezone = servicezone;
        this.discount = discount;
        this.companyname = companyname;
        this.companynameen = companynameen;
        this.companyaddress = companyaddress;
        this.companyaddressen = companyaddressen;
        this.email = email;
        this.telephone = telephone;
        this.money = money;
        this.sequence = sequence;
        this.expiretime = expiretime;
        this.isonline = isonline;
        this.createuser = createuser;
        this.createtime = createtime;
        this.updateuser = updateuser;
        this.updatetime = updatetime;
        this.isdelete = isdelete;
    }

    public UserHomeService() {
        super();
    }

    public Integer getHomeserviceid() {
        return homeserviceid;
    }

    public void setHomeserviceid(Integer homeserviceid) {
        this.homeserviceid = homeserviceid;
    }

    public Long getUserid() {
        return userid;
    }

    public void setUserid(Long userid) {
        this.userid = userid;
    }

    public Integer getHomeservicecategory() {
        return homeservicecategory;
    }

    public void setHomeservicecategory(Integer homeservicecategory) {
        this.homeservicecategory = homeservicecategory;
    }

    public String getSmallcategory() {
        return smallcategory;
    }

    public void setSmallcategory(String smallcategory) {
        this.smallcategory = smallcategory == null ? null : smallcategory.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getTitleen() {
        return titleen;
    }

    public void setTitleen(String titleen) {
        this.titleen = titleen == null ? null : titleen.trim();
    }

    public String getServiceproject() {
        return serviceproject;
    }

    public void setServiceproject(String serviceproject) {
        this.serviceproject = serviceproject == null ? null : serviceproject.trim();
    }

    public String getServiceprojecten() {
        return serviceprojecten;
    }

    public void setServiceprojecten(String serviceprojecten) {
        this.serviceprojecten = serviceprojecten == null ? null : serviceprojecten.trim();
    }

    public String getFeature() {
        return feature;
    }

    public void setFeature(String feature) {
        this.feature = feature == null ? null : feature.trim();
    }

    public String getFeatureen() {
        return featureen;
    }

    public void setFeatureen(String featureen) {
        this.featureen = featureen == null ? null : featureen.trim();
    }

    public String getServicezone() {
        return servicezone;
    }

    public void setServicezone(String servicezone) {
        this.servicezone = servicezone == null ? null : servicezone.trim();
    }

    public String getDiscount() {
        return discount;
    }

    public void setDiscount(String discount) {
        this.discount = discount == null ? null : discount.trim();
    }

    public String getCompanyname() {
        return companyname;
    }

    public void setCompanyname(String companyname) {
        this.companyname = companyname == null ? null : companyname.trim();
    }

    public String getCompanynameen() {
        return companynameen;
    }

    public void setCompanynameen(String companynameen) {
        this.companynameen = companynameen == null ? null : companynameen.trim();
    }

    public String getCompanyaddress() {
        return companyaddress;
    }

    public void setCompanyaddress(String companyaddress) {
        this.companyaddress = companyaddress == null ? null : companyaddress.trim();
    }

    public String getCompanyaddressen() {
        return companyaddressen;
    }

    public void setCompanyaddressen(String companyaddressen) {
        this.companyaddressen = companyaddressen == null ? null : companyaddressen.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone == null ? null : telephone.trim();
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public Integer getSequence() {
        return sequence;
    }

    public void setSequence(Integer sequence) {
        this.sequence = sequence;
    }

    public Date getExpiretime() {
        return expiretime;
    }

    public void setExpiretime(Date expiretime) {
        this.expiretime = expiretime;
    }

    public Boolean getIsonline() {
        return isonline;
    }

    public void setIsonline(Boolean isonline) {
        this.isonline = isonline;
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