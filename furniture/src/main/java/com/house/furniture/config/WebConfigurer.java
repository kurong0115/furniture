package com.house.furniture.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.house.furniture.interceptor.LoginInterceptor;

@Configuration
public class WebConfigurer implements WebMvcConfigurer{
	
	@Autowired
	private LoginInterceptor loginInterceptor;
	
	@Value("${spring.resources.staticLocations}")
	private String a;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {		
		
		System.out.println("-----------------"+a);
		registry.addInterceptor(loginInterceptor).
			excludePathPatterns("/login-register", "/shop", "/product-details", "*.js", "*.css").
			addPathPatterns("/**");
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
//		registry.addResourceHandler("/PIAimages/**").addResourceLocations("file:D:/PIAimages/");
		
	}
	
}
