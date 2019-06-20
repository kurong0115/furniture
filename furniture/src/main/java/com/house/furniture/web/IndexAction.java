package com.house.furniture.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexAction {
	
	@RequestMapping(path={"index","/"})
	public String index() {
		return "index";
	}
}