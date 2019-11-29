package com.jeyoo.config;

import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.beans.factory.support.DefaultListableBeanFactory;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

import java.security.PrivateKey;
import java.security.PublicKey;

@Data
@Configuration
public class JwtInitProperties implements ApplicationRunner {
    @Value("${house730.jwt.publicFilePath}")
    private   String publicFilePath ;
    @Value("${house730.jwt.privateFilePath}")
    private  String privateFilePath;
    @Value("${house730.jwt.secret}")
    private  String secret;
    @Value("${house730.jwt.expire}")
    private Integer expire;
    @Value("${house730.jwt.cookieName}")
    private String cookieName;
    @Value("${house730.jwt.cookieMaxAge}")
    private Integer cookieMaxAge;
    // 公钥
    private PublicKey publicKey;
    // 私钥
    private PrivateKey privateKey;
    @Autowired
    private AutowireCapableBeanFactory beanFactory;
    @Autowired
    DefaultListableBeanFactory defaultListableBeanFactory;
    @Override
    public void run(ApplicationArguments args) throws Exception {
        RsaUtils.generateKey(publicFilePath, privateFilePath, secret);
        this.publicKey = RsaUtils.getPublicKey(publicFilePath);
        this.privateKey= RsaUtils.getPrivateKey(privateFilePath);
        defaultListableBeanFactory.registerSingleton("publicKey",publicKey);
        defaultListableBeanFactory.registerSingleton("privateKey",privateKey);
        beanFactory.autowireBean(publicKey);
        beanFactory.autowireBean(privateKey);

    }

}
