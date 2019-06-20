package com.house.furniture.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.house.furniture.bean.Product;
import com.house.furniture.bean.ProductExample;
import com.house.furniture.dao.ProductMapper;
import com.house.furniture.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	ProductMapper productMapper;
	
	@Override
	public List<Product> listProductsByType(int cid) {
		ProductExample example = new ProductExample();
		example.createCriteria().andCidEqualTo(cid);
		List<Product> productList = productMapper.selectByExample(example);
		return productList.isEmpty()? null: productList;
	}

}
