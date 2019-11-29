package com.jeyoo.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class UserLandSearch {
    private Integer caseid;

    private Long estateid;

    private Integer propertytype;

    private String buildingname;

    private String floor;

    private String roomnumber;

    private Long propertyid;

    private BigDecimal price;

    private Integer landsearchitem;

    private Boolean islinkparking;

    private Boolean islinkgarden;

    private BigDecimal gardenarea;

    private Boolean islinkrooftop;

    private BigDecimal rooftoparea;

    private String otherinfo;

    private String name;

    private String telephone;

    private String email;

    private Integer ownertype;

    private Integer paymentmethod;

    private BigDecimal money;

    private String status;

    private String createuser;

    private Date createtime;

    private String updateuser;

    private Date updatetime;

    private Boolean isdelete;

    public UserLandSearch(Integer caseid, Long estateid, Integer propertytype, String buildingname, String floor, String roomnumber, Long propertyid, BigDecimal price, Integer landsearchitem, Boolean islinkparking, Boolean islinkgarden, BigDecimal gardenarea, Boolean islinkrooftop, BigDecimal rooftoparea, String otherinfo, String name, String telephone, String email, Integer ownertype, Integer paymentmethod, BigDecimal money, String status, String createuser, Date createtime, String updateuser, Date updatetime, Boolean isdelete) {
        this.caseid = caseid;
        this.estateid = estateid;
        this.propertytype = propertytype;
        this.buildingname = buildingname;
        this.floor = floor;
        this.roomnumber = roomnumber;
        this.propertyid = propertyid;
        this.price = price;
        this.landsearchitem = landsearchitem;
        this.islinkparking = islinkparking;
        this.islinkgarden = islinkgarden;
        this.gardenarea = gardenarea;
        this.islinkrooftop = islinkrooftop;
        this.rooftoparea = rooftoparea;
        this.otherinfo = otherinfo;
        this.name = name;
        this.telephone = telephone;
        this.email = email;
        this.ownertype = ownertype;
        this.paymentmethod = paymentmethod;
        this.money = money;
        this.status = status;
        this.createuser = createuser;
        this.createtime = createtime;
        this.updateuser = updateuser;
        this.updatetime = updatetime;
        this.isdelete = isdelete;
    }

    public UserLandSearch() {
        super();
    }

    public Integer getCaseid() {
        return caseid;
    }

    public void setCaseid(Integer caseid) {
        this.caseid = caseid;
    }

    public Long getEstateid() {
        return estateid;
    }

    public void setEstateid(Long estateid) {
        this.estateid = estateid;
    }

    public Integer getPropertytype() {
        return propertytype;
    }

    public void setPropertytype(Integer propertytype) {
        this.propertytype = propertytype;
    }

    public String getBuildingname() {
        return buildingname;
    }

    public void setBuildingname(String buildingname) {
        this.buildingname = buildingname == null ? null : buildingname.trim();
    }

    public String getFloor() {
        return floor;
    }

    public void setFloor(String floor) {
        this.floor = floor == null ? null : floor.trim();
    }

    public String getRoomnumber() {
        return roomnumber;
    }

    public void setRoomnumber(String roomnumber) {
        this.roomnumber = roomnumber == null ? null : roomnumber.trim();
    }

    public Long getPropertyid() {
        return propertyid;
    }

    public void setPropertyid(Long propertyid) {
        this.propertyid = propertyid;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getLandsearchitem() {
        return landsearchitem;
    }

    public void setLandsearchitem(Integer landsearchitem) {
        this.landsearchitem = landsearchitem;
    }

    public Boolean getIslinkparking() {
        return islinkparking;
    }

    public void setIslinkparking(Boolean islinkparking) {
        this.islinkparking = islinkparking;
    }

    public Boolean getIslinkgarden() {
        return islinkgarden;
    }

    public void setIslinkgarden(Boolean islinkgarden) {
        this.islinkgarden = islinkgarden;
    }

    public BigDecimal getGardenarea() {
        return gardenarea;
    }

    public void setGardenarea(BigDecimal gardenarea) {
        this.gardenarea = gardenarea;
    }

    public Boolean getIslinkrooftop() {
        return islinkrooftop;
    }

    public void setIslinkrooftop(Boolean islinkrooftop) {
        this.islinkrooftop = islinkrooftop;
    }

    public BigDecimal getRooftoparea() {
        return rooftoparea;
    }

    public void setRooftoparea(BigDecimal rooftoparea) {
        this.rooftoparea = rooftoparea;
    }

    public String getOtherinfo() {
        return otherinfo;
    }

    public void setOtherinfo(String otherinfo) {
        this.otherinfo = otherinfo == null ? null : otherinfo.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone == null ? null : telephone.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Integer getOwnertype() {
        return ownertype;
    }

    public void setOwnertype(Integer ownertype) {
        this.ownertype = ownertype;
    }

    public Integer getPaymentmethod() {
        return paymentmethod;
    }

    public void setPaymentmethod(Integer paymentmethod) {
        this.paymentmethod = paymentmethod;
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
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