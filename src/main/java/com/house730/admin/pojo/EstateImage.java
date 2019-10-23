package com.house730.admin.pojo;

import java.util.Date;

public class EstateImage {
    private Long imageid;

    private Long estateid;

    private Long buildingid;

    private Integer imagetype;

    private Integer imagesubtype;

    private String imagetitle;

    private String imagetitleen;

    private String imagedesc;

    private String imagedescen;

    private String imagepath;

    private Boolean isdefault;

    private Integer sequence;

    private String createuser;

    private Date createtime;

    private String updateuser;

    private Date updatetime;

    private Boolean isdelete;

    public EstateImage(Long imageid, Long estateid, Long buildingid, Integer imagetype, Integer imagesubtype, String imagetitle, String imagetitleen, String imagedesc, String imagedescen, String imagepath, Boolean isdefault, Integer sequence, String createuser, Date createtime, String updateuser, Date updatetime, Boolean isdelete) {
        this.imageid = imageid;
        this.estateid = estateid;
        this.buildingid = buildingid;
        this.imagetype = imagetype;
        this.imagesubtype = imagesubtype;
        this.imagetitle = imagetitle;
        this.imagetitleen = imagetitleen;
        this.imagedesc = imagedesc;
        this.imagedescen = imagedescen;
        this.imagepath = imagepath;
        this.isdefault = isdefault;
        this.sequence = sequence;
        this.createuser = createuser;
        this.createtime = createtime;
        this.updateuser = updateuser;
        this.updatetime = updatetime;
        this.isdelete = isdelete;
    }

    public EstateImage() {
        super();
    }

    public Long getImageid() {
        return imageid;
    }

    public void setImageid(Long imageid) {
        this.imageid = imageid;
    }

    public Long getEstateid() {
        return estateid;
    }

    public void setEstateid(Long estateid) {
        this.estateid = estateid;
    }

    public Long getBuildingid() {
        return buildingid;
    }

    public void setBuildingid(Long buildingid) {
        this.buildingid = buildingid;
    }

    public Integer getImagetype() {
        return imagetype;
    }

    public void setImagetype(Integer imagetype) {
        this.imagetype = imagetype;
    }

    public Integer getImagesubtype() {
        return imagesubtype;
    }

    public void setImagesubtype(Integer imagesubtype) {
        this.imagesubtype = imagesubtype;
    }

    public String getImagetitle() {
        return imagetitle;
    }

    public void setImagetitle(String imagetitle) {
        this.imagetitle = imagetitle == null ? null : imagetitle.trim();
    }

    public String getImagetitleen() {
        return imagetitleen;
    }

    public void setImagetitleen(String imagetitleen) {
        this.imagetitleen = imagetitleen == null ? null : imagetitleen.trim();
    }

    public String getImagedesc() {
        return imagedesc;
    }

    public void setImagedesc(String imagedesc) {
        this.imagedesc = imagedesc == null ? null : imagedesc.trim();
    }

    public String getImagedescen() {
        return imagedescen;
    }

    public void setImagedescen(String imagedescen) {
        this.imagedescen = imagedescen == null ? null : imagedescen.trim();
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