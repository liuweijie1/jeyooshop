package com.house730.admin.pojo;

import java.math.BigDecimal;
import java.util.Date;

import lombok.Data;

@Data
public class UserOrderRecord {
    private Long orderid;//交易编号

    private Integer userid;//会员ID

    private String item;//交易事項

    private Integer propertycoin;//屋幣量

    private BigDecimal money;//價錢

    private Integer orderstatus;//付款状态 0：未支付   1：已支付

    private Integer paymenttype;//支付方式  0:信用卡  1：銀行轉賬

    private Integer propertycoinsetid;//屋幣配置id

    private Long sourceid;//使用源ID

    private Date createtime;

    private String ordercode;//支付后paypal返回的一个字段

    private Date updatetime;

    private Boolean isdelete;//是否刪除  0：未刪除  1：已刪除

    private Boolean isUploadEvidence;//是否上传凭证 0：未上傳 1：已上傳
    
    private String sourcetype;//使用源类型

    private Integer accountid;
}