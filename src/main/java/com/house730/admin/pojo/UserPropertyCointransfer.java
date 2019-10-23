package com.house730.admin.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class UserPropertyCointransfer {
    private Integer transferid;

    private Integer transferaccountid;

    private Integer transferpropertycoin;

    private Integer receiveaccountid;

    private Integer receivepropertycoin;

    private Date createtime;



}
