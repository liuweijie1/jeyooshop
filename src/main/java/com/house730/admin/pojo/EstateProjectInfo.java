package com.house730.admin.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class EstateProjectInfo {
    private Long estateid;

    private String decorationsituation;

    private String architecturalstyle;

    private Date openingdate;

    private String unitareainterval;

    private String floorheight;

    private String floorcondition;

    private Integer floornumber;

    private BigDecimal area;

    private BigDecimal minarea;

    private BigDecimal maxarea;

    private BigDecimal totalpricehk;

    private BigDecimal mintotalpricehk;

    private BigDecimal maxtotalpricehk;

    private BigDecimal totalpriceus;

    private BigDecimal mintotalpriceus;

    private BigDecimal maxtotalpriceus;

    private String web;

    private String telephone;

    private String fax;

    private Integer dealnumber;

    private Integer pricenumber;

    public EstateProjectInfo(Long estateid, String decorationsituation, String architecturalstyle, Date openingdate, String unitareainterval, String floorheight, String floorcondition, Integer floornumber, BigDecimal area, BigDecimal minarea, BigDecimal maxarea, BigDecimal totalpricehk, BigDecimal mintotalpricehk, BigDecimal maxtotalpricehk, BigDecimal totalpriceus, BigDecimal mintotalpriceus, BigDecimal maxtotalpriceus, String web, String telephone, String fax, Integer dealnumber, Integer pricenumber) {
        this.estateid = estateid;
        this.decorationsituation = decorationsituation;
        this.architecturalstyle = architecturalstyle;
        this.openingdate = openingdate;
        this.unitareainterval = unitareainterval;
        this.floorheight = floorheight;
        this.floorcondition = floorcondition;
        this.floornumber = floornumber;
        this.area = area;
        this.minarea = minarea;
        this.maxarea = maxarea;
        this.totalpricehk = totalpricehk;
        this.mintotalpricehk = mintotalpricehk;
        this.maxtotalpricehk = maxtotalpricehk;
        this.totalpriceus = totalpriceus;
        this.mintotalpriceus = mintotalpriceus;
        this.maxtotalpriceus = maxtotalpriceus;
        this.web = web;
        this.telephone = telephone;
        this.fax = fax;
        this.dealnumber = dealnumber;
        this.pricenumber = pricenumber;
    }

    public EstateProjectInfo() {
        super();
    }

    public Long getEstateid() {
        return estateid;
    }

    public void setEstateid(Long estateid) {
        this.estateid = estateid;
    }

    public String getDecorationsituation() {
        return decorationsituation;
    }

    public void setDecorationsituation(String decorationsituation) {
        this.decorationsituation = decorationsituation == null ? null : decorationsituation.trim();
    }

    public String getArchitecturalstyle() {
        return architecturalstyle;
    }

    public void setArchitecturalstyle(String architecturalstyle) {
        this.architecturalstyle = architecturalstyle == null ? null : architecturalstyle.trim();
    }

    public Date getOpeningdate() {
        return openingdate;
    }

    public void setOpeningdate(Date openingdate) {
        this.openingdate = openingdate;
    }

    public String getUnitareainterval() {
        return unitareainterval;
    }

    public void setUnitareainterval(String unitareainterval) {
        this.unitareainterval = unitareainterval == null ? null : unitareainterval.trim();
    }

    public String getFloorheight() {
        return floorheight;
    }

    public void setFloorheight(String floorheight) {
        this.floorheight = floorheight == null ? null : floorheight.trim();
    }

    public String getFloorcondition() {
        return floorcondition;
    }

    public void setFloorcondition(String floorcondition) {
        this.floorcondition = floorcondition == null ? null : floorcondition.trim();
    }

    public Integer getFloornumber() {
        return floornumber;
    }

    public void setFloornumber(Integer floornumber) {
        this.floornumber = floornumber;
    }

    public BigDecimal getArea() {
        return area;
    }

    public void setArea(BigDecimal area) {
        this.area = area;
    }

    public BigDecimal getMinarea() {
        return minarea;
    }

    public void setMinarea(BigDecimal minarea) {
        this.minarea = minarea;
    }

    public BigDecimal getMaxarea() {
        return maxarea;
    }

    public void setMaxarea(BigDecimal maxarea) {
        this.maxarea = maxarea;
    }

    public BigDecimal getTotalpricehk() {
        return totalpricehk;
    }

    public void setTotalpricehk(BigDecimal totalpricehk) {
        this.totalpricehk = totalpricehk;
    }

    public BigDecimal getMintotalpricehk() {
        return mintotalpricehk;
    }

    public void setMintotalpricehk(BigDecimal mintotalpricehk) {
        this.mintotalpricehk = mintotalpricehk;
    }

    public BigDecimal getMaxtotalpricehk() {
        return maxtotalpricehk;
    }

    public void setMaxtotalpricehk(BigDecimal maxtotalpricehk) {
        this.maxtotalpricehk = maxtotalpricehk;
    }

    public BigDecimal getTotalpriceus() {
        return totalpriceus;
    }

    public void setTotalpriceus(BigDecimal totalpriceus) {
        this.totalpriceus = totalpriceus;
    }

    public BigDecimal getMintotalpriceus() {
        return mintotalpriceus;
    }

    public void setMintotalpriceus(BigDecimal mintotalpriceus) {
        this.mintotalpriceus = mintotalpriceus;
    }

    public BigDecimal getMaxtotalpriceus() {
        return maxtotalpriceus;
    }

    public void setMaxtotalpriceus(BigDecimal maxtotalpriceus) {
        this.maxtotalpriceus = maxtotalpriceus;
    }

    public String getWeb() {
        return web;
    }

    public void setWeb(String web) {
        this.web = web == null ? null : web.trim();
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

    public Integer getDealnumber() {
        return dealnumber;
    }

    public void setDealnumber(Integer dealnumber) {
        this.dealnumber = dealnumber;
    }

    public Integer getPricenumber() {
        return pricenumber;
    }

    public void setPricenumber(Integer pricenumber) {
        this.pricenumber = pricenumber;
    }
}