package com.jeyoo.pojo;

import java.util.Date;

public class UserContactattachment {
    private Integer id;

    private Integer contactid;

    private String attachmentpath;

    private Date createtime;

    private Boolean isdelete;

    public UserContactattachment(Integer id, Integer contactid, String attachmentpath, Date createtime, Boolean isdelete) {
        this.id = id;
        this.contactid = contactid;
        this.attachmentpath = attachmentpath;
        this.createtime = createtime;
        this.isdelete = isdelete;
    }

    public UserContactattachment() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getContactid() {
        return contactid;
    }

    public void setContactid(Integer contactid) {
        this.contactid = contactid;
    }

    public String getAttachmentpath() {
        return attachmentpath;
    }

    public void setAttachmentpath(String attachmentpath) {
        this.attachmentpath = attachmentpath == null ? null : attachmentpath.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Boolean getIsdelete() {
        return isdelete;
    }

    public void setIsdelete(Boolean isdelete) {
        this.isdelete = isdelete;
    }
}