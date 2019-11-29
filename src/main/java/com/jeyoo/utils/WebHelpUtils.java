package com.jeyoo.utils;



import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.math.RoundingMode;

public class WebHelpUtils {
	
	static double DEF_PI = 3.14159265359; // PI
    static double DEF_2PI = 6.28318530712; // 2*PI
	static double DEF_PI180 = 0.01745329252; // PI/180.0
    static double DEF_R = 6370693.5; // radius of earth
    
    
    
    
    public static String getShowDbappName(String value) {
    	String returnDbappName = "";
    	switch(value.toLowerCase()) {
	    	case "cces":
	    		returnDbappName = "CCES";
	    		break;
	    	case "fang":
	    		returnDbappName = "房天下";
	    		break;
	    	default:
			    break;
	    	}
    	return returnDbappName;
    }
	
	/**
	 * 得到显示的中文名称--模块页面
	 * @param value
	 */
	public static String getShowCnName(String value) {
		String returnValue = ""; 
		switch (value.toLowerCase()) {
			case "index":
			case "home":
				returnValue = "首页";
				break;
			case "ershoufang":
				returnValue = "二手房";
			    break;
			
			case "zufang":
				returnValue = "租房";
			    break;
			
			case "xiaoqu":
				returnValue = "小区";
			    break;
			
			case "bigdata":
				returnValue = "中原大数据(成交页面)";
			    break;
			case "newprop":
				returnValue = "新房";
			    break;
			 default:
			    break;
		}
		return returnValue;
	}
	
	
	/**
	 * 得到显示的中文名称--标签词类型
	 * @param id
	 * @return
	 */
	public static String getHomeTagCategaryName(String id) {
		String categaryName = ""; 
		switch (id.toLowerCase()) {
		 case "29":
             categaryName = "热门线路";
             break;
         case "30":
             categaryName = "优质学区";
             break;
         case "31":
             categaryName = "热门区域";
             break;
         case "32":
             categaryName = "特色房源";
             break;
         case "97":
             categaryName = "二手房";
             break;
         case "98":
             categaryName = "租房";
             break;
         case "99":
             categaryName = "新房";
             break;
         case "100":
             categaryName = "新房首页";
             break;
		}
		return categaryName;
		
	}
	
	/**
	 * 得到显示的数字名称--标签词类型
	 * @param id
	 * @return
	 */
	public static String convertHomeTagCategaryName(String id) {
		String categaryName = ""; 
		switch (id.toLowerCase()) {
		 case "热门线路":
             categaryName = "29";
             break;
         case "优质学区":
             categaryName = "30";
             break;
         case "热门区域":
             categaryName = "31";
             break;
         case "特色房源":
             categaryName = "32";
             break;
         case "二手房":
             categaryName = "97";
             break;
         case "租房":
             categaryName = "98";
             break;
         case "新房":
             categaryName = "99";
             break;
         case "新房首页":
             categaryName = "100";
             break;
		}
		return categaryName;
		
	}
	 
	/**
	 * 判断字符串是否为空
	 * @param value
	 * @return
	 */
	public static boolean isNullOrEmpty(String value) {
		if(value ==null || "".equals(value)) {
			return true;
		}
		return false;
	}
	
	/**
	 * 根据应用类型得到应用名称
	 * @param value
	 * @return
	 */
	public static String getAppNameBySourceName(String value) {
		 String returnValue = "";
		 if (WebHelpUtils.isNullOrEmpty(value)) {
			return returnValue;
		 	}
         switch (value)
         {
             case "index":
                 returnValue = "HOME";
                 break;

             case "ershoufang":
                 returnValue = "ESF";
                 break;
             
             case "xinfang":
                 returnValue = "NEWPROP";
                 break;
             case "app":
             case "APP":
             case "APP_ANDROID":
             case "APP_iOS":
                 returnValue = "APP";
                 break;

             case "centanet.com":
             case "ESF":
             case "NewProp":
                 returnValue = "官网";
                 break;

             case "wap":
             case "WAP":
                 returnValue = "WAP";
                 break;
             case "WeChat":
            	 returnValue = "小程序";
            	 break;
             default:
                 break;
         }

         return returnValue;
	 }
	 

	public static double getShortDistance(double lng1,double lat1,double lng2,double lat2) {
		 double ew1,ns1,ew2,ns2=0;
		 double dx,dy,dew =0;
		 double distance = 0;
		 
		 //角度转换为弧度
		 ew1 = lng1 * DEF_PI180;
		 ns1 = lat1 * DEF_PI180;
		 ew2 = lng2 * DEF_PI180;
		 ns2 = lat2 * DEF_PI180;
		 //经度差
		 dew = ew1 - ew2;
		 //若跨东经和西经180度,进行调整
		 if(dew > DEF_PI) {
			 dew = DEF_2PI - dew;
		 }else if(dew < -DEF_PI) {
			 dew = DEF_2PI+dew;
		 }
		 dx	= DEF_R * Math.cos(ns1) * dew;//东西方向长度(在经纬圈上的投影长度)
		 dy = DEF_R * (ns1-ns2);//南北方向长度(在经纬圈上的投影长度)
		 // 沟谷定理求斜边长
		 distance = Math.sqrt(dx * dx + dy * dy);
		return distance;
	 }
	 
	/**
     * 添加cookie
     * 
     * @param response
     * @param name Key
     * @param value Value
     * @param maxAge 有效时间
     */
	public static void addCookie(HttpServletResponse response, String name, String value, int maxAge) {
	        Cookie cookie = new Cookie(name, value);
	        cookie.setHttpOnly(true);
	        cookie.setMaxAge(maxAge);
	        cookie.setDomain(StringResourceUtils.COOKIE_DOMAIN); // cookie作用域
	        response.addCookie(cookie);
	   }
	
	/**
     * 根据Cookie名称得到Cookie对象，不存在该对象则返回Null
     * 
     * @param request
     * @param name
     * @return
     */ 
    public static Cookie getCookie(HttpServletRequest request, String name) {
        Cookie[] cookies = request.getCookies();
        Cookie cookie = null;
        for (Cookie c : cookies) {
            if (name.equals(c.getName())) { 
                cookie = c; 
                break; 
            }else {
            	return null;
            }
        } 
        return cookie; 
    }
	 
    /**
     * 移除cookie
     * @param request
     * @param response
     * @param name 这个是名称，不是值
     */
    public static void removeCookie(HttpServletRequest request,
                                    HttpServletResponse response, String name) {
        if (null == name) { 
            return; 
        } 
        Cookie cookie = getCookie(request, name);
        if(null != cookie){ 
            cookie.setPath("/"); 
            cookie.setValue(""); 
            cookie.setMaxAge(0); 
            response.addCookie(cookie);
        } 
    }
    
    /**
     * 格式化数据
     * @param content
     * @param length
     * @return
     */
    public static String formatContent(Object content, int length) {
        content=content.toString().replace("\n","<br/>");
        if(length==0) {
            length = 50;
        }
		if (content==null) {
			return "";
		}
		String contentStr = content.toString().replace("\r", " ").replace("\n", " ").trim();
		if(contentStr.length()<=length) {
			return "<div class=\"lh14\">"+content+"</div>";
		}
				
		if(length ==100) {
			int addLength = contentStr.length()-100>5 ? 5 : contentStr.length()-100;
			if("<br />".contains(contentStr)) {
				length = length + addLength;
			}
		}
		String showStr = contentStr.substring(0, length);
		String hideStr = "";
		if(contentStr.length()>length) {
			hideStr = contentStr.substring(length);
		}

        return "<div class=\"lh14\">"+showStr+"<span class=\"more\">"+hideStr+"</span><a  class=\"cBlue mL6 js_switch\">详情</a></div>";
    }

    


    // 格式化售价(万)
    public static String formatSellPrice(double money)
    {
        return String.valueOf((money == 0 ? 0 : (int)(money/10000)));
    }
    
    

	public static String formatDouble(double d) {
		String ds = String.valueOf(d);
	    BigDecimal bg = new BigDecimal(ds).setScale(2, RoundingMode.UP);
	    double num = bg.doubleValue();
	    if (Math.round(num) - num == 0) {
	        return String.valueOf((long) num);
	    }
	    return String.valueOf(num);
	}
	//过滤字符串中的一般格式的手机号码例如：17370134036
	public static String filterPhoneNumber(String str ){
		if(str==null||str.equals("")){
			return "";
		}
    	StringBuilder sb=new StringBuilder();
		for (int i = 0; i <11 ; i++) {
			sb.append("*");
		}
		return  str.replaceAll("(\\d{11}|\\d{3}\\-\\d{4}\\-\\d{4})",sb.toString());
	}
    
}	
 