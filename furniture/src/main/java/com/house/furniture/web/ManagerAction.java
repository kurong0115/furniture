package com.house.furniture.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.house.furniture.bean.Admin;
import com.house.furniture.service.AdminService;
import com.house.furniture.service.ServiceException;
import com.house.furniture.vo.Result;

@Controller()
@SessionAttributes("admin")
public class ManagerAction {

	@Resource
	private AdminService adminservice;
	
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
	
	@RequestMapping("manage-orders.do")
	public String orders() {
		return "manage-orders";
	}
	
	@RequestMapping("manage-category.do")
	public String categoryManage() {
		return "category-manage";
	}
	
	@RequestMapping("manage-product.do")
	public String productManage() {
		return "product-manage";

	}
	@RequestMapping(path= {"admin"})
	public String adminLogin() {
		return "manage-login";
	}
	
	@PostMapping("adminLogin")
	@ResponseBody
	public Result toLogin(Admin admin,Model model) {
		try {
			admin=adminservice.adminLogin(admin);
			System.out.println(admin);
			if(admin==null) {
				return new Result(Result.EXECUTION_FAILED,"用户名或密码错误");
			}
			model.addAttribute("admin", admin);
			return new Result(Result.EXECUTION_SUCCESS,"登录成功","manager.do");
		} catch (ServiceException e) {
			e.printStackTrace();
			return new Result(Result.EXECUTION_FAILED,e.getMessage());
		}
	}
}
