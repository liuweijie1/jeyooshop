package com.jeyoo.pojo;

public class PropertyLable {
    private Long propertyid;

    private Integer lable;

    private Integer labletype;

    public PropertyLable(Long propertyid, Integer lable, Integer labletype) {
        this.propertyid = propertyid;
        this.lable = lable;
        this.labletype = labletype;
    }

    public PropertyLable() {
        super();
    }

    public Long getPropertyid() {
        return propertyid;
    }

    public void setPropertyid(Long propertyid) {
        this.propertyid = propertyid;
    }

    public Integer getLable() {
        return lable;
    }

    public void setLable(Integer lable) {
        this.lable = lable;
    }

    public Integer getLabletype() {
        return labletype;
    }

    public void setLabletype(Integer labletype) {
        this.labletype = labletype;
    }
}