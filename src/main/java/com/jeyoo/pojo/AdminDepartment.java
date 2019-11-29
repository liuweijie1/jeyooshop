package com.jeyoo.pojo;

import java.util.Date;

public class AdminDepartment {
    private Integer departmentid;

    private String departmentname;

    private Integer parentdepartmentid;

    private String remarks;

    private String status;

    private String createuser;

    private Date createtime;

    private String updateuser;

    private Date updatetime;

    private Boolean isdelete;

    public AdminDepartment(Integer departmentid, String departmentname, Integer parentdepartmentid, String remarks, String status, String createuser, Date createtime, String updateuser, Date updatetime, Boolean isdelete) {
        this.departmentid = departmentid;
        this.departmentname = departmentname;
        this.parentdepartmentid = parentdepartmentid;
        this.remarks = remarks;
        this.status = status;
        this.createuser = createuser;
        this.createtime = createtime;
        this.updateuser = updateuser;
        this.updatetime = updatetime;
        this.isdelete = isdelete;
    }

    public AdminDepartment() {
        super();
    }

    public Integer getDepartmentid() {
        return departmentid;
    }

    public void setDepartmentid(Integer departmentid) {
        this.departmentid = departmentid;
    }

    public String getDepartmentname() {
        return departmentname;
    }

    public void setDepartmentname(String departmentname) {
        this.departmentname = departmentname == null ? null : departmentname.trim();
    }

    public Integer getParentdepartmentid() {
        return parentdepartmentid;
    }

    public void setParentdepartmentid(Integer parentdepartmentid) {
        this.parentdepartmentid = parentdepartmentid;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
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