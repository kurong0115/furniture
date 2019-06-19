package com.house.furniture.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.house.furniture.bean.Category;
import com.house.furniture.dao.CategoryMapper;
import com.house.furniture.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService {
	
	@Autowired
	CategoryMapper categoryMapper;
	
	@Override
	public List<Category> listAllCategory() {
		List<Category> list = categoryMapper.selectByExample(null);
		return list.isEmpty()? null: list;
	}

}
