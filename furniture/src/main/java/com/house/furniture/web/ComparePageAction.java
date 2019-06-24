package com.house.furniture.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.house.furniture.bean.Product;
import com.house.furniture.service.ProductService;
import com.house.furniture.vo.Result;

@Controller
public class ComparePageAction {
	
	@Autowired
	ProductService productService;
	
	@RequestMapping("compare-page")
	public String compare() {
		return "compare-page";
	}
	
	@GetMapping("addCompareInfo")
	@ResponseBody
	public Result addCompareInfo(int pid, HttpServletRequest request) {
		HttpSession session = request.getSession();
		@SuppressWarnings("unchecked")
		List<Product> compareList = (List<Product>) session.getAttribute("compareList");
		if (compareList == null) {
			compareList = new ArrayList<>();
		}
		if (compareList.size() < 3) {
			Product product = productService.getProductById(pid);			
			for (Product pro : compareList) {
				if (pro.getPid() == product.getPid())
					return new Result(Result.EXECUTION_FAILED, "该商品已存在");
			}
			compareList.add(product);
			session.setAttribute("compareList", compareList);
			return new Result(Result.EXECUTION_SUCCESS, "添加成功");
		}		
		return new Result(Result.EXECUTION_FAILED, "已满,请释放一些再添加");
	}
}
