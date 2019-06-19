package com.house.furniture.service;

import java.util.List;

import com.house.furniture.bean.Category;

public interface CategoryService {
	
	/**
	  * 列出所有的分类
	 * @return
	 */
	List<Category> listAllCategory();
}
