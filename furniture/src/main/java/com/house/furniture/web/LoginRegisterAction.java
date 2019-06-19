package com.house.furniture.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import com.house.furniture.bean.User;
import com.house.furniture.service.impl.UserServiceImpl;

@Controller
public class LoginRegisterAction {
	
	@RequestMapping("login-register")
	public String loginRegister() {
		
		return "login-register";
	}
	
	@RequestMapping("login.do")
	public ModelAndView login(String username,String password,String code,HttpSession session,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		UserServiceImpl usi = new UserServiceImpl();
		List<User> user = usi.login(username, password);
		String valCode = (String)session.getAttribute("code");
		if( code.trim().equals(valCode) ) {
			if( user.get(0) == null ) {//登录失败
				String msg = "用户名或者密码输入错误！";
				mav.addObject("msg", msg);
				mav.setViewName("forword:/jsp/login-login-register.jsp");
				return mav;
			}else {//登录成功
				System.out.println("登录成功！！！");
			}
		}else {
			String msg = "验证码输入错误！";
			mav.addObject("msg", msg);
			mav.setViewName("forword:/jsp/login-login-register.jsp");
			return mav;
		}
		String msg = "出现异常了，请刷新页面！";
		mav.addObject("msg", msg);
		mav.setViewName("forword:/jsp/login-login-register.jsp");
		return mav;
	}
	
	@RequestMapping("createCode")
	public String createCode() {
		return "common/createCode";
	}
}
