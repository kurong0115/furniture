package com.house.furniture.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.house.furniture.bean.Operation;
import com.house.furniture.bean.Product;
import com.house.furniture.bean.Remark;
import com.house.furniture.bean.User;
import com.house.furniture.service.OperationService;
import com.house.furniture.service.ProductService;
import com.house.furniture.service.RemarkService;
import com.house.furniture.service.ServiceException;

@Controller
public class ProductDetailAction {
	
	@Autowired
	ProductService productService;
	
	@Autowired
	RemarkService remarkService;
	
	@Autowired
	OperationService operationService;
	
	@GetMapping("product-details")
	public String showDetail(int pid, Model model, @SessionAttribute(value = "user", required = false) User user) {
		Product product = productService.getProductById(pid);
		model.addAttribute("product", product);
		List<Product> relatedProducts = productService.listRelatedProduct(product.getCid());
		model.addAttribute("relatedProducts", relatedProducts);
		List<Remark> remarks = remarkService.listRemarksByProduct(product.getPid());
		model.addAttribute("remarks", remarks);
		List<Operation> operationList = operationService.listOperationByUidAndPid(user, pid);
		model.addAttribute("operationList", operationList);
		return "product-details";
	}
	
	@GetMapping("addRemark")
	public String addRemark(Remark remark, @SessionAttribute("user") User user, Model model) {
		remark.setUid(user.getId());
		try {
			remarkService.saveRemark(remark);
		} catch (ServiceException e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());	
			model.addAttribute("remark", remark);
		}
		return "forward:product-details?pid=" + remark.getPid();
	}
}
