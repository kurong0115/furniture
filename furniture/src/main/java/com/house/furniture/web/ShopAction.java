package com.house.furniture.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.house.furniture.bean.Category;
import com.house.furniture.bean.Product;
import com.house.furniture.service.CategoryService;
import com.house.furniture.service.ProductService;

@Controller
public class ShopAction {
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	ProductService productService;
	
	@ModelAttribute
	public void initParam(Model model) {
		List<Category> categoryList = categoryService.listAllCategory();
		model.addAttribute("categoryList", categoryList);
	}
	
	@RequestMapping(value="shop")
	public String shop(@RequestParam(value = "cid", defaultValue = "1") int cid, Model model) {
		List<Product> productList = productService.listProductsByType(cid);
		model.addAttribute("productList", productList);
		return "shop";
	}
}
