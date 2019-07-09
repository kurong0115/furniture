package com.house.furniture.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller()
public class ManagerAction {

	@RequestMapping("manager.do")
	public String manager() {
		return "manager";
	}
	
	@RequestMapping("manage-user.do")
	public String manageUser() {
		return "manage-user";
	}
	
	@RequestMapping("manage-noReply.do")
	public String noReply() {
		return "manage-noReply";
	}
	
	@RequestMapping("manage-reply.do")
	public String reply() {
		return "manage-reply";
	}
	
}
