package com.house.furniture.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AboutUs {
	
	@RequestMapping("about-us")
	public String aboutUs() {
		return "about-us";
	}
}
