package com.house730.admin.pojo;

import lombok.Data;

import java.math.BigDecimal;
@Data
public class PropertySimilar {
    private Long propertyid;

    private BigDecimal saleprice;

    private BigDecimal rentprice;

    private BigDecimal buildingarea;

    private BigDecimal saleablearea;

    private BigDecimal buildingavgprice;

    private BigDecimal saleableavgprice;

    private String unitremark;

    private Integer sequence;


}