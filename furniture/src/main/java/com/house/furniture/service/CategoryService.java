package com.house.furniture.service;

import java.util.List;

import com.github.pagehelper.Page;
import com.house.furniture.bean.Category;

public interface CategoryService {
	
	/**
	  * 列出所有的分类
	 * @return
	 */
	List<Category> listAllCategory();
	
	/**
	 * 分页查询类别
	 * @param page
	 * @param rows
	 * @return
	 */
	Page<Category> listAllCategoryByPage(int page, int rows);
	
	/**
	  * 保存分类信息
	 * @param category
	 * @return
	 * @throws ServiceException 
	 */
	int saveCategory(Category category) throws ServiceException;
	
	/**
	 * 判断该类别是否已存在
	 * @param category
	 * @return
	 */
	boolean isExisted(Category category);
	
	/**
	  * 根据id删除该分类
	 * @param cid
	 * @return
	 */
	int removeCategoryByID(int cid);
	
	/**
	 * 修改分类信息
	 * @param category
	 * @return
	 * @throws ServiceException 
	 */
	int updateCategoryByID(Category category) throws ServiceException;
}
