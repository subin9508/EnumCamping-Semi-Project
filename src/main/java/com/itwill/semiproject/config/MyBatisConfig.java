package com.itwill.semiproject.config;


import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan(basePackages = "com.itwill.semiproject.repository")
public class MyBatisConfig {
    // 필요한 경우 추가 설정
}