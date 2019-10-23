package com.house730.admin.pojo;

import java.math.BigDecimal;

public class DealGscopedealhistory {
    private Integer id;

    private String gscopecode;

    private Integer year;

    private Integer month;

    private Integer dealnumber;

    private BigDecimal dealtotalprice;

    private BigDecimal rise;

    private Integer level;

    private BigDecimal buildingavgprice;

    private BigDecimal saleableavgprice;

    public DealGscopedealhistory(Integer id, String gscopecode, Integer year, Integer month, Integer dealnumber, BigDecimal dealtotalprice, BigDecimal rise, Integer level, BigDecimal buildingavgprice, BigDecimal saleableavgprice) {
        this.id = id;
        this.gscopecode = gscopecode;
        this.year = year;
        this.month = month;
        this.dealnumber = dealnumber;
        this.dealtotalprice = dealtotalprice;
        this.rise = rise;
        this.level = level;
        this.buildingavgprice = buildingavgprice;
        this.saleableavgprice = saleableavgprice;
    }

    public DealGscopedealhistory() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getGscopecode() {
        return gscopecode;
    }

    public void setGscopecode(String gscopecode) {
        this.gscopecode = gscopecode == null ? null : gscopecode.trim();
    }

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }

    public Integer getMonth() {
        return month;
    }

    public void setMonth(Integer month) {
        this.month = month;
    }

    public Integer getDealnumber() {
        return dealnumber;
    }

    public void setDealnumber(Integer dealnumber) {
        this.dealnumber = dealnumber;
    }

    public BigDecimal getDealtotalprice() {
        return dealtotalprice;
    }

    public void setDealtotalprice(BigDecimal dealtotalprice) {
        this.dealtotalprice = dealtotalprice;
    }

    public BigDecimal getRise() {
        return rise;
    }

    public void setRise(BigDecimal rise) {
        this.rise = rise;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
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
}