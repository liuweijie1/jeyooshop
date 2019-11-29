package com.jeyoo.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class PropertyRecommondScore {
    private Long propertyID;

    private Integer score;

    private Date expireTime;

    private Date createTime;

    private Date updateTime;

    private Boolean isDelete;
}
