package com.jeyoo.pojo;

import java.util.Date;

public class UserLeaveMessage {
    private Long messageid;

    private String sourcetype;

    private String item;

    private Long sourceid;

    private Integer userid;

    private String contactname;

    private String contactway;

    private String usertype;

    private String leavemessage;

    private String replymessage;

    private String status;

    private String source;
    private String createuser;

    private Date createtime;

    private String updateuser;

    private Date updatetime;

    private Boolean isdelete;

    public UserLeaveMessage(Long messageid, String source, String sourcetype, String item, Long sourceid, Integer userid, String contactname, String contactway, String usertype, String leavemessage, String replymessage, String status, String createuser, Date createtime, String updateuser, Date updatetime, Boolean isdelete) {
        this.messageid = messageid;
        this.sourcetype = sourcetype;
        this.item = item;
        this.source = source;
        this.sourceid = sourceid;
        this.userid = userid;
        this.contactname = contactname;
        this.contactway = contactway;
        this.usertype = usertype;
        this.leavemessage = leavemessage;
        this.replymessage = replymessage;
        this.status = status;
        this.createuser = createuser;
        this.createtime = createtime;
        this.updateuser = updateuser;
        this.updatetime = updatetime;
        this.isdelete = isdelete;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getSource() {
        return source;
    }

    public UserLeaveMessage() {
        super();
    }

    public Long getMessageid() {
        return messageid;
    }

    public void setMessageid(Long messageid) {
        this.messageid = messageid;
    }

    public String getSourcetype() {
        return sourcetype;
    }

    public void setSourcetype(String sourcetype) {
        this.sourcetype = sourcetype == null ? null : sourcetype.trim();
    }

    public String getItem() {
        return item;
    }

    public void setItem(String item) {
        this.item = item == null ? null : item.trim();
    }

    public Long getSourceid() {
        return sourceid;
    }

    public void setSourceid(Long sourceid) {
        this.sourceid = sourceid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getContactname() {
        return contactname;
    }

    public void setContactname(String contactname) {
        this.contactname = contactname == null ? null : contactname.trim();
    }

    public String getContactway() {
        return contactway;
    }

    public void setContactway(String contactway) {
        this.contactway = contactway == null ? null : contactway.trim();
    }

    public String getUsertype() {
        return usertype;
    }

    public void setUsertype(String usertype) {
        this.usertype = usertype == null ? null : usertype.trim();
    }

    public String getLeavemessage() {
        return leavemessage;
    }

    public void setLeavemessage(String leavemessage) {
        this.leavemessage = leavemessage == null ? null : leavemessage.trim();
    }

    public String getReplymessage() {
        return replymessage;
    }

    public void setReplymessage(String replymessage) {
        this.replymessage = replymessage == null ? null : replymessage.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
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