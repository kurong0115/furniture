package com.house.furniture.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.house.furniture.bean.Admin;
import com.house.furniture.bean.Operation;
import com.house.furniture.bean.Product;
import com.house.furniture.service.AdminService;
import com.house.furniture.service.OperationService;
import com.house.furniture.service.ProductService;

@Controller
public class IndexAction {
	@Resource
	OperationService os;
	
	@Resource
	ProductService ps;
	
	@Resource
	AdminService as;
	
	//新品展示	每类展示4种
	private int num = 5;
	
	//需要根据是否登录将listCartProduct加入session
	@RequestMapping(path={"index","/"})
	public String index(Model model) {
		//首页最热门商品		形式参数：limit查询的两个参数
		List<Operation> HotProducts = os.selectHotProducts(0, 2);
		model.addAttribute("HotProducts", HotProducts);
		
		String[] categorys = {"书房", "储物用品", "儿童房"};
		//List<Product> newProducts = ps.listProductByCategoryName(num, categorys[0], categorys[1], categorys[2]);
		model.addAttribute("categorys", categorys);
		//model.addAttribute("newProducts", newProducts);
		
		//获取所有管理员信息
		List<Admin> adminInfo = as.queryAdmin();
		model.addAttribute("adminInfo", adminInfo);
		
		//最新7天卖的最多的产品
		List<Operation> recomm = os.newAndHotProducts(7);
		model.addAttribute("recomm", recomm);
		return "index";
	}
	
	@RequestMapping("newProducts")
	@ResponseBody
	public List<Product> newProducts(String categoryName) {
		List<Product> newProducts = ps.listProductByCategoryName(num, categoryName);
		return newProducts;
	}
}
