package com.house.furniture.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	//新品展示个数
	private int num = 7;
	
	@RequestMapping(path={"index","/"})
	public String index(Model model) {
		//首页最热门商品
		List<Operation> HotProducts = os.selectHotProducts(2);
		model.addAttribute("HotProducts", HotProducts);
		
		//分类显示不同内容
		String[] categorys = {"书房", "储物用品", "儿童房", "浴室"};
		model.addAttribute("categorys", categorys);
		//根据类名，查出该类下最新的一些产品
		List<List<Product>> products = new ArrayList<>();
		for(int i = 0; i < categorys.length; i++) {
			List<Product> pro = ps.listProductByCategoryName(num, categorys[i]);
			products.add(pro);
		}
		model.addAttribute("products", products);
		
		//获取所有管理员信息
		List<Admin> adminInfo = as.queryAdmin();
		model.addAttribute("adminInfo", adminInfo);
		
		//最新7天卖的最多的产品
		List<Operation> recomm = os.newAndHotProducts(7);
		model.addAttribute("recomm", recomm);
		return "index";
	}
}
