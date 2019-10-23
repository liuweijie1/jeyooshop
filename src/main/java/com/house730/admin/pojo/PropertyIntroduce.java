package com.house730.admin.pojo;

public class PropertyIntroduce {
    private Long propertyid;

    private String introducecn;

    private String introduceen;

    public PropertyIntroduce(Long propertyid, String introducecn, String introduceen) {
        this.propertyid = propertyid;
        this.introducecn = introducecn;
        this.introduceen = introduceen;
    }

    public PropertyIntroduce() {
        super();
    }

    public Long getPropertyid() {
        return propertyid;
    }

    public void setPropertyid(Long propertyid) {
        this.propertyid = propertyid;
    }

    public String getIntroducecn() {
        return introducecn;
    }

    public void setIntroducecn(String introducecn) {
        this.introducecn = introducecn == null ? null : introducecn.trim();
    }

    public String getIntroduceen() {
        return introduceen;
    }

    public void setIntroduceen(String introduceen) {
        this.introduceen = introduceen == null ? null : introduceen.trim();
    }
}