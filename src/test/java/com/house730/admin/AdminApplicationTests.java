package com.house730.admin;


import javax.servlet.MultipartConfigElement;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.web.servlet.MultipartConfigFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.test.context.junit4.SpringRunner;


@SpringBootApplication
@MapperScan(value = "com.house730.admin.mapper")
public class AdminApplicationTests {

	@Test
	public void contextLoads() {

	}
	 /**  
     * 文件上传配置  
     * @return  
     */  
    @Bean  
    public MultipartConfigElement multipartConfigElement() {  
        MultipartConfigFactory factory = new MultipartConfigFactory();  
        factory.setMaxFileSize("5MB"); //KB,MB  
        factory.setMaxRequestSize("50MB");  
        return factory.createMultipartConfig();  
    }  

}
