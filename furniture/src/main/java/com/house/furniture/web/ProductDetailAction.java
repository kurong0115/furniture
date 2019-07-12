package com.house.furniture.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.context.annotation.RequestScope;

import com.house.furniture.bean.Operation;
import com.house.furniture.bean.Product;
import com.house.furniture.bean.Remark;
import com.house.furniture.bean.User;
import com.house.furniture.service.OperationService;
import com.house.furniture.service.ProductService;
import com.house.furniture.service.RemarkService;
import com.house.furniture.service.ServiceException;
import com.house.furniture.vo.Result;

@Controller
public class ProductDetailAction {
	
	@Autowired
	ProductService productService;
	
	@Autowired
	RemarkService remarkService;
	
	@Autowired
	OperationService operationService;
	
	@GetMapping("product-details")
	public String showDetail(@RequestParam(required = true) int pid, 
			Model model, @SessionAttribute(value = "user", required = false) User user) {
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
		return "redirect:product-details?pid=" + remark.getPid() + "&flag=comment";
	}
	
	@GetMapping("removeRemark")
	@ResponseBody
	public Result removeRemark(@RequestParam(value = "id", required = true) int id, 
			@RequestParam(value = "pid", required = true) int pid) {
		int code = remarkService.removeRemark(id, pid);
		if (code == 1) {
			return new Result(Result.EXECUTION_SUCCESS, "删除成功");
		}
		return new Result(Result.EXECUTION_FAILED, "删除失败");
	}
}
