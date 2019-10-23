package com.house730.admin.vo;

import lombok.Getter;

@Getter
public enum HouseEnum {
    Disable("Disable", "查封賬號"),
    Normal("Normal", "解封賬號");
    private String status;
    private String detail;

    HouseEnum(String status, String detail) {
        this.status = status;
        this.detail = detail;
    }
}
