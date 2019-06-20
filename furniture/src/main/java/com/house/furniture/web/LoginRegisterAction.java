package com.house.furniture.web;



import javax.annotation.Resource;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.house.furniture.bean.User;
import com.house.furniture.service.UserService;
import com.house.furniture.vo.Result;


@Controller
public class LoginRegisterAction {
	
	@Resource
	UserService userservice;
	
	@RequestMapping("login-register")
	public String loginRegister() {
		
		return "login-register";
	}
	
	@PostMapping("login.do")
	@ResponseBody
	public Result login(String username,String password,String code,HttpSession session,String cheack) {		
		//根据用户名和密码查询
		User user = userservice.login(username, password);
		//获取正确的验证码
		String valCode = (String)session.getAttribute("code");
		
		if( code.trim().equals(valCode.trim()) ) {//判断验证码是否输入正确
			if( user == null ) {//登录失败
				String msg = "用户名或者密码输入错误！";
				return new Result(Result.EXECUTION_FAILED, msg);
			}else {//登录成功,跳转到主页
				System.out.println(cheack);
				if( cheack.trim() == "1" ) {
					System.out.println("记住密码，谢谢");
					session.setAttribute("username", username);
				}
				String msg = "登录成功";
				return new Result(Result.EXECUTION_SUCCESS, msg);
			}
		}else {
			String msg = "验证码输入错误！";
			return new Result(Result.EXECUTION_FAILED, msg);
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
