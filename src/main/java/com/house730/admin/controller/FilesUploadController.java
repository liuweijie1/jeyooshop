package com.house730.admin.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 * 
 * @author wbqiutj
 *	2019年5月7日
 */
@Controller
@RequestMapping(value = "/file")
public class FilesUploadController {
	// 读取application.properties文件中的自定义配置项
		@Value("${spring.fileupload.destination}")
		private String destination;
		
		/**
		 * 多文件上传类
		 * 文件会自动绑定到MultipartFile中
		 * @param request 获取请求信息
		 * @param description 文件描述
		 * @param file 上传的文件
		 * @return 上传成功或失败结果
		 * @throws IOException 
		 * @throws IllegalStateException 
		 */
		@PostMapping("/uploads")
		@ResponseBody
		public Object filesUpload(HttpServletRequest request, 
				@RequestParam("file") MultipartFile[] files){
			
			// 获取文件描述参数 description，纯粹测试使用
			/*if (null != descriptions && descriptions.length > 0) {
				for (int i=0; i < descriptions.length; i++) {
					String description = descriptions[i];
					System.out.println("description" + i + " = " + description);
				}
			}*/
			Map<String,Object> mp = new LinkedHashMap<>();
			try{
				// 构建上传文件的存放路径
				String destionation = destination + File.separator + "upload";
				System.out.println("destionation = " + destionation);
							
				// 如果文件不为空，写入上传路径，进行文件上传
				if (null != files && files.length > 0) {
					for (MultipartFile file : files) {
						// 测试MultipartFile接口的各个方法
						System.out.println("文件类型ContentType=" + file.getContentType());
						System.out.println("文件组件名称Name=" + file.getName());
						System.out.println("文件原名称OriginalFileName=" + file.getOriginalFilename());
						System.out.println("文件大小Size=" + file.getSize() + "byte or " + file.getSize()/1024 + "KB");
						saveFile(file, destionation);
						mp.put("code", "0");
					}
				} else {
					mp.put("msg", "請選擇上傳的文件！");
				}
			}catch(Exception e) {
				e.printStackTrace();
				mp.put("msg", "上傳文件失敗！");
			}
			return mp;
		}
		
		/**
		 * 文件保存方法
		 * @param file
		 * @param destination
		 * @throws IOException 
		 * @throws IllegalStateException 
		 */
		private void saveFile(MultipartFile file, String destination) throws IllegalStateException, IOException{
			// 获取上传的文件名称，并结合存放路径，构建新的文件名称
			String filename = file.getOriginalFilename();
			File filepath = new File(destination, filename);
			
			// 判断路径是否存在，不存在则新创建一个
			if (!filepath.getParentFile().exists()) {
				filepath.getParentFile().mkdirs();
			}
			
			// 将上传文件保存到目标文件目录
			file.transferTo(new File(destination + File.separator + filename));
		}
		
		//从本地读取文件并返回到网页中 
		public void getImage(String filename, HttpServletResponse response){
			FileInputStream in = null; ServletOutputStream out = null; 
			try { 
				File file = new File(destination+filename);
				in = new FileInputStream(file);
				out = response.getOutputStream();
				byte[] bytes = new byte[1024 * 10];
				int len = 0;
				while ((len = in.read(bytes)) != -1) {
					out.write(bytes,0,len); 
					} out.flush(); 
			} catch (IOException e) {
					e.printStackTrace();
			} finally { 
				try { 
					in.close();
					out.close();
				} catch (IOException e) {
					e.printStackTrace(); 
				} 
			} 
		}
		
}
