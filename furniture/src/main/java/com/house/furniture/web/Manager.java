package com.house.furniture.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller()
public class Manager {

	@RequestMapping("manager")
	public String manager() {
		return "manager";
	}
	
	@RequestMapping("userMgr")
	public String userMgr() {
		return "user-mgr";
	}
	
}
