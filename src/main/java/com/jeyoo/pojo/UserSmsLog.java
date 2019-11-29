package com.jeyoo.pojo;

import java.util.Date;

public class UserSmsLog {
    private Long smsid;

    private String sendtype;

    private Long userid;

    private String mobile;

    private String sourcetype;

    private String sendcontent;

    private String remark;

    private Date createtime;

    private Date sendtime;

    private Boolean issuccess;

    public UserSmsLog(Long smsid, String sendtype, Long userid, String mobile, String sourcetype, String sendcontent, String remark, Date createtime, Date sendtime, Boolean issuccess) {
        this.smsid = smsid;
        this.sendtype = sendtype;
        this.userid = userid;
        this.mobile = mobile;
        this.sourcetype = sourcetype;
        this.sendcontent = sendcontent;
        this.remark = remark;
        this.createtime = createtime;
        this.sendtime = sendtime;
        this.issuccess = issuccess;
    }

    public UserSmsLog() {
        super();
    }

    public Long getSmsid() {
        return smsid;
    }

    public void setSmsid(Long smsid) {
        this.smsid = smsid;
    }

    public String getSendtype() {
        return sendtype;
    }

    public void setSendtype(String sendtype) {
        this.sendtype = sendtype == null ? null : sendtype.trim();
    }

    public Long getUserid() {
        return userid;
    }

    public void setUserid(Long userid) {
        this.userid = userid;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    public String getSourcetype() {
        return sourcetype;
    }

    public void setSourcetype(String sourcetype) {
        this.sourcetype = sourcetype == null ? null : sourcetype.trim();
    }

    public String getSendcontent() {
        return sendcontent;
    }

    public void setSendcontent(String sendcontent) {
        this.sendcontent = sendcontent == null ? null : sendcontent.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Date getSendtime() {
        return sendtime;
    }

    public void setSendtime(Date sendtime) {
        this.sendtime = sendtime;
    }

    public Boolean getIssuccess() {
        return issuccess;
    }

    public void setIssuccess(Boolean issuccess) {
        this.issuccess = issuccess;
    }
}