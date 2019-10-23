package com.house730.admin.pojo;

import java.util.Date;

public class EstateAdditionInfo {
    private Integer estateid;

    private String estateintroduce;

    private String estateintroduceen;

    private String facilities;

    private String facilitiesen;

    private String service;

    private String serviceen;

    private String charge;

    private String chargeen;

    private String lable;

    private String lableen;

    private String aroundtraffic;

    private String aroundtrafficen;

    private String aroundfacilitie;

    private String aroundfacilitieen;

    private String createuser;

    private Date createtime;

    private String updateuser;

    private Date updatetime;

    private Boolean isdelete;

    public EstateAdditionInfo(Integer estateid, String estateintroduce, String estateintroduceen, String facilities, String facilitiesen, String service, String serviceen, String charge, String chargeen, String lable, String lableen, String aroundtraffic, String aroundtrafficen, String aroundfacilitie, String aroundfacilitieen, String createuser, Date createtime, String updateuser, Date updatetime, Boolean isdelete) {
        this.estateid = estateid;
        this.estateintroduce = estateintroduce;
        this.estateintroduceen = estateintroduceen;
        this.facilities = facilities;
        this.facilitiesen = facilitiesen;
        this.service = service;
        this.serviceen = serviceen;
        this.charge = charge;
        this.chargeen = chargeen;
        this.lable = lable;
        this.lableen = lableen;
        this.aroundtraffic = aroundtraffic;
        this.aroundtrafficen = aroundtrafficen;
        this.aroundfacilitie = aroundfacilitie;
        this.aroundfacilitieen = aroundfacilitieen;
        this.createuser = createuser;
        this.createtime = createtime;
        this.updateuser = updateuser;
        this.updatetime = updatetime;
        this.isdelete = isdelete;
    }

    public EstateAdditionInfo() {
        super();
    }

    public Integer getEstateid() {
        return estateid;
    }

    public void setEstateid(Integer estateid) {
        this.estateid = estateid;
    }

    public String getEstateintroduce() {
        return estateintroduce;
    }

    public void setEstateintroduce(String estateintroduce) {
        this.estateintroduce = estateintroduce == null ? null : estateintroduce.trim();
    }

    public String getEstateintroduceen() {
        return estateintroduceen;
    }

    public void setEstateintroduceen(String estateintroduceen) {
        this.estateintroduceen = estateintroduceen == null ? null : estateintroduceen.trim();
    }

    public String getFacilities() {
        return facilities;
    }

    public void setFacilities(String facilities) {
        this.facilities = facilities == null ? null : facilities.trim();
    }

    public String getFacilitiesen() {
        return facilitiesen;
    }

    public void setFacilitiesen(String facilitiesen) {
        this.facilitiesen = facilitiesen == null ? null : facilitiesen.trim();
    }

    public String getService() {
        return service;
    }

    public void setService(String service) {
        this.service = service == null ? null : service.trim();
    }

    public String getServiceen() {
        return serviceen;
    }

    public void setServiceen(String serviceen) {
        this.serviceen = serviceen == null ? null : serviceen.trim();
    }

    public String getCharge() {
        return charge;
    }

    public void setCharge(String charge) {
        this.charge = charge == null ? null : charge.trim();
    }

    public String getChargeen() {
        return chargeen;
    }

    public void setChargeen(String chargeen) {
        this.chargeen = chargeen == null ? null : chargeen.trim();
    }

    public String getLable() {
        return lable;
    }

    public void setLable(String lable) {
        this.lable = lable == null ? null : lable.trim();
    }

    public String getLableen() {
        return lableen;
    }

    public void setLableen(String lableen) {
        this.lableen = lableen == null ? null : lableen.trim();
    }

    public String getAroundtraffic() {
        return aroundtraffic;
    }

    public void setAroundtraffic(String aroundtraffic) {
        this.aroundtraffic = aroundtraffic == null ? null : aroundtraffic.trim();
    }

    public String getAroundtrafficen() {
        return aroundtrafficen;
    }

    public void setAroundtrafficen(String aroundtrafficen) {
        this.aroundtrafficen = aroundtrafficen == null ? null : aroundtrafficen.trim();
    }

    public String getAroundfacilitie() {
        return aroundfacilitie;
    }

    public void setAroundfacilitie(String aroundfacilitie) {
        this.aroundfacilitie = aroundfacilitie == null ? null : aroundfacilitie.trim();
    }

    public String getAroundfacilitieen() {
        return aroundfacilitieen;
    }

    public void setAroundfacilitieen(String aroundfacilitieen) {
        this.aroundfacilitieen = aroundfacilitieen == null ? null : aroundfacilitieen.trim();
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