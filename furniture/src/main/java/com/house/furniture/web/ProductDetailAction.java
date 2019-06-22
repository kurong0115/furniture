package com.house.furniture.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.house.furniture.bean.Product;
import com.house.furniture.service.ProductService;

@Controller
public class ProductDetailAction {
	
	@Autowired
	ProductService productService;
	
	@GetMapping("product-details")
	public String showDetail(int pid, Model model) {
		Product product = productService.getProductById(pid);
		model.addAttribute("product", product);
		return "product-details";
	}
}
