package com.jeyoo.pojo;

import java.util.Date;

public class UserBrowseLog {
    private Long browseid;

    private Integer userid;

    private String userip;

    private String browsevalue;

    private String sourcetype;

    private Date browsetime;

    private String browseurl;

    private String deviceid;

    public UserBrowseLog(Long browseid, Integer userid, String userip, String browsevalue, String sourcetype, Date browsetime, String browseurl, String deviceid) {
        this.browseid = browseid;
        this.userid = userid;
        this.userip = userip;
        this.browsevalue = browsevalue;
        this.sourcetype = sourcetype;
        this.browsetime = browsetime;
        this.browseurl = browseurl;
        this.deviceid = deviceid;
    }

    public UserBrowseLog() {
        super();
    }

    public Long getBrowseid() {
        return browseid;
    }

    public void setBrowseid(Long browseid) {
        this.browseid = browseid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUserip() {
        return userip;
    }

    public void setUserip(String userip) {
        this.userip = userip == null ? null : userip.trim();
    }

    public String getBrowsevalue() {
        return browsevalue;
    }

    public void setBrowsevalue(String browsevalue) {
        this.browsevalue = browsevalue == null ? null : browsevalue.trim();
    }

    public String getSourcetype() {
        return sourcetype;
    }

    public void setSourcetype(String sourcetype) {
        this.sourcetype = sourcetype == null ? null : sourcetype.trim();
    }

    public Date getBrowsetime() {
        return browsetime;
    }

    public void setBrowsetime(Date browsetime) {
        this.browsetime = browsetime;
    }

    public String getBrowseurl() {
        return browseurl;
    }

    public void setBrowseurl(String browseurl) {
        this.browseurl = browseurl == null ? null : browseurl.trim();
    }

    public String getDeviceid() {
        return deviceid;
    }

    public void setDeviceid(String deviceid) {
        this.deviceid = deviceid == null ? null : deviceid.trim();
    }
}