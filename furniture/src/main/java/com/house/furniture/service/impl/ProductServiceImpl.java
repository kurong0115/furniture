package com.house.furniture.service.impl;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.house.furniture.bean.Product;
import com.house.furniture.bean.ProductExample;
import com.house.furniture.bean.ProductExample.Criteria;
import com.house.furniture.dao.ProductMapper;
import com.house.furniture.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	ProductMapper productMapper;
	
	@Override
	public List<Product> listProductsByType(int cid, int page, int size) {
		ProductExample example = new ProductExample();
		example.createCriteria().andCidEqualTo(cid);
		List<Product> productList = productMapper.selectByExample(example);
		return productList.isEmpty()? null: productList;
	}

	@Override
	public List<Product> listProductByCondition(String condition) {
		ProductExample example = new ProductExample();
		if (!"".equals(condition.trim())) {
			example.createCriteria().andProductnameLike("%" + condition + "%");
		}
		List<Product> productList = productMapper.selectByExample(example);
		return productList.isEmpty()? null: productList;
	}

	@Override
	public List<Product> selectProductByItem(String onSale, String newProduct, double min, double max, int cid) {
		ProductExample example = new ProductExample();
		Criteria criteria = example.createCriteria();
		if (onSale != null && "check".equals(onSale.trim())) {
			criteria.andStockGreaterThan(0);
		}
		if (newProduct != null && "check".equals(newProduct.trim())) {
			criteria.andCreatetimeGreaterThan(new Timestamp(System.currentTimeMillis() - 7 * 24 * 60 * 60 * 1000));
		}
		criteria.andPriceBetween(min, max);
		criteria.andCidEqualTo(cid);
		List<Product> productList = productMapper.selectByExample(example);
		return productList.isEmpty()? null: productList;
	}

	@Override
	public Product getProductById(int pid) {
		Product product = productMapper.selectByPrimaryKey(pid);
		return product == null? null: product;
	}

}
