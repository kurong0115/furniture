package com.house.furniture.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.house.furniture.interceptor.AdminInterceptor;
import com.house.furniture.interceptor.LoginInterceptor;

@Configuration
public class WebConfigurer implements WebMvcConfigurer{
	
	@Autowired
	private LoginInterceptor loginInterceptor;
	
	@Autowired
	private AdminInterceptor admininterceptor;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {		
		registry.addInterceptor(loginInterceptor).addPathPatterns("/**").
			excludePathPatterns("/*.do","/createCode","/login-register",
				"/shop", "/product-details", "/js/**", "/images/**", "/assets/**", "/PIAimages/**",
				"/ckeditor/**","/index","/","/head/**", "/compare-page","/forgetPassword","/send","/QQLogin","/QQLoginCallBack"
				,"/manager.do","/admin","/manage/**","/manage/**","manage-user.do","manage-noReply.do",
				"manage-reply.do","manage-orders.do","manage-category.do","manage-product.do");
		
		registry.addInterceptor(admininterceptor).addPathPatterns("/manager.do","/manage/**","manage-user.do","manage-noReply.do",
				"manage-reply.do","manage-orders.do","manage-category.do","manage-product.do");
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
//		registry.addResourceHandler("/PIAimages/**").addResourceLocations("file:D:/PIAimages/");
	}
}
