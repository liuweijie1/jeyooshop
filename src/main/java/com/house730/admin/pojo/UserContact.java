package com.house730.admin.pojo;

import java.util.Date;

public class UserContact {
    private Integer contactid;

    private String contactperson;

    private String email;

    private String phone;

    private Integer helptopic;

    private String title;

    private String content;

    private Integer status;

    private String createuser;

    private Date createtime;

    private String updateuser;

    private Date updatetime;

    private Boolean isdelete;
    
    private String helptopicText;//用于前台顯示
    
    public UserContact(Integer contactid, String contactperson, String email, String phone, Integer helptopic, String title, String content, Integer status, String createuser, Date createtime, String updateuser, Date updatetime, Boolean isdelete) {
        this.contactid = contactid;
        this.contactperson = contactperson;
        this.email = email;
        this.phone = phone;
        this.helptopic = helptopic;
        this.title = title;
        this.content = content;
        this.status = status;
        this.createuser = createuser;
        this.createtime = createtime;
        this.updateuser = updateuser;
        this.updatetime = updatetime;
        this.isdelete = isdelete;
    }
    public String getHelptopicText() {
		if (helptopic==1) {
			helptopicText = "付款";
		} else if (helptopic==2) {
			helptopicText = "退款";
		} else if (helptopic==3) {
			helptopicText = "其他";
		}
		return helptopicText;
	}

    public UserContact() {
        super();
    }

    public Integer getContactid() {
        return contactid;
    }

    public void setContactid(Integer contactid) {
        this.contactid = contactid;
    }

    public String getContactperson() {
        return contactperson;
    }

    public void setContactperson(String contactperson) {
        this.contactperson = contactperson == null ? null : contactperson.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public Integer getHelptopic() {
        return helptopic;
    }

    public void setHelptopic(Integer helptopic) {
        this.helptopic = helptopic;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
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