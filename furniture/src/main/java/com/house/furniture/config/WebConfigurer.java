package com.house.furniture.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.house.furniture.interceptor.LoginInterceptor;

@Configuration
public class WebConfigurer implements WebMvcConfigurer{
	
	@Autowired
	private LoginInterceptor loginInterceptor;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {		
		registry.addInterceptor(loginInterceptor).addPathPatterns("/**").
			excludePathPatterns("/*.do","/createCode","/login-register",
				"/shop", "/product-details", "/js/**", "/images/**", "/assets/**", "/PIAimages/**",
				"/index","/","/head/**", "/compare-page","/forgetPassword","/send");
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
//		registry.addResourceHandler("/PIAimages/**").addResourceLocations("file:D:/PIAimages/");
	}
}
