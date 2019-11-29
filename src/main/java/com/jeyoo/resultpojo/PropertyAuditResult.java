package com.jeyoo.resultpojo;

import lombok.Data;

import java.util.Date;

@Data
public class PropertyAuditResult {

    private Long propertyid;

    private String estatename;

    private Integer rentaltype;

    private Integer propertysource;

    private Boolean isverifylabel;

    private Integer approvalstatus;

    private Date publictime;

}
