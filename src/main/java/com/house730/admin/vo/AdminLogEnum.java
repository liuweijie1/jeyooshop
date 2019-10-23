package com.house730.admin.vo;

import lombok.Getter;

@Getter
public enum AdminLogEnum {
    INSERT("插入操作"),
    DELETE("删除操作"),
    UPDATE("修改操作"),
    SELECT("查询操作"),

    MESSAGE("留言反馈管理模块"),
    USER("会员管理模块"),
    TRADE("交易管理模块"),
    PROPERTY("放盘管理模块"),
    CONTACT("联络我们管理模块"),
    REPORT("检举管理模块"),
    INFORMATION("资讯管理模块");
    private String log;
    AdminLogEnum(String log) {
          this.log=log;
    }
}
