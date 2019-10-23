package com.house730.admin.pojo;

public class PropertySubcategory {
    private Long propertyid;

    private Integer subcategory;

    public PropertySubcategory(Long propertyid, Integer subcategory) {
        this.propertyid = propertyid;
        this.subcategory = subcategory;
    }

    public PropertySubcategory() {
        super();
    }

    public Long getPropertyid() {
        return propertyid;
    }

    public void setPropertyid(Long propertyid) {
        this.propertyid = propertyid;
    }

    public Integer getSubcategory() {
        return subcategory;
    }

    public void setSubcategory(Integer subcategory) {
        this.subcategory = subcategory;
    }
}