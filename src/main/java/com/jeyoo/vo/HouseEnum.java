package com.jeyoo.vo;

import lombok.Getter;

@Getter
public enum HouseEnum {
	DISABLE("Disable", "查封賬號"),
    NORMAL("Normal", "解封賬號"),
    SESSIONNAME("admin", "session名称"),
    COOKIENAME("HouseAdmin", "驗證cookie"),
	SUCCESS("msg","success"),
    VERIFYCODE("verifycode", "驗證碼"),
    USERNAME("username","用戶名"),
    PASSWORD("password", "密碼"),
	ERROR("msg","error"),
    SUPERACCOUNT("hseadmin","超级管理员"),
	SALT("ADMiNHoUSE","盐值");


	private String name;
    private String value;

    HouseEnum(String name, String value) {
        this.name = name;
        this.value = value;
    }
}
