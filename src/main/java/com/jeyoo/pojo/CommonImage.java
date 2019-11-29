package com.jeyoo.pojo;

import java.util.Date;

public class CommonImage {
    private Long imageid;

    private Long sourceid;

    private String source;

    private String imagepath;

    private Boolean isdefault;

    private Integer sequence;

    private String createuser;

    private Date createtime;

    private String updateuser;

    private Date updatetime;

    private Boolean isdelete;

    public CommonImage(Long imageid, Long sourceid, String source, String imagepath, Boolean isdefault, Integer sequence, String createuser, Date createtime, String updateuser, Date updatetime, Boolean isdelete) {
        this.imageid = imageid;
        this.sourceid = sourceid;
        this.source = source;
        this.imagepath = imagepath;
        this.isdefault = isdefault;
        this.sequence = sequence;
        this.createuser = createuser;
        this.createtime = createtime;
        this.updateuser = updateuser;
        this.updatetime = updatetime;
        this.isdelete = isdelete;
    }

    public CommonImage() {
        super();
    }

    public Long getImageid() {
        return imageid;
    }

    public void setImageid(Long imageid) {
        this.imageid = imageid;
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

    public String getImagepath() {
        return imagepath;
    }

    public void setImagepath(String imagepath) {
        this.imagepath = imagepath == null ? null : imagepath.trim();
    }

    public Boolean getIsdefault() {
        return isdefault;
    }

    public void setIsdefault(Boolean isdefault) {
        this.isdefault = isdefault;
    }

    public Integer getSequence() {
        return sequence;
    }

    public void setSequence(Integer sequence) {
        this.sequence = sequence;
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