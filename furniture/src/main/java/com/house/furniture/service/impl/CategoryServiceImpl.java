package com.house.furniture.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.house.furniture.bean.Category;
import com.house.furniture.bean.CategoryExample;
import com.house.furniture.dao.CategoryMapper;
import com.house.furniture.service.CategoryService;
import com.house.furniture.service.ServiceException;

@Service
public class CategoryServiceImpl implements CategoryService {
	
	@Autowired
	CategoryMapper categoryMapper;
	
	@Override
	public List<Category> listAllCategory() {
		List<Category> list = categoryMapper.selectByExample(null);
		return list.isEmpty() ? null : list;
	}

	@Override
	public Page<Category> listAllCategoryByPage(int page, int rows) {
		Page<Category> pageList = PageHelper.startPage(page, rows);
		categoryMapper.selectByExample(null);
		return pageList;
	}

	@Override
	public int saveCategory(Category category) throws ServiceException {	
		if (!isExisted(category)) {
			throw new ServiceException("该分类已存在");
		}
		return categoryMapper.insertSelective(category);				
	}

	@Override
	public boolean isExisted(Category category) {
		CategoryExample example = new CategoryExample();
		example.createCriteria().andCategorynameEqualTo(category.getCategoryname());
		List<Category> list = categoryMapper.selectByExample(example);
		return list.isEmpty();
	}

	@Override
	public int removeCategoryByID(int cid) {		
		return categoryMapper.deleteByPrimaryKey(cid);
	}

	@Override
	public int updateCategoryByID(Category category) throws ServiceException {
		if (!isExisted(category)) {
			throw new ServiceException("该分类已存在");
		}
		return categoryMapper.updateByPrimaryKey(category);
	}

}
