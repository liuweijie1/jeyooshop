package com.house730.admin.pojo;

import java.util.Date;

public class UserOrmUserRole {
    private Integer userid;

    private Integer roleid;

    private Date createtime;

    public UserOrmUserRole(Integer userid, Integer roleid, Date createtime) {
        this.userid = userid;
        this.roleid = roleid;
        this.createtime = createtime;
    }

    public UserOrmUserRole() {
        super();
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getRoleid() {
        return roleid;
    }

    public void setRoleid(Integer roleid) {
        this.roleid = roleid;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }
}