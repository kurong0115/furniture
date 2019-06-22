package com.house.furniture.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.house.furniture.service.UserService;

@Controller
public class MyAccountAction {
	@Resource
	UserService userservice;
	
	@RequestMapping("my-account")
	public String MyAccount() {
		
		return "my-account";
	}
}
