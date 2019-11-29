package com.jeyoo.resultpojo;

import lombok.Data;
import org.apache.ibatis.annotations.Select;

import com.jeyoo.pojo.*;

import java.math.BigDecimal;
import java.util.List;

@Data
public class PropertyReleaseResult extends Property{

	private Integer userid;
	
	private String introduceCN;

	private List<Agent> user;
	
	private String introduceEN;
	
	private String telphone;

	private String buildingname;
	
	private String upOrDown;//頁面用的顯示狀態

	private List<String> proimg;

	private List<String> labelimg;

	private String regionname;

	private String category;

	private List<String>  subcategory;

	private PropertySimilar similar;
	
	/*private Boolean isHide;
	
	private String estateName;
	
	private Integer rentalType;
	
	private Integer propertySource;
	
	private Integer propertyStatus;
	
	private Date createTime;
	
	private Date updateTime;*/
	
}