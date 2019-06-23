package com.house.furniture.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.house.furniture.bean.Order;
import com.house.furniture.bean.User;
import com.house.furniture.service.OrdersService;

@Controller
public class MyAccountAction {
	@Resource
	OrdersService orderservice;
	
	@RequestMapping("my-account")
	public String MyAccount(HttpSession session) {
		//打开账户信息之前先加载各种信息
		//查询该用户的所有订单
		User user = (User)session.getAttribute("user");
		
		//Order order = orderservice.selectByUid(user.getId());
		//将用户的所有订单添加到会话中
		//session.setAttribute("myOrder", order);
		return "my-account";
	}
}
