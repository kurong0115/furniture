package com.house.furniture.web;

import java.util.ArrayList;
import java.util.Iterator;
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
	
	@GetMapping("addCompareInfo.do")
	@SuppressWarnings("unchecked")
	@ResponseBody
	public Result addCompareInfo(int pid, HttpServletRequest request) {
		HttpSession session = request.getSession();
		
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
	
	@GetMapping("removeInfo.do")
	@SuppressWarnings("unchecked")
	@ResponseBody
	public Result removeInfo(int pid, HttpServletRequest request) {
		HttpSession session = request.getSession();		
		List<Product> compareList = (List<Product>) session.getAttribute("compareList");
		Iterator<Product> iterator = compareList.iterator();
		while (iterator.hasNext()) {
			if (iterator.next().getPid() == pid) {
				iterator.remove();				
				return new Result(Result.EXECUTION_SUCCESS, "移除成功");
			}
		}
		return new Result(Result.EXECUTION_FAILED, "移除失败");
	}
}
