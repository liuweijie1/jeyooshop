package com.jeyoo.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class UserOptionInfo {
    private Integer id;
    private Integer userID;
    private String operationItem;
    private String content;
    private String createUser;
    private Date createTime;
    private Boolean isDelete;

}
