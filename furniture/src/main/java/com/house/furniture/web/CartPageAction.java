package com.house.furniture.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.house.furniture.bean.User;
import com.house.furniture.service.CartService;

@Controller
public class CartPageAction {

	@Resource
	CartService cartservice;
	
	@RequestMapping("seeCart")
	public String seeCart(User user) {
		user.setId(1);
		cartservice.listCartProductByUser(user);
		return "cart-page";
	}
}
