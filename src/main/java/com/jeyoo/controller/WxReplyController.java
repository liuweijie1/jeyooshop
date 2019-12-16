package com.jeyoo.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jeyoo.utils.SignUtil;

import java.io.PrintWriter;
import java.util.Enumeration;
import javax.servlet.http.HttpServletResponse;
@RestController
@RequestMapping("WX")
public class WxReplyController {
	
 
	
 
	@RequestMapping(value = "/reply")
	public void get(HttpServletRequest request, HttpServletResponse response) throws Exception {
 
		System.out.println("========WechatController========= ");
		//bea0629d4a146f01f30f27bb3d015518
 
		Enumeration pNames = request.getParameterNames();
		while (pNames.hasMoreElements()) {
			String name = (String) pNames.nextElement();
			String value = request.getParameter(name);
			// out.print(name + "=" + value);
			String log = "name =" + name + "     value =" + value;
		}
		System.out.println("========WechatControllertets========= ");
		String signature = request.getParameter("signature");/// 微信加密签名
		String timestamp = request.getParameter("timestamp");/// 时间戳
		String nonce = request.getParameter("nonce"); /// 随机数
		String echostr = request.getParameter("echostr"); // 随机字符串
		PrintWriter out = response.getWriter();
 
		 if (SignUtil.checkSignature(signature, timestamp, nonce)) {  
			 System.out.println("校验成功！！！！！！！！！！！！！");
	          out.print(echostr);  
	      } 
		
		out.close();
		out = null;
 
	}
 
}