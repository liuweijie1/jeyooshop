package com.jeyoo.requestSearch;

import lombok.Data;

import java.util.Date;

@Data
public class LeaveMessageSearch {
    private String usercode;
    private String source;
    private Date startTime;
    private Date endTime;
}
