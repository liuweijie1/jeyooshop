package com.house730.admin.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class Estate {
    private Long estateid;

    private String estatecode;

    private Long parentestateid;

    private String parentestatecode;

    private String estatetype;

    private String estatename;

    private String estatenameen;

    private String phase;

    private String phaseen;

    private Integer phasesequence;

    private String estatecertname;

    private String estatecertnameen;

    private String estatealias;

    private String estatealiasen;

    private Integer estatecategory;

    private Integer propertyusage;

    private String gscopecode;

    private BigDecimal coverarea;

    private BigDecimal buildingarea;

    private String certaddress;

    private String certaddressen;

    private String detailaddress;

    private String detailaddressen;

    private Date completeddate;

    private Integer propertyrightyears;

    private BigDecimal greeningrate;

    private BigDecimal floorrate;

    private String developer;

    private String developeren;

    private String propertycompany;

    private String propertycompanyen;

    private String propertymanagementfee;

    private String parkingspace;

    private String parkingfee;

    private String buildingnumber;

    private String housenumber;

    private Integer unitnumber;

    private Integer buildingage;

    private Double longitudes;

    private Double latitudes;

    private Integer browsenumber;

    private Boolean isshow;

    private Boolean istop;

    private Boolean ishot;

    private Integer marketlevel;

    private Integer sequence;

    private String createuser;

    private Date createtime;

    private String updateuser;

    private Date updatetime;

    private Boolean isdelete;

    private byte[] geo;

    public Estate(Long estateid, String estatecode, Long parentestateid, String parentestatecode, String estatetype, String estatename, String estatenameen, String phase, String phaseen, Integer phasesequence, String estatecertname, String estatecertnameen, String estatealias, String estatealiasen, Integer estatecategory, Integer propertyusage, String gscopecode, BigDecimal coverarea, BigDecimal buildingarea, String certaddress, String certaddressen, String detailaddress, String detailaddressen, Date completeddate, Integer propertyrightyears, BigDecimal greeningrate, BigDecimal floorrate, String developer, String developeren, String propertycompany, String propertycompanyen, String propertymanagementfee, String parkingspace, String parkingfee, String buildingnumber, String housenumber, Integer unitnumber, Integer buildingage, Double longitudes, Double latitudes, Integer browsenumber, Boolean isshow, Boolean istop, Boolean ishot, Integer marketlevel, Integer sequence, String createuser, Date createtime, String updateuser, Date updatetime, Boolean isdelete, byte[] geo) {
        this.estateid = estateid;
        this.estatecode = estatecode;
        this.parentestateid = parentestateid;
        this.parentestatecode = parentestatecode;
        this.estatetype = estatetype;
        this.estatename = estatename;
        this.estatenameen = estatenameen;
        this.phase = phase;
        this.phaseen = phaseen;
        this.phasesequence = phasesequence;
        this.estatecertname = estatecertname;
        this.estatecertnameen = estatecertnameen;
        this.estatealias = estatealias;
        this.estatealiasen = estatealiasen;
        this.estatecategory = estatecategory;
        this.propertyusage = propertyusage;
        this.gscopecode = gscopecode;
        this.coverarea = coverarea;
        this.buildingarea = buildingarea;
        this.certaddress = certaddress;
        this.certaddressen = certaddressen;
        this.detailaddress = detailaddress;
        this.detailaddressen = detailaddressen;
        this.completeddate = completeddate;
        this.propertyrightyears = propertyrightyears;
        this.greeningrate = greeningrate;
        this.floorrate = floorrate;
        this.developer = developer;
        this.developeren = developeren;
        this.propertycompany = propertycompany;
        this.propertycompanyen = propertycompanyen;
        this.propertymanagementfee = propertymanagementfee;
        this.parkingspace = parkingspace;
        this.parkingfee = parkingfee;
        this.buildingnumber = buildingnumber;
        this.housenumber = housenumber;
        this.unitnumber = unitnumber;
        this.buildingage = buildingage;
        this.longitudes = longitudes;
        this.latitudes = latitudes;
        this.browsenumber = browsenumber;
        this.isshow = isshow;
        this.istop = istop;
        this.ishot = ishot;
        this.marketlevel = marketlevel;
        this.sequence = sequence;
        this.createuser = createuser;
        this.createtime = createtime;
        this.updateuser = updateuser;
        this.updatetime = updatetime;
        this.isdelete = isdelete;
        this.geo = geo;
    }

    public Estate() {
        super();
    }

    public Long getEstateid() {
        return estateid;
    }

    public void setEstateid(Long estateid) {
        this.estateid = estateid;
    }

    public String getEstatecode() {
        return estatecode;
    }

    public void setEstatecode(String estatecode) {
        this.estatecode = estatecode == null ? null : estatecode.trim();
    }

    public Long getParentestateid() {
        return parentestateid;
    }

    public void setParentestateid(Long parentestateid) {
        this.parentestateid = parentestateid;
    }

    public String getParentestatecode() {
        return parentestatecode;
    }

    public void setParentestatecode(String parentestatecode) {
        this.parentestatecode = parentestatecode == null ? null : parentestatecode.trim();
    }

    public String getEstatetype() {
        return estatetype;
    }

    public void setEstatetype(String estatetype) {
        this.estatetype = estatetype == null ? null : estatetype.trim();
    }

    public String getEstatename() {
        return estatename;
    }

    public void setEstatename(String estatename) {
        this.estatename = estatename == null ? null : estatename.trim();
    }

    public String getEstatenameen() {
        return estatenameen;
    }

    public void setEstatenameen(String estatenameen) {
        this.estatenameen = estatenameen == null ? null : estatenameen.trim();
    }

    public String getPhase() {
        return phase;
    }

    public void setPhase(String phase) {
        this.phase = phase == null ? null : phase.trim();
    }

    public String getPhaseen() {
        return phaseen;
    }

    public void setPhaseen(String phaseen) {
        this.phaseen = phaseen == null ? null : phaseen.trim();
    }

    public Integer getPhasesequence() {
        return phasesequence;
    }

    public void setPhasesequence(Integer phasesequence) {
        this.phasesequence = phasesequence;
    }

    public String getEstatecertname() {
        return estatecertname;
    }

    public void setEstatecertname(String estatecertname) {
        this.estatecertname = estatecertname == null ? null : estatecertname.trim();
    }

    public String getEstatecertnameen() {
        return estatecertnameen;
    }

    public void setEstatecertnameen(String estatecertnameen) {
        this.estatecertnameen = estatecertnameen == null ? null : estatecertnameen.trim();
    }

    public String getEstatealias() {
        return estatealias;
    }

    public void setEstatealias(String estatealias) {
        this.estatealias = estatealias == null ? null : estatealias.trim();
    }

    public String getEstatealiasen() {
        return estatealiasen;
    }

    public void setEstatealiasen(String estatealiasen) {
        this.estatealiasen = estatealiasen == null ? null : estatealiasen.trim();
    }

    public Integer getEstatecategory() {
        return estatecategory;
    }

    public void setEstatecategory(Integer estatecategory) {
        this.estatecategory = estatecategory;
    }

    public Integer getPropertyusage() {
        return propertyusage;
    }

    public void setPropertyusage(Integer propertyusage) {
        this.propertyusage = propertyusage;
    }

    public String getGscopecode() {
        return gscopecode;
    }

    public void setGscopecode(String gscopecode) {
        this.gscopecode = gscopecode == null ? null : gscopecode.trim();
    }

    public BigDecimal getCoverarea() {
        return coverarea;
    }

    public void setCoverarea(BigDecimal coverarea) {
        this.coverarea = coverarea;
    }

    public BigDecimal getBuildingarea() {
        return buildingarea;
    }

    public void setBuildingarea(BigDecimal buildingarea) {
        this.buildingarea = buildingarea;
    }

    public String getCertaddress() {
        return certaddress;
    }

    public void setCertaddress(String certaddress) {
        this.certaddress = certaddress == null ? null : certaddress.trim();
    }

    public String getCertaddressen() {
        return certaddressen;
    }

    public void setCertaddressen(String certaddressen) {
        this.certaddressen = certaddressen == null ? null : certaddressen.trim();
    }

    public String getDetailaddress() {
        return detailaddress;
    }

    public void setDetailaddress(String detailaddress) {
        this.detailaddress = detailaddress == null ? null : detailaddress.trim();
    }

    public String getDetailaddressen() {
        return detailaddressen;
    }

    public void setDetailaddressen(String detailaddressen) {
        this.detailaddressen = detailaddressen == null ? null : detailaddressen.trim();
    }

    public Date getCompleteddate() {
        return completeddate;
    }

    public void setCompleteddate(Date completeddate) {
        this.completeddate = completeddate;
    }

    public Integer getPropertyrightyears() {
        return propertyrightyears;
    }

    public void setPropertyrightyears(Integer propertyrightyears) {
        this.propertyrightyears = propertyrightyears;
    }

    public BigDecimal getGreeningrate() {
        return greeningrate;
    }

    public void setGreeningrate(BigDecimal greeningrate) {
        this.greeningrate = greeningrate;
    }

    public BigDecimal getFloorrate() {
        return floorrate;
    }

    public void setFloorrate(BigDecimal floorrate) {
        this.floorrate = floorrate;
    }

    public String getDeveloper() {
        return developer;
    }

    public void setDeveloper(String developer) {
        this.developer = developer == null ? null : developer.trim();
    }

    public String getDeveloperen() {
        return developeren;
    }

    public void setDeveloperen(String developeren) {
        this.developeren = developeren == null ? null : developeren.trim();
    }

    public String getPropertycompany() {
        return propertycompany;
    }

    public void setPropertycompany(String propertycompany) {
        this.propertycompany = propertycompany == null ? null : propertycompany.trim();
    }

    public String getPropertycompanyen() {
        return propertycompanyen;
    }

    public void setPropertycompanyen(String propertycompanyen) {
        this.propertycompanyen = propertycompanyen == null ? null : propertycompanyen.trim();
    }

    public String getPropertymanagementfee() {
        return propertymanagementfee;
    }

    public void setPropertymanagementfee(String propertymanagementfee) {
        this.propertymanagementfee = propertymanagementfee == null ? null : propertymanagementfee.trim();
    }

    public String getParkingspace() {
        return parkingspace;
    }

    public void setParkingspace(String parkingspace) {
        this.parkingspace = parkingspace == null ? null : parkingspace.trim();
    }

    public String getParkingfee() {
        return parkingfee;
    }

    public void setParkingfee(String parkingfee) {
        this.parkingfee = parkingfee == null ? null : parkingfee.trim();
    }

    public String getBuildingnumber() {
        return buildingnumber;
    }

    public void setBuildingnumber(String buildingnumber) {
        this.buildingnumber = buildingnumber == null ? null : buildingnumber.trim();
    }

    public String getHousenumber() {
        return housenumber;
    }

    public void setHousenumber(String housenumber) {
        this.housenumber = housenumber == null ? null : housenumber.trim();
    }

    public Integer getUnitnumber() {
        return unitnumber;
    }

    public void setUnitnumber(Integer unitnumber) {
        this.unitnumber = unitnumber;
    }

    public Integer getBuildingage() {
        return buildingage;
    }

    public void setBuildingage(Integer buildingage) {
        this.buildingage = buildingage;
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

    public Integer getBrowsenumber() {
        return browsenumber;
    }

    public void setBrowsenumber(Integer browsenumber) {
        this.browsenumber = browsenumber;
    }

    public Boolean getIsshow() {
        return isshow;
    }

    public void setIsshow(Boolean isshow) {
        this.isshow = isshow;
    }

    public Boolean getIstop() {
        return istop;
    }

    public void setIstop(Boolean istop) {
        this.istop = istop;
    }

    public Boolean getIshot() {
        return ishot;
    }

    public void setIshot(Boolean ishot) {
        this.ishot = ishot;
    }

    public Integer getMarketlevel() {
        return marketlevel;
    }

    public void setMarketlevel(Integer marketlevel) {
        this.marketlevel = marketlevel;
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