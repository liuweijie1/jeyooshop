package com.jeyoo.pojo;

import java.util.Date;

public class UserCollection {
    private Long collectionid;

    private Integer userid;

    private String sourcetype;

    private Long sourceid;

    private String source;

    private String createuser;

    private Date createtime;

    private String updateuser;

    private Date updatetime;

    private Boolean isdelete;

    public UserCollection(Long collectionid, Integer userid, String sourcetype, Long sourceid, String source, String createuser, Date createtime, String updateuser, Date updatetime, Boolean isdelete) {
        this.collectionid = collectionid;
        this.userid = userid;
        this.sourcetype = sourcetype;
        this.sourceid = sourceid;
        this.source = source;
        this.createuser = createuser;
        this.createtime = createtime;
        this.updateuser = updateuser;
        this.updatetime = updatetime;
        this.isdelete = isdelete;
    }

    public UserCollection() {
        super();
    }

    public Long getCollectionid() {
        return collectionid;
    }

    public void setCollectionid(Long collectionid) {
        this.collectionid = collectionid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getSourcetype() {
        return sourcetype;
    }

    public void setSourcetype(String sourcetype) {
        this.sourcetype = sourcetype == null ? null : sourcetype.trim();
    }

    public Long getSourceid() {
        return sourceid;
    }

    public void setSourceid(Long sourceid) {
        this.sourceid = sourceid;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source == null ? null : source.trim();
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