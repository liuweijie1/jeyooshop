package com.house730.admin.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class UserFurniture {
    private Long furnitureid;

    private Long userid;

    private Integer furniturecategory;

    private String name;

    private String nameen;

    private Boolean isdonation;

    private String donationdesc;

    private Integer furnitureitem;

    private String brand;

    private BigDecimal price;

    private String bargaining;

    private String title;

    private String titleen;

    private String introduce;

    private String introduceen;

    private Integer degree;

    private String gscopecode;

    private String handovermethod;

    private String handovertime;

    private String originalbuytime;

    private String originabuyprice;

    private String contactname;

    private String telephone;

    private Boolean iswhatsapp;

    private Boolean isonline;

    private Date expiretime;

    private Integer status;

    private String createuser;

    private Date createtime;

    private String updateuser;

    private Date updatetime;

    private Boolean isdelete;

    public UserFurniture(Long furnitureid, Long userid, Integer furniturecategory, String name, String nameen, Boolean isdonation, String donationdesc, Integer furnitureitem, String brand, BigDecimal price, String bargaining, String title, String titleen, String introduce, String introduceen, Integer degree, String gscopecode, String handovermethod, String handovertime, String originalbuytime, String originabuyprice, String contactname, String telephone, Boolean iswhatsapp, Boolean isonline, Date expiretime, Integer status, String createuser, Date createtime, String updateuser, Date updatetime, Boolean isdelete) {
        this.furnitureid = furnitureid;
        this.userid = userid;
        this.furniturecategory = furniturecategory;
        this.name = name;
        this.nameen = nameen;
        this.isdonation = isdonation;
        this.donationdesc = donationdesc;
        this.furnitureitem = furnitureitem;
        this.brand = brand;
        this.price = price;
        this.bargaining = bargaining;
        this.title = title;
        this.titleen = titleen;
        this.introduce = introduce;
        this.introduceen = introduceen;
        this.degree = degree;
        this.gscopecode = gscopecode;
        this.handovermethod = handovermethod;
        this.handovertime = handovertime;
        this.originalbuytime = originalbuytime;
        this.originabuyprice = originabuyprice;
        this.contactname = contactname;
        this.telephone = telephone;
        this.iswhatsapp = iswhatsapp;
        this.isonline = isonline;
        this.expiretime = expiretime;
        this.status = status;
        this.createuser = createuser;
        this.createtime = createtime;
        this.updateuser = updateuser;
        this.updatetime = updatetime;
        this.isdelete = isdelete;
    }

    public UserFurniture() {
        super();
    }

    public Long getFurnitureid() {
        return furnitureid;
    }

    public void setFurnitureid(Long furnitureid) {
        this.furnitureid = furnitureid;
    }

    public Long getUserid() {
        return userid;
    }

    public void setUserid(Long userid) {
        this.userid = userid;
    }

    public Integer getFurniturecategory() {
        return furniturecategory;
    }

    public void setFurniturecategory(Integer furniturecategory) {
        this.furniturecategory = furniturecategory;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getNameen() {
        return nameen;
    }

    public void setNameen(String nameen) {
        this.nameen = nameen == null ? null : nameen.trim();
    }

    public Boolean getIsdonation() {
        return isdonation;
    }

    public void setIsdonation(Boolean isdonation) {
        this.isdonation = isdonation;
    }

    public String getDonationdesc() {
        return donationdesc;
    }

    public void setDonationdesc(String donationdesc) {
        this.donationdesc = donationdesc == null ? null : donationdesc.trim();
    }

    public Integer getFurnitureitem() {
        return furnitureitem;
    }

    public void setFurnitureitem(Integer furnitureitem) {
        this.furnitureitem = furnitureitem;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand == null ? null : brand.trim();
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getBargaining() {
        return bargaining;
    }

    public void setBargaining(String bargaining) {
        this.bargaining = bargaining == null ? null : bargaining.trim();
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

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce == null ? null : introduce.trim();
    }

    public String getIntroduceen() {
        return introduceen;
    }

    public void setIntroduceen(String introduceen) {
        this.introduceen = introduceen == null ? null : introduceen.trim();
    }

    public Integer getDegree() {
        return degree;
    }

    public void setDegree(Integer degree) {
        this.degree = degree;
    }

    public String getGscopecode() {
        return gscopecode;
    }

    public void setGscopecode(String gscopecode) {
        this.gscopecode = gscopecode == null ? null : gscopecode.trim();
    }

    public String getHandovermethod() {
        return handovermethod;
    }

    public void setHandovermethod(String handovermethod) {
        this.handovermethod = handovermethod == null ? null : handovermethod.trim();
    }

    public String getHandovertime() {
        return handovertime;
    }

    public void setHandovertime(String handovertime) {
        this.handovertime = handovertime == null ? null : handovertime.trim();
    }

    public String getOriginalbuytime() {
        return originalbuytime;
    }

    public void setOriginalbuytime(String originalbuytime) {
        this.originalbuytime = originalbuytime == null ? null : originalbuytime.trim();
    }

    public String getOriginabuyprice() {
        return originabuyprice;
    }

    public void setOriginabuyprice(String originabuyprice) {
        this.originabuyprice = originabuyprice == null ? null : originabuyprice.trim();
    }

    public String getContactname() {
        return contactname;
    }

    public void setContactname(String contactname) {
        this.contactname = contactname == null ? null : contactname.trim();
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone == null ? null : telephone.trim();
    }

    public Boolean getIswhatsapp() {
        return iswhatsapp;
    }

    public void setIswhatsapp(Boolean iswhatsapp) {
        this.iswhatsapp = iswhatsapp;
    }

    public Boolean getIsonline() {
        return isonline;
    }

    public void setIsonline(Boolean isonline) {
        this.isonline = isonline;
    }

    public Date getExpiretime() {
        return expiretime;
    }

    public void setExpiretime(Date expiretime) {
        this.expiretime = expiretime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
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