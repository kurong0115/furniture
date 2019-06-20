package com.house.furniture.web;



import javax.annotation.Resource;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;



import com.house.furniture.bean.User;
import com.house.furniture.service.UserService;


@Controller
public class LoginRegisterAction {
	
	@Resource
	UserService userservice;
	
	@RequestMapping("login-register")
	public String loginRegister() {
		
		return "login-register";
	}
	
	@RequestMapping("login.do")
	public String login(String username,String password,String code,HttpSession session) {
		
		
		//根据用户名和密码查询
		User user = userservice.login(username, password);
		//获取正确的验证码
		String valCode = (String)session.getAttribute("code");
		
		if( code.trim().equals(valCode) ) {//判断验证码是否输入正确
			if( user == null ) {//登录失败
				String msg = "用户名或者密码输入错误！";
				return msg;
			}else {//登录成功,跳转到主页
				String msg = "验证码输入错误！";
				return msg;
			}
		}else {
			String msg = "验证码输入错误！";
			return msg;
		}
	}
	/**
	 * 	返回创建验证码视图
	 * @return
	 */
	@RequestMapping("createCode")
	public String createCode() {
		return "common/createCode";
	}
}
