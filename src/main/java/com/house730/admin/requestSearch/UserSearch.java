package com.house730.admin.requestSearch;

import lombok.Data;

import java.util.Date;

@Data
public class UserSearch {
    private String userCode;
    private String source;
    private Boolean ispropertyagent;
//    註冊方式   730  一期不做

    //账号状态
    private String status;
    //会员资料审核状态
    private String approvalStatus;
    private Date startTime;
    private Date endTime;
    


}
