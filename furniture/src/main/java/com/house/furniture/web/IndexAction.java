package com.house.furniture.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexAction {
	
	//需要根据是否登录将listCartProduct加入session
	@RequestMapping(path={"index","/"})
	public String index() {		
		return "index";
	}
}
