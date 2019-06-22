package com.house.furniture.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
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
	
	@ModelAttribute		//所有类别
	public void initParam(Model model) {
		List<Category> categoryList = categoryService.listAllCategory();
		model.addAttribute("categoryList", categoryList);
	}
	
	@RequestMapping(value = "shop")
	public String shop(@RequestParam(value = "cid", defaultValue = "1") int cid, Model model,
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "size", defaultValue = "30") int size) {
		
		List<Product> productList = productService.listProductsByType(cid, page, size);
		PageHelper.startPage(page, size);
		model.addAttribute("productList", productList);
		return "shop";
	}
	
	/**
	 * 根据条件查询对应的产品
	 * @param condition
	 * @param model
	 * @return
	 */
	@GetMapping(value = "condition")
	public String selectByCondition(@RequestParam(value = "condition", defaultValue = "") String condition, 
			Model model) {
		List<Product> productList = productService.listProductByCondition(condition);
		model.addAttribute("productList", productList);
		return "shop";
	}
}
