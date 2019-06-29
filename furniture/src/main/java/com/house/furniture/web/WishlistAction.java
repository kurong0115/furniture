package com.house.furniture.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WishlistAction {
	
	@RequestMapping("wishlist")
	public String wishlist() {
		return "wishlist";
	}
}
