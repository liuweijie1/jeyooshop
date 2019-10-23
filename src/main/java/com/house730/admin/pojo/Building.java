package com.house730.admin.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class Building {
    private Long buildingid;

    private String buildingcode;

    private Long estateid;

    private Long parentestateid;

    private String gscopecode;

    private String buildingname;

    private String buildingnameen;

    private String buildingalias;

    private String buildingaliasen;

    private String buildingaddress;

    private String buildingaddressen;

    private Date openingdate;

    private Integer direction;

    private BigDecimal buildingarea;

    private Integer propertyusage;

    private Integer buildingtype;

    private Integer architecturetype;

    private BigDecimal propertymanagementfee;

    private Integer unitnumber;

    private Integer buildingnumber;

    private Integer elevatornumber;

    private Integer elevatorroomnumber;

    private Integer roomnumber;

    private Integer stairtype;

    private Integer floorheighttype;

    private Integer startfloor;

    private Integer totalfloors;

    private Integer buildingage;

    private String street;

    private String streeten;

    private String streetno;

    private String streetnoen;

    private Double longitudes;

    private Double latitudes;

    private Integer sequence;

    private String createuser;

    private Date createtime;

    private String updateuser;

    private Date updatetime;

    private Boolean isdelete;

    private byte[] geo;

    public Building(Long buildingid, String buildingcode, Long estateid, Long parentestateid, String gscopecode, String buildingname, String buildingnameen, String buildingalias, String buildingaliasen, String buildingaddress, String buildingaddressen, Date openingdate, Integer direction, BigDecimal buildingarea, Integer propertyusage, Integer buildingtype, Integer architecturetype, BigDecimal propertymanagementfee, Integer unitnumber, Integer buildingnumber, Integer elevatornumber, Integer elevatorroomnumber, Integer roomnumber, Integer stairtype, Integer floorheighttype, Integer startfloor, Integer totalfloors, Integer buildingage, String street, String streeten, String streetno, String streetnoen, Double longitudes, Double latitudes, Integer sequence, String createuser, Date createtime, String updateuser, Date updatetime, Boolean isdelete, byte[] geo) {
        this.buildingid = buildingid;
        this.buildingcode = buildingcode;
        this.estateid = estateid;
        this.parentestateid = parentestateid;
        this.gscopecode = gscopecode;
        this.buildingname = buildingname;
        this.buildingnameen = buildingnameen;
        this.buildingalias = buildingalias;
        this.buildingaliasen = buildingaliasen;
        this.buildingaddress = buildingaddress;
        this.buildingaddressen = buildingaddressen;
        this.openingdate = openingdate;
        this.direction = direction;
        this.buildingarea = buildingarea;
        this.propertyusage = propertyusage;
        this.buildingtype = buildingtype;
        this.architecturetype = architecturetype;
        this.propertymanagementfee = propertymanagementfee;
        this.unitnumber = unitnumber;
        this.buildingnumber = buildingnumber;
        this.elevatornumber = elevatornumber;
        this.elevatorroomnumber = elevatorroomnumber;
        this.roomnumber = roomnumber;
        this.stairtype = stairtype;
        this.floorheighttype = floorheighttype;
        this.startfloor = startfloor;
        this.totalfloors = totalfloors;
        this.buildingage = buildingage;
        this.street = street;
        this.streeten = streeten;
        this.streetno = streetno;
        this.streetnoen = streetnoen;
        this.longitudes = longitudes;
        this.latitudes = latitudes;
        this.sequence = sequence;
        this.createuser = createuser;
        this.createtime = createtime;
        this.updateuser = updateuser;
        this.updatetime = updatetime;
        this.isdelete = isdelete;
        this.geo = geo;
    }

    public Building() {
        super();
    }

    public Long getBuildingid() {
        return buildingid;
    }

    public void setBuildingid(Long buildingid) {
        this.buildingid = buildingid;
    }

    public String getBuildingcode() {
        return buildingcode;
    }

    public void setBuildingcode(String buildingcode) {
        this.buildingcode = buildingcode == null ? null : buildingcode.trim();
    }

    public Long getEstateid() {
        return estateid;
    }

    public void setEstateid(Long estateid) {
        this.estateid = estateid;
    }

    public Long getParentestateid() {
        return parentestateid;
    }

    public void setParentestateid(Long parentestateid) {
        this.parentestateid = parentestateid;
    }

    public String getGscopecode() {
        return gscopecode;
    }

    public void setGscopecode(String gscopecode) {
        this.gscopecode = gscopecode == null ? null : gscopecode.trim();
    }

    public String getBuildingname() {
        return buildingname;
    }

    public void setBuildingname(String buildingname) {
        this.buildingname = buildingname == null ? null : buildingname.trim();
    }

    public String getBuildingnameen() {
        return buildingnameen;
    }

    public void setBuildingnameen(String buildingnameen) {
        this.buildingnameen = buildingnameen == null ? null : buildingnameen.trim();
    }

    public String getBuildingalias() {
        return buildingalias;
    }

    public void setBuildingalias(String buildingalias) {
        this.buildingalias = buildingalias == null ? null : buildingalias.trim();
    }

    public String getBuildingaliasen() {
        return buildingaliasen;
    }

    public void setBuildingaliasen(String buildingaliasen) {
        this.buildingaliasen = buildingaliasen == null ? null : buildingaliasen.trim();
    }

    public String getBuildingaddress() {
        return buildingaddress;
    }

    public void setBuildingaddress(String buildingaddress) {
        this.buildingaddress = buildingaddress == null ? null : buildingaddress.trim();
    }

    public String getBuildingaddressen() {
        return buildingaddressen;
    }

    public void setBuildingaddressen(String buildingaddressen) {
        this.buildingaddressen = buildingaddressen == null ? null : buildingaddressen.trim();
    }

    public Date getOpeningdate() {
        return openingdate;
    }

    public void setOpeningdate(Date openingdate) {
        this.openingdate = openingdate;
    }

    public Integer getDirection() {
        return direction;
    }

    public void setDirection(Integer direction) {
        this.direction = direction;
    }

    public BigDecimal getBuildingarea() {
        return buildingarea;
    }

    public void setBuildingarea(BigDecimal buildingarea) {
        this.buildingarea = buildingarea;
    }

    public Integer getPropertyusage() {
        return propertyusage;
    }

    public void setPropertyusage(Integer propertyusage) {
        this.propertyusage = propertyusage;
    }

    public Integer getBuildingtype() {
        return buildingtype;
    }

    public void setBuildingtype(Integer buildingtype) {
        this.buildingtype = buildingtype;
    }

    public Integer getArchitecturetype() {
        return architecturetype;
    }

    public void setArchitecturetype(Integer architecturetype) {
        this.architecturetype = architecturetype;
    }

    public BigDecimal getPropertymanagementfee() {
        return propertymanagementfee;
    }

    public void setPropertymanagementfee(BigDecimal propertymanagementfee) {
        this.propertymanagementfee = propertymanagementfee;
    }

    public Integer getUnitnumber() {
        return unitnumber;
    }

    public void setUnitnumber(Integer unitnumber) {
        this.unitnumber = unitnumber;
    }

    public Integer getBuildingnumber() {
        return buildingnumber;
    }

    public void setBuildingnumber(Integer buildingnumber) {
        this.buildingnumber = buildingnumber;
    }

    public Integer getElevatornumber() {
        return elevatornumber;
    }

    public void setElevatornumber(Integer elevatornumber) {
        this.elevatornumber = elevatornumber;
    }

    public Integer getElevatorroomnumber() {
        return elevatorroomnumber;
    }

    public void setElevatorroomnumber(Integer elevatorroomnumber) {
        this.elevatorroomnumber = elevatorroomnumber;
    }

    public Integer getRoomnumber() {
        return roomnumber;
    }

    public void setRoomnumber(Integer roomnumber) {
        this.roomnumber = roomnumber;
    }

    public Integer getStairtype() {
        return stairtype;
    }

    public void setStairtype(Integer stairtype) {
        this.stairtype = stairtype;
    }

    public Integer getFloorheighttype() {
        return floorheighttype;
    }

    public void setFloorheighttype(Integer floorheighttype) {
        this.floorheighttype = floorheighttype;
    }

    public Integer getStartfloor() {
        return startfloor;
    }

    public void setStartfloor(Integer startfloor) {
        this.startfloor = startfloor;
    }

    public Integer getTotalfloors() {
        return totalfloors;
    }

    public void setTotalfloors(Integer totalfloors) {
        this.totalfloors = totalfloors;
    }

    public Integer getBuildingage() {
        return buildingage;
    }

    public void setBuildingage(Integer buildingage) {
        this.buildingage = buildingage;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street == null ? null : street.trim();
    }

    public String getStreeten() {
        return streeten;
    }

    public void setStreeten(String streeten) {
        this.streeten = streeten == null ? null : streeten.trim();
    }

    public String getStreetno() {
        return streetno;
    }

    public void setStreetno(String streetno) {
        this.streetno = streetno == null ? null : streetno.trim();
    }

    public String getStreetnoen() {
        return streetnoen;
    }

    public void setStreetnoen(String streetnoen) {
        this.streetnoen = streetnoen == null ? null : streetnoen.trim();
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

    public byte[] getGeo() {
        return geo;
    }

    public void setGeo(byte[] geo) {
        this.geo = geo;
    }
}