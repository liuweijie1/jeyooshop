package com.house730.admin.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 公共字符类
 */
public class StringResourceUtils {
	
	
		/**
		 * search
		 */
	   public static final String SEARCH="search";
	   
	   /**
	    * roleType
	    */
	   public static final String ROLETYPE="roleType";
	   
	   /**
	    * domaiName
	    */
	   public static final String DOMAINNAME = "domainName";
	   
	   /**
	    * model
	    */
	   public static final String MODEL = "model";
	   
	   /**
	    * NewpropImage
	    */
	   public static final String NEWPROPIMAGE="NewpropImage";
	   
	   /**
	    * starttime
	    */
	   public static final String STARTTIME = "startTime";
	   
	   /**
	    * endtime
	    */
	   public static final String ENDTIME = "endTime";
	   
	   /**
	    * status
	    */
	   public static final String STATUS = "Status";
		
	   /**
	    * isOnline
	    */
	   public static final String ISONLINE = "isOnline";
	    
	   /**
	    * estExtId
	    */
	   public static final String ESTEXTID = "estExtId";
	    
	   /**
	    * employeeId
	    */
	   public static final String EMPLOYEEID = "employeeId";
	   
	   /**
	    * roleType
	    */
	   public static final String ROLEYPE = "roleType";

	/**
	 *	AdAccount
	 *
	 */
		public static  final String ADACCOUNT="AdAccount";


	/**
	    * 时间格式为yyyy-MM-dd
	    */
	   public static final String DFTYPETEXT ="yyyy-MM-dd";

       // 放盘站Cookie名称 [CENTANET_AUTH]
       public static final String COOKIENAME_ADS_AUTH = "CENTANET_AUTH";
       
       // 放盘站 Session 名称 [ASP.NET_SessionId]
       public static final String COOKIENAME_ADS_SESSIONID = "ASP.NET_SessionId";
       
       // 放盘站cookie域
       public static final String COOKIE_DOMAIN = "centanet.com";	
       
       // pagecount 默认值
       public static final int PARAM_PAGE_COUNT_VALUE = 10;

       // 登录存储用户Cookie名
       public static final String PARAM_LOGIN_USERKEY = "CENTANET_A_ADMIN_AUTH";
       
       // Cookie Salt
       public static final String PARAM_COOKIE_SALT = "hxl16";

       //ascii
       public static final String US_ASCII = "US-ASCII";

       //StatType --  NewProp-CS
       public static final String PARAM_STATTYPE_NEWPROP_CS = "NewProp-CS";

		//smb域
		public static final String SMBDOMAIN = "centaline.com.cn";

		//smb账号
		public static final String SMBACCOUNT = "PostPicSYNC";
		//smb dg账号
		public static final String SMBDGACCOUNT = "CentaSvr";

		//smb密码
		//CentaSvrP@ssw0rd

		public static final String SMBMIMA = "P@ssw0rd";

		//GZ smb账号
		public static final String GZSMBACOUNT ="wbxingyc";

		//GZ smb密码
		public static final String GZSMBMIMA ="sh.0326";

		//SZ smb账号
		public static final  String SZSMBACCOUNT="litao";

		//SZ smb密码
		public static final  String SZSMBMIMA="SZ@2018";

       /**
        * 获取系统当前时间公共方法
        * @return
        */
       public static  String getTime() {
	   	Date date = new Date();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
			return df.format(date);
       }
       
       
       

       
       
}
