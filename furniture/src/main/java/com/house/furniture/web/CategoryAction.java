package com.house.furniture.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.Page;
import com.house.furniture.bean.Category;
import com.house.furniture.service.CategoryService;
import com.house.furniture.service.ServiceException;
import com.house.furniture.vo.EasyUIPage;
import com.house.furniture.vo.Result;

@Controller
public class CategoryAction {
	
	@Autowired
	CategoryService categoryService;
	
	@RequestMapping("listAllCategory.do")
	@ResponseBody
	public EasyUIPage listAllCategory(int page, int rows) {
		Page<Category> categoryList = categoryService.listAllCategoryByPage(page, rows);
		return new EasyUIPage(categoryList.getTotal(), categoryList.getResult());
	}
	
	@RequestMapping("saveCategory.do")
	@ResponseBody
	public Result saveCategory(Category category) {
		try {
			categoryService.saveCategory(category);
			return new Result(Result.EXECUTION_SUCCESS, "添加成功");
		} catch (ServiceException e) {
			return new Result(Result.EXECUTION_FAILED, "该分类已存在");
		}						
	}
	
	@RequestMapping("removeCategory.do")
	@ResponseBody
	public Result removeCategory(int cid) {
		int code = categoryService.removeCategoryByID(cid);
		if (code == 1) {
			return new Result(Result.EXECUTION_SUCCESS, "删除成功");
		}
		return new Result(Result.EXECUTION_FAILED, "删除失败");
	}
	
	
	@RequestMapping("updateCategory.do")
	@ResponseBody
	public Result updateCategory(Category category) {
		try {
			categoryService.updateCategoryByID(category);
			return new Result(Result.EXECUTION_SUCCESS, "修改成功");
		} catch (ServiceException e) {
			return new Result(Result.EXECUTION_FAILED, "修改失败");
		}				
	}
	
	@RequestMapping("selectAllCategory.do")
	@ResponseBody
	public Result listAllCategory() {
		List<Category> categoryList = categoryService.listAllCategory();
		return new Result(Result.EXECUTION_SUCCESS, "", categoryList);
	}
}
