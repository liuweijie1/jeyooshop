package com.house730.admin.pojo;

import java.util.Date;

public class UserSeedDealLog {
    private Integer logid;

    private Long userid;

    private String dealcode;

    private Date seetime;

    public UserSeedDealLog(Integer logid, Long userid, String dealcode, Date seetime) {
        this.logid = logid;
        this.userid = userid;
        this.dealcode = dealcode;
        this.seetime = seetime;
    }

    public UserSeedDealLog() {
        super();
    }

    public Integer getLogid() {
        return logid;
    }

    public void setLogid(Integer logid) {
        this.logid = logid;
    }

    public Long getUserid() {
        return userid;
    }

    public void setUserid(Long userid) {
        this.userid = userid;
    }

    public String getDealcode() {
        return dealcode;
    }

    public void setDealcode(String dealcode) {
        this.dealcode = dealcode == null ? null : dealcode.trim();
    }

    public Date getSeetime() {
        return seetime;
    }

    public void setSeetime(Date seetime) {
        this.seetime = seetime;
    }
}