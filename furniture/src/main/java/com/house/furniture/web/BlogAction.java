package com.house.furniture.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BlogAction {
	
	@RequestMapping("blog.do")
	public String blog() {
		return "blog";
	}
}
