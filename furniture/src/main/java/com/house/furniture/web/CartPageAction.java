package com.house.furniture.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.house.furniture.bean.Cart;
import com.house.furniture.bean.User;
import com.house.furniture.service.CartService;

@Controller
public class CartPageAction {

	@Resource
	CartService cartservice;
	
	@RequestMapping("seeCart")
	public String seeCart(User user,Model model) {
		user.setId(1);
		
		List<Cart> cartProductList = cartservice.listCartProductByUser(user);
		model.addAttribute("cartProductList", cartProductList);
		
		long allSum=0;
		for (Cart cart : cartProductList) {
			allSum+=cart.getSum();
		}
		model.addAttribute("allSum", allSum);
		
		return "cart-page";
	}
}
