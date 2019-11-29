package com.jeyoo.utils;


import org.apache.poi.hpsf.DocumentSummaryInformation;
import org.apache.poi.hpsf.SummaryInformation;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ExcelUtils {
	
	private static Logger logger = LoggerFactory.getLogger(ExcelUtils.class);
	
	private static final String COMPANY = "CentaNet";
	
	private static final String SUBJECT = "本文档由 管理后台 系统生成";
	
	private static final String AUTHOR = "huxl16";
	
	private static final String BYTES = "GB2312";
	
	private static final String DFTYPE = "yyyy-MM-dd";
	
       public static HSSFWorkbook getHSSFWorkbook(String sheetName,String []title,String [][]values, HSSFWorkbook wb){
           if(wb == null){ // 第一步，创建一个webbook，对应一个Excel文件  
               wb = new HSSFWorkbook();
           }

      	   SimpleDateFormat df = new SimpleDateFormat(DFTYPE); //设置时间格式
      	   String fileName = sheetName+"_"+df.format(new Date())+".xls";
           //设置文件属性
           wb.createInformationProperties();
           SummaryInformation si = wb.getSummaryInformation();
           DocumentSummaryInformation dsi = wb.getDocumentSummaryInformation();
           dsi.setCompany(COMPANY);
           si.setSubject(SUBJECT);
           si.setAuthor(AUTHOR);
           si.setTitle(fileName);
           si.setSubject(fileName);
           si.setCreateDateTime(new Date());
           if (values != null && values.length!=0) {
	           //计算列宽
	           int []width = new int[title.length];
	           for (int i = 0; i < values.length; i++) {//循环数据条数
	        	  for (int j = 0; j < width.length; j++) {//循环列数
	        		  try {
	        			if(null!=values[i][j]) {
							int num = values[i][j].toString().getBytes(BYTES).length;
							if(num>width[j]) {
								width[j]=num;//填充最大长度
							}
	        			}
					} catch (UnsupportedEncodingException e) {
						logger.error(e.toString());
					}
				}
	           }
	           
	           //新建一个工作簿
	           HSSFSheet sheet = wb.createSheet(df.format(new Date())); 
	           HSSFRow row = sheet.createRow(0);  //新建一行
	           HSSFCellStyle style = wb.createCellStyle();  //设置值表头样式 
	           HSSFFont font = wb.createFont();  //设置字体
	           font.setFontHeightInPoints((short)10);//设置字体大小
	           font.setBold(false);//是否加粗
	           font.setFontName("宋体");//设置字体样式
	           style.setFont(font);//加入到style样式
	           style.setBorderLeft(BorderStyle.THIN);//左边框 THIN=1
	           style.setBorderRight(BorderStyle.THIN);//有边框 THIN=1
	           style.setBorderTop(BorderStyle.THIN);//顶部边框 THIN=1
	           style.setBorderBottom(BorderStyle.THIN);//底部边框 THIN=1
	           style.setAlignment(HorizontalAlignment.CENTER); // 字体居中
	           HSSFCell cell = null;
	           for(int i=0;i<title.length;i++){ // 创建标题
	               cell = row.createCell(i);
	               cell.setCellValue(title[i]); 
	               cell.setCellStyle(style);
	               //填充列宽
	               if((width[i]+1) * 256 > 30000) {
	            	   sheet.setColumnWidth(i, 10000);
	               }else {
	            	   sheet.setColumnWidth(i,(width[i]+1)*256);
	               }
	           }
	           HSSFCellStyle styles =wb.createCellStyle();//设置数据行样式
	           for(int i=0;i<values.length;i++){ // 创建内容
	               row = sheet.createRow(i + 1);
	               for(int j=0;j<values[i].length;j++){ 
	                    row.createCell(j).setCellValue(values[i][j]);
	                    styles.setAlignment(HorizontalAlignment.FILL);
	                    row.setRowStyle(styles);
	               }
	           }
           }
           return wb;
        }
 
       public static HSSFWorkbook getHSSFWorkbookDatasql(String []title,String [][]values, HSSFWorkbook wb){
	           if(wb == null){ // 第一步，创建一个webbook，对应一个Excel文件  
	               wb = new HSSFWorkbook();
	           }

	      	   SimpleDateFormat df = new SimpleDateFormat(DFTYPE); //设置时间格式
	      	   String fileName = df.format(new Date())+".xls";
	           //设置文件属性
	           wb.createInformationProperties();
	           SummaryInformation si = wb.getSummaryInformation();
	           DocumentSummaryInformation dsi = wb.getDocumentSummaryInformation();
	           dsi.setCompany(COMPANY);
	           si.setSubject(SUBJECT);
	           si.setAuthor(AUTHOR);
	           si.setTitle(fileName);
	           si.setSubject(fileName);
	           si.setCreateDateTime(new Date());
	           
	           //计算列宽
	           int []width = new int[title.length];
	           for (int i = 0; i < values.length; i++) {//循环数据条数
	        	  for (int j = 0; j < width.length; j++) {//循环列数
	        		  try {
	        			if(values[i][j]!=null) {
	        				int titlenum = title[j].toString().getBytes(BYTES).length;
							int num = values[i][j].toString().getBytes(BYTES).length;
							if(num>titlenum) {
								width[j]=num;//填充最大长度
							}else {
								width[j]=titlenum;
							}
	        			}
					} catch (UnsupportedEncodingException e) {
						logger.error(e.toString());
					}
				}
	           }
	           
	           //新建一个工作簿
	           HSSFSheet sheet = wb.createSheet(df.format(new Date())); 
	           HSSFRow row = sheet.createRow(0);  //新建一行
	           HSSFCellStyle style = wb.createCellStyle();  //设置值表头样式 
	           HSSFFont font = wb.createFont();  //设置字体
	           font.setFontHeightInPoints((short)10);//设置字体大小
	           font.setBold(true);//是否加粗
	           font.setFontName("宋体");//设置字体样式
	           style.setFont(font);//加入到style样式
	           style.setBorderLeft(BorderStyle.THIN);//左边框 THIN=1
	           style.setBorderRight(BorderStyle.THIN);//有边框 THIN=1
	           style.setBorderTop(BorderStyle.THIN);//顶部边框 THIN=1
	           style.setBorderBottom(BorderStyle.THIN);//底部边框 THIN=1
	           style.setAlignment(HorizontalAlignment.CENTER); // 字体居中
	           HSSFCell cell = null;
	           for(int i=0;i<title.length;i++){ // 创建标题
	               cell = row.createCell(i);
	               cell.setCellValue(title[i].toUpperCase()); 
	               cell.setCellStyle(style);
	               //填充列宽
	               if((width[i]) * 256 > 30000) {
	            	   sheet.setColumnWidth(i, 10000);
	               }else {
	            	   sheet.setColumnWidth(i,(width[i])*256);
	               }
	           }
	           HSSFCellStyle styles =wb.createCellStyle();//设置数据行样式
	           for(int i=0;i<values.length;i++){ // 创建内容
	               row = sheet.createRow(i + 1);
	               for(int j=0;j<values[i].length;j++){ 
	                    row.createCell(j).setCellValue(values[i][j]);
	                    styles.setAlignment(HorizontalAlignment.FILL);
	                    row.setRowStyle(styles);
	               }
	           }
	           return wb;
	        }
	 
	       // 将文件存到指定位置  
	   public static void closeOutputStream(HttpServletResponse response, String fileName, HSSFWorkbook wb){
			try {
	            setResponseHeader(response, fileName);
	            OutputStream os = response.getOutputStream();
	            wb.write(os);
	            os.flush();
	            os.close();
	       } catch (Exception e) {
	           	logger.error(e.toString());
	       }
		}
		
		
		public static void setResponseHeader(HttpServletResponse response, String fileName) {
	        try {
	        	 Date date = new Date();//获取系统本地时间
	   		   	 SimpleDateFormat df = new SimpleDateFormat(DFTYPE); //设置时间格式
	   		   	 String name ="";
	   		   	 if (WebHelpUtils.isNullOrEmpty(fileName)) {
					name = df.format(date)+".xls";
				 }else {
					name =fileName+"_"+df.format(date)+".xls";
				 }
	   		   	 name = new String(name.getBytes("gb2312"),"ISO8859-1");
	             response.setContentType("application/vnd.ms-excel;charset=UTF-8");
	             response.setHeader("Content-Disposition", "attachment;filename="+ name);
	        } catch (Exception ex) {
	             logger.error(ex.toString());
	        }
	    }
		
	

		/**
		 * 下载模板专用
		 * @param sheetName
		 * @param title
		 * @param wb
		 * @return
		 */
		public static HSSFWorkbook getHSSFWorkbookTemplet(String sheetName,String []title, HSSFWorkbook wb) {
			  if(wb == null){ // 第一步，创建一个webbook，对应一个Excel文件  
	               wb = new HSSFWorkbook();
	           }

	      	   SimpleDateFormat df = new SimpleDateFormat(DFTYPE); //设置时间格式
	      	   String fileName = sheetName+"_"+df.format(new Date())+".xls";
	           //设置文件属性
	           wb.createInformationProperties();
	           SummaryInformation si = wb.getSummaryInformation();
	           DocumentSummaryInformation dsi = wb.getDocumentSummaryInformation();
	           dsi.setCompany(COMPANY);
	           si.setSubject(SUBJECT);
	           si.setAuthor(AUTHOR);
	           si.setTitle(fileName);
	           si.setSubject(fileName);
	           si.setCreateDateTime(new Date());
	           
	           //计算列宽
	           int []width = new int[title.length];
	           for (int i = 0; i < title.length; i++) {//循环数据条数
	        		  try {
						int num = title[i].toString().getBytes(BYTES).length;
						if(num>width[i]) {
							width[i]=num;//填充最大长度
						}
					} catch (UnsupportedEncodingException e) {
						logger.error(e.toString());
					}
	           }
	           
	           //新建一个工作簿
	           HSSFSheet sheet = wb.createSheet(df.format(new Date())); 
	           HSSFRow row = sheet.createRow(0);  //新建一行
	           HSSFCellStyle style = wb.createCellStyle();  //设置值表头样式 
	           HSSFFont font = wb.createFont();  //设置字体
	           font.setFontHeightInPoints((short)11);//设置字体大小
	           font.setBold(false);//是否加粗
	           font.setFontName("宋体");//设置字体样式
	           style.setFont(font);//加入到style样式
	           style.setAlignment(HorizontalAlignment.CENTER); // 字体居中
	           HSSFCell cell = null;
	           for(int i=0;i<title.length;i++){ // 创建标题
	               cell = row.createCell(i);
	               cell.setCellValue(title[i]); 
	               cell.setCellStyle(style);
	               //填充列宽
	               if((width[i]+1) * 256 > 30000) {
	            	   sheet.setColumnWidth(i, 10000);
	               }else {
	            	   sheet.setColumnWidth(i,(width[i]+1)*350);
	               }
	           }
	           return wb;
		}
		
	    /**
	     * 将文件存到指定位置  
	     * @param response
	     * @param fileName
	     * @param wb
	     */
		public static void closeOutputStreamTemplet(HttpServletResponse response, String fileName, HSSFWorkbook wb){
				try {
					setResponseHeaderTemplet(response, fileName);
		            OutputStream os = response.getOutputStream();
		            wb.write(os);
		            os.flush();
		            os.close();
		       } catch (Exception e) {
		            logger.error(e.toString());
		       }
			}
			
		/**
		 * 下载模板填写头部信息
		 * @param response
		 * @param fileName
		 */
		public static void setResponseHeaderTemplet(HttpServletResponse response, String fileName) {
		        try {
		   		   	 String name =fileName+".xls";
		             name = new String(name.getBytes("gb2312"),"ISO8859-1");
		             response.setContentType("applicationnd.ms-excel;charset=UTF-8");
		             response.setHeader("Content-Disposition", "attachment;filename="+ name);
		        } catch (Exception ex) {
		             logger.error(ex.toString());
		        }
		    }
			
}
