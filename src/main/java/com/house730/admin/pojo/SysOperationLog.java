package com.house730.admin.pojo;

import java.util.Date;

public class SysOperationLog {
    private Long operationid;

    private String operationmodule;

    private String operationtype;

    private String content;

    private String createuser;

    private Date createtime;

    public SysOperationLog(Long operationid, String operationmodule, String operationtype, String content, String createuser, Date createtime) {
        this.operationid = operationid;
        this.operationmodule = operationmodule;
        this.operationtype = operationtype;
        this.content = content;
        this.createuser = createuser;
        this.createtime = createtime;
    }

    public SysOperationLog() {
        super();
    }

    public Long getOperationid() {
        return operationid;
    }

    public void setOperationid(Long operationid) {
        this.operationid = operationid;
    }

    public String getOperationmodule() {
        return operationmodule;
    }

    public void setOperationmodule(String operationmodule) {
        this.operationmodule = operationmodule == null ? null : operationmodule.trim();
    }

    public String getOperationtype() {
        return operationtype;
    }

    public void setOperationtype(String operationtype) {
        this.operationtype = operationtype == null ? null : operationtype.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
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
}