package com.jeyoo.pojo;

public class GeoGscope {
    private Integer id;

    private String regioncode;

    private String gscopecode;

    private String regionname;

    private String regionnameen;

    private String zonename;

    private String zonenameen;

    private String gscopename;

    private String gscopenameen;

    private Float longitudes;

    private Float latitudes;

    private Integer sequence;

    private Boolean isshow;

    private Boolean isdelete;

    public GeoGscope(Integer id, String regioncode, String gscopecode, String regionname, String regionnameen, String zonename, String zonenameen, String gscopename, String gscopenameen, Float longitudes, Float latitudes, Integer sequence, Boolean isshow, Boolean isdelete) {
        this.id = id;
        this.regioncode = regioncode;
        this.gscopecode = gscopecode;
        this.regionname = regionname;
        this.regionnameen = regionnameen;
        this.zonename = zonename;
        this.zonenameen = zonenameen;
        this.gscopename = gscopename;
        this.gscopenameen = gscopenameen;
        this.longitudes = longitudes;
        this.latitudes = latitudes;
        this.sequence = sequence;
        this.isshow = isshow;
        this.isdelete = isdelete;
    }

    public GeoGscope() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRegioncode() {
        return regioncode;
    }

    public void setRegioncode(String regioncode) {
        this.regioncode = regioncode == null ? null : regioncode.trim();
    }

    public String getGscopecode() {
        return gscopecode;
    }

    public void setGscopecode(String gscopecode) {
        this.gscopecode = gscopecode == null ? null : gscopecode.trim();
    }

    public String getRegionname() {
        return regionname;
    }

    public void setRegionname(String regionname) {
        this.regionname = regionname == null ? null : regionname.trim();
    }

    public String getRegionnameen() {
        return regionnameen;
    }

    public void setRegionnameen(String regionnameen) {
        this.regionnameen = regionnameen == null ? null : regionnameen.trim();
    }

    public String getZonename() {
        return zonename;
    }

    public void setZonename(String zonename) {
        this.zonename = zonename == null ? null : zonename.trim();
    }

    public String getZonenameen() {
        return zonenameen;
    }

    public void setZonenameen(String zonenameen) {
        this.zonenameen = zonenameen == null ? null : zonenameen.trim();
    }

    public String getGscopename() {
        return gscopename;
    }

    public void setGscopename(String gscopename) {
        this.gscopename = gscopename == null ? null : gscopename.trim();
    }

    public String getGscopenameen() {
        return gscopenameen;
    }

    public void setGscopenameen(String gscopenameen) {
        this.gscopenameen = gscopenameen == null ? null : gscopenameen.trim();
    }

    public Float getLongitudes() {
        return longitudes;
    }

    public void setLongitudes(Float longitudes) {
        this.longitudes = longitudes;
    }

    public Float getLatitudes() {
        return latitudes;
    }

    public void setLatitudes(Float latitudes) {
        this.latitudes = latitudes;
    }

    public Integer getSequence() {
        return sequence;
    }

    public void setSequence(Integer sequence) {
        this.sequence = sequence;
    }

    public Boolean getIsshow() {
        return isshow;
    }

    public void setIsshow(Boolean isshow) {
        this.isshow = isshow;
    }

    public Boolean getIsdelete() {
        return isdelete;
    }

    public void setIsdelete(Boolean isdelete) {
        this.isdelete = isdelete;
    }
}