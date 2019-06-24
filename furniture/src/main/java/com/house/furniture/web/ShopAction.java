package com.house.furniture.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.github.pagehelper.PageHelper;
import com.house.furniture.bean.Cart;
import com.house.furniture.bean.Category;
import com.house.furniture.bean.Product;
import com.house.furniture.bean.User;
import com.house.furniture.service.CartService;
import com.house.furniture.service.CategoryService;
import com.house.furniture.service.ProductService;
import com.house.furniture.vo.Result;

@Controller
public class ShopAction {
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	CartService cartservice;
	
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
	
	@GetMapping(value = "item") 
	@ResponseBody
	public Result selectProductByItem(@RequestParam(value = "onSale", required = false) String onSale, 
			@RequestParam(value = "newProduct", required = false) String newProduct,
			@RequestParam(value = "min", defaultValue = "1") double min, 
			@RequestParam(value = "max", defaultValue = "20000") double max, 
			@RequestParam(value = "cid") int cid) {
		List<Product> productList = productService.selectProductByItem(onSale, newProduct, min, max, cid);
		return new Result(Result.EXECUTION_SUCCESS, "", productList);
	}
	
	@GetMapping(value = "quickView")
	@ResponseBody
	public Result getProductById(int pid) {
		Product product = productService.getProductById(pid);
		if (product == null) {
			return new Result(Result.EXECUTION_FAILED, "该产品不存在");
		} else {
			return new Result(Result.EXECUTION_SUCCESS, "", product);
		}
	}
	
	@GetMapping("addCart")
	@ResponseBody
	public Result addCart(Cart cart,@SessionAttribute("user") User user,Model model) {
		cart.setUid(user.getId());
		cart = cartservice.addCart(cart);
		if(cart.getProduct()==null) {
			Product product = productService.getProductById(cart.getPid());
			cart.setProduct(product);
		}
		
		return new Result(Result.EXECUTION_SUCCESS,"添加成功",cart);
	}
}
