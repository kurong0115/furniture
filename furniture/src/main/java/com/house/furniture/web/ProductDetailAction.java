package com.house.furniture.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.house.furniture.bean.Product;
import com.house.furniture.bean.Remark;
import com.house.furniture.service.ProductService;
import com.house.furniture.service.RemarkService;

@Controller
public class ProductDetailAction {
	
	@Autowired
	ProductService productService;
	
	@Autowired
	RemarkService remarkService;
	
	@GetMapping("product-details")
	public String showDetail(int pid, Model model) {
		Product product = productService.getProductById(pid);
		model.addAttribute("product", product);
		List<Product> relatedProducts = productService.listRelatedProduct(product.getCid());
		model.addAttribute("relatedProducts", relatedProducts);
		List<Remark> remarks = remarkService.listRemarksByProduct(product.getPid());
		model.addAttribute("remarks", remarks);
		return "product-details";
	}
}
