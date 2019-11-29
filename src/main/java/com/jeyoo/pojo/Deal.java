package com.jeyoo.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class Deal {
    private String dealcode;

    private Long dealid;

    private Date dealtime;

    private String gscopecode;

    private Long estateid;

    private Long parentestateid;

    private Long buildingid;

    private BigDecimal dealprice;

    private BigDecimal buildingarea;

    private BigDecimal saleablearea;

    private BigDecimal buildingavgprice;

    private BigDecimal saleableavgprice;

    private String address;

    private String addressen;

    private String contractmode;

    private String floor;

    private String totalfloor;

    private String buildingname;

    private String buildingnameen;

    private String direction;

    private Date registertime;

    private Integer marketlevel;

    private String unitno;

    private String registeraddress1;

    private String registeraddress1en;

    private String registeraddress2;

    private String registeraddress2en;

    private String buildingusage;

    private String buildingusagedesc;

    private String buildingusagedescen;

    private String unitusage;

    private String unitusagedesc;

    private String unitusagedescen;

    private Integer dealbuildingage;

    private String evaluateno;

    private String propertyreferno;

    private String lastregisterno;

    private BigDecimal lastdealprice;

    private Date lastdealtime;

    private Date lastregistertime;

    private BigDecimal lastbuildingavgprice;

    private Integer lastholddays;

    private BigDecimal profit;

    private BigDecimal profitpercent;

    private BigDecimal profitpercentyear;

    private Boolean isdelete;

    public Deal(String dealcode, Long dealid, Date dealtime, String gscopecode, Long estateid, Long parentestateid, Long buildingid, BigDecimal dealprice, BigDecimal buildingarea, BigDecimal saleablearea, BigDecimal buildingavgprice, BigDecimal saleableavgprice, String address, String addressen, String contractmode, String floor, String totalfloor, String buildingname, String buildingnameen, String direction, Date registertime, Integer marketlevel, String unitno, String registeraddress1, String registeraddress1en, String registeraddress2, String registeraddress2en, String buildingusage, String buildingusagedesc, String buildingusagedescen, String unitusage, String unitusagedesc, String unitusagedescen, Integer dealbuildingage, String evaluateno, String propertyreferno, String lastregisterno, BigDecimal lastdealprice, Date lastdealtime, Date lastregistertime, BigDecimal lastbuildingavgprice, Integer lastholddays, BigDecimal profit, BigDecimal profitpercent, BigDecimal profitpercentyear, Boolean isdelete) {
        this.dealcode = dealcode;
        this.dealid = dealid;
        this.dealtime = dealtime;
        this.gscopecode = gscopecode;
        this.estateid = estateid;
        this.parentestateid = parentestateid;
        this.buildingid = buildingid;
        this.dealprice = dealprice;
        this.buildingarea = buildingarea;
        this.saleablearea = saleablearea;
        this.buildingavgprice = buildingavgprice;
        this.saleableavgprice = saleableavgprice;
        this.address = address;
        this.addressen = addressen;
        this.contractmode = contractmode;
        this.floor = floor;
        this.totalfloor = totalfloor;
        this.buildingname = buildingname;
        this.buildingnameen = buildingnameen;
        this.direction = direction;
        this.registertime = registertime;
        this.marketlevel = marketlevel;
        this.unitno = unitno;
        this.registeraddress1 = registeraddress1;
        this.registeraddress1en = registeraddress1en;
        this.registeraddress2 = registeraddress2;
        this.registeraddress2en = registeraddress2en;
        this.buildingusage = buildingusage;
        this.buildingusagedesc = buildingusagedesc;
        this.buildingusagedescen = buildingusagedescen;
        this.unitusage = unitusage;
        this.unitusagedesc = unitusagedesc;
        this.unitusagedescen = unitusagedescen;
        this.dealbuildingage = dealbuildingage;
        this.evaluateno = evaluateno;
        this.propertyreferno = propertyreferno;
        this.lastregisterno = lastregisterno;
        this.lastdealprice = lastdealprice;
        this.lastdealtime = lastdealtime;
        this.lastregistertime = lastregistertime;
        this.lastbuildingavgprice = lastbuildingavgprice;
        this.lastholddays = lastholddays;
        this.profit = profit;
        this.profitpercent = profitpercent;
        this.profitpercentyear = profitpercentyear;
        this.isdelete = isdelete;
    }

    public Deal() {
        super();
    }

    public String getDealcode() {
        return dealcode;
    }

    public void setDealcode(String dealcode) {
        this.dealcode = dealcode == null ? null : dealcode.trim();
    }

    public Long getDealid() {
        return dealid;
    }

    public void setDealid(Long dealid) {
        this.dealid = dealid;
    }

    public Date getDealtime() {
        return dealtime;
    }

    public void setDealtime(Date dealtime) {
        this.dealtime = dealtime;
    }

    public String getGscopecode() {
        return gscopecode;
    }

    public void setGscopecode(String gscopecode) {
        this.gscopecode = gscopecode == null ? null : gscopecode.trim();
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

    public Long getBuildingid() {
        return buildingid;
    }

    public void setBuildingid(Long buildingid) {
        this.buildingid = buildingid;
    }

    public BigDecimal getDealprice() {
        return dealprice;
    }

    public void setDealprice(BigDecimal dealprice) {
        this.dealprice = dealprice;
    }

    public BigDecimal getBuildingarea() {
        return buildingarea;
    }

    public void setBuildingarea(BigDecimal buildingarea) {
        this.buildingarea = buildingarea;
    }

    public BigDecimal getSaleablearea() {
        return saleablearea;
    }

    public void setSaleablearea(BigDecimal saleablearea) {
        this.saleablearea = saleablearea;
    }

    public BigDecimal getBuildingavgprice() {
        return buildingavgprice;
    }

    public void setBuildingavgprice(BigDecimal buildingavgprice) {
        this.buildingavgprice = buildingavgprice;
    }

    public BigDecimal getSaleableavgprice() {
        return saleableavgprice;
    }

    public void setSaleableavgprice(BigDecimal saleableavgprice) {
        this.saleableavgprice = saleableavgprice;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getAddressen() {
        return addressen;
    }

    public void setAddressen(String addressen) {
        this.addressen = addressen == null ? null : addressen.trim();
    }

    public String getContractmode() {
        return contractmode;
    }

    public void setContractmode(String contractmode) {
        this.contractmode = contractmode == null ? null : contractmode.trim();
    }

    public String getFloor() {
        return floor;
    }

    public void setFloor(String floor) {
        this.floor = floor == null ? null : floor.trim();
    }

    public String getTotalfloor() {
        return totalfloor;
    }

    public void setTotalfloor(String totalfloor) {
        this.totalfloor = totalfloor == null ? null : totalfloor.trim();
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

    public String getDirection() {
        return direction;
    }

    public void setDirection(String direction) {
        this.direction = direction == null ? null : direction.trim();
    }

    public Date getRegistertime() {
        return registertime;
    }

    public void setRegistertime(Date registertime) {
        this.registertime = registertime;
    }

    public Integer getMarketlevel() {
        return marketlevel;
    }

    public void setMarketlevel(Integer marketlevel) {
        this.marketlevel = marketlevel;
    }

    public String getUnitno() {
        return unitno;
    }

    public void setUnitno(String unitno) {
        this.unitno = unitno == null ? null : unitno.trim();
    }

    public String getRegisteraddress1() {
        return registeraddress1;
    }

    public void setRegisteraddress1(String registeraddress1) {
        this.registeraddress1 = registeraddress1 == null ? null : registeraddress1.trim();
    }

    public String getRegisteraddress1en() {
        return registeraddress1en;
    }

    public void setRegisteraddress1en(String registeraddress1en) {
        this.registeraddress1en = registeraddress1en == null ? null : registeraddress1en.trim();
    }

    public String getRegisteraddress2() {
        return registeraddress2;
    }

    public void setRegisteraddress2(String registeraddress2) {
        this.registeraddress2 = registeraddress2 == null ? null : registeraddress2.trim();
    }

    public String getRegisteraddress2en() {
        return registeraddress2en;
    }

    public void setRegisteraddress2en(String registeraddress2en) {
        this.registeraddress2en = registeraddress2en == null ? null : registeraddress2en.trim();
    }

    public String getBuildingusage() {
        return buildingusage;
    }

    public void setBuildingusage(String buildingusage) {
        this.buildingusage = buildingusage == null ? null : buildingusage.trim();
    }

    public String getBuildingusagedesc() {
        return buildingusagedesc;
    }

    public void setBuildingusagedesc(String buildingusagedesc) {
        this.buildingusagedesc = buildingusagedesc == null ? null : buildingusagedesc.trim();
    }

    public String getBuildingusagedescen() {
        return buildingusagedescen;
    }

    public void setBuildingusagedescen(String buildingusagedescen) {
        this.buildingusagedescen = buildingusagedescen == null ? null : buildingusagedescen.trim();
    }

    public String getUnitusage() {
        return unitusage;
    }

    public void setUnitusage(String unitusage) {
        this.unitusage = unitusage == null ? null : unitusage.trim();
    }

    public String getUnitusagedesc() {
        return unitusagedesc;
    }

    public void setUnitusagedesc(String unitusagedesc) {
        this.unitusagedesc = unitusagedesc == null ? null : unitusagedesc.trim();
    }

    public String getUnitusagedescen() {
        return unitusagedescen;
    }

    public void setUnitusagedescen(String unitusagedescen) {
        this.unitusagedescen = unitusagedescen == null ? null : unitusagedescen.trim();
    }

    public Integer getDealbuildingage() {
        return dealbuildingage;
    }

    public void setDealbuildingage(Integer dealbuildingage) {
        this.dealbuildingage = dealbuildingage;
    }

    public String getEvaluateno() {
        return evaluateno;
    }

    public void setEvaluateno(String evaluateno) {
        this.evaluateno = evaluateno == null ? null : evaluateno.trim();
    }

    public String getPropertyreferno() {
        return propertyreferno;
    }

    public void setPropertyreferno(String propertyreferno) {
        this.propertyreferno = propertyreferno == null ? null : propertyreferno.trim();
    }

    public String getLastregisterno() {
        return lastregisterno;
    }

    public void setLastregisterno(String lastregisterno) {
        this.lastregisterno = lastregisterno == null ? null : lastregisterno.trim();
    }

    public BigDecimal getLastdealprice() {
        return lastdealprice;
    }

    public void setLastdealprice(BigDecimal lastdealprice) {
        this.lastdealprice = lastdealprice;
    }

    public Date getLastdealtime() {
        return lastdealtime;
    }

    public void setLastdealtime(Date lastdealtime) {
        this.lastdealtime = lastdealtime;
    }

    public Date getLastregistertime() {
        return lastregistertime;
    }

    public void setLastregistertime(Date lastregistertime) {
        this.lastregistertime = lastregistertime;
    }

    public BigDecimal getLastbuildingavgprice() {
        return lastbuildingavgprice;
    }

    public void setLastbuildingavgprice(BigDecimal lastbuildingavgprice) {
        this.lastbuildingavgprice = lastbuildingavgprice;
    }

    public Integer getLastholddays() {
        return lastholddays;
    }

    public void setLastholddays(Integer lastholddays) {
        this.lastholddays = lastholddays;
    }

    public BigDecimal getProfit() {
        return profit;
    }

    public void setProfit(BigDecimal profit) {
        this.profit = profit;
    }

    public BigDecimal getProfitpercent() {
        return profitpercent;
    }

    public void setProfitpercent(BigDecimal profitpercent) {
        this.profitpercent = profitpercent;
    }

    public BigDecimal getProfitpercentyear() {
        return profitpercentyear;
    }

    public void setProfitpercentyear(BigDecimal profitpercentyear) {
        this.profitpercentyear = profitpercentyear;
    }

    public Boolean getIsdelete() {
        return isdelete;
    }

    public void setIsdelete(Boolean isdelete) {
        this.isdelete = isdelete;
    }
}