package com.jeyoo.utils;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jeyoo.service.impl.UserOrderRecordServiceImpl;

/**
 * SHA256加密
 * @author wbqiutj
 * @2019年5月20日
 */
public class SHA256Util {
	private static Logger logger = LoggerFactory.getLogger(SHA256Util.class);
	/**
	　　* 利用java原生的摘要实现SHA256加密
	　　* @param str 加密后的报文
	　　* @return
	　　*/
	public static String getSHA256StrJava(String str){
		MessageDigest messageDigest;
		String encodeStr = "";
		try {
			messageDigest = MessageDigest.getInstance("SHA-256");
			messageDigest.update(str.getBytes("UTF-8"));
			encodeStr = byte2Hex(messageDigest.digest());
		} catch (NoSuchAlgorithmException e) {
			logger.error("NoSuchAlgorithmException",e);
		} catch (UnsupportedEncodingException e) {
			logger.error("UnsupportedEncodingException",e);
		}
		return encodeStr;
	}

	/**
	　　* 将byte转为16进制
	　　* @param bytes
	　　* @return
	　　*/
	private static String byte2Hex(byte[] bytes){
		StringBuffer stringBuffer = new StringBuffer();
		String temp = null;
		for (int i=0;i<bytes.length;i++){
			temp = Integer.toHexString(bytes[i] & 0xFF);
			if (temp.length()==1){
				//1得到一位的进行补0操作
				stringBuffer.append("0");
			}
			stringBuffer.append(temp);
		}
		return stringBuffer.toString();
	}
}
