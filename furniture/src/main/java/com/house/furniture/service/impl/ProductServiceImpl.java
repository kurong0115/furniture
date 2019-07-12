package com.house.furniture.service.impl;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.house.furniture.bean.Image;
import com.house.furniture.bean.Product;
import com.house.furniture.bean.ProductExample;
import com.house.furniture.bean.ProductExample.Criteria;
import com.house.furniture.dao.ProductMapper;
import com.house.furniture.service.ImageService;
import com.house.furniture.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	ProductMapper productMapper;
	
	@Autowired
	ImageService imageService;
	
	@Override
	public List<Product> listProductsByType(int cid, int page, int size) {		
		PageHelper.startPage(page, size);
		List<Product> productList = productMapper.listProductsByCid(cid);
		return productList.isEmpty()? null: productList;
	}

	@Override
	public List<Product> listProductByCondition(String condition) {
		ProductExample example = new ProductExample();
		Criteria createCriteria = example.createCriteria();
		if (!"".equals(condition.trim())) {			
			createCriteria.andProductnameLike("%" + condition + "%");
		}
		createCriteria.andIsGroundEqualTo((byte) 1);
		List<Product> productList = productMapper.selectByExample(example);
		return productList.isEmpty()? null: productList;
	}

	@Override
	public List<Product> listProductByItem(String onSale, String newProduct, double min, double max, int cid) {
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
	
	public List<Product> listRelatedProduct(int cid) {
		List<Product> relatedProduct = productMapper.listProductsByCid(cid);
		relatedProduct = relatedProduct.subList(0, 4);
		return relatedProduct.isEmpty()? null: relatedProduct;
	}

	@Override
	public List<Product> listProductByCategoryName(int num, String name) {
		return productMapper.listProductByCategoryName(num, name);
	}

	@Override
	public Long getProductSize(int cid) {
		ProductExample example = new ProductExample();
		example.createCriteria().andCidEqualTo(cid);		
		return productMapper.countByExample(example);
	}

	@Override
	public Long getItemSize(String onSale, String newProduct, double min, double max, int cid) {
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
		return productMapper.countByExample(example);
	}

	@Override
	public int saveProduct(Product product, String[] images) {
		product.setScore(0);
		product.setCreatetime(new Timestamp(System.currentTimeMillis()));
		int code = productMapper.insertSelective(product);
		Image image = new Image();
		image.setPid(product.getPid());
		for (String string : images) {
			image.setImgpath(string);
			code = imageService.saveImage(image);
		}
		return code;
	}

	@Override
	public Long getConditionSize(String condition) {
		ProductExample example = new ProductExample();
		if (!"".equals(condition.trim())) {
			example.createCriteria().andProductnameLike("%" + condition + "%");
		}
		return productMapper.countByExample(example);
	}

	@Override
	public Page<Product> listAllProductByPage(int page, int rows, Product product) {
		ProductExample example = new ProductExample();
		if (product != null) {
			Criteria criteria = example.createCriteria();
			if ((product.getProductname() != null) && (!"".equals(product.getProductname().trim()))) {
				criteria.andProductnameLike("%" + product.getProductname() + "%");
			}
			if ((product.getCid() != null) && (product.getCid() != 0)) {
				criteria.andCidEqualTo(product.getCid());
			}
		}		
		Page<Product> pageList = PageHelper.startPage(page, rows);
		productMapper.selectByExample(example);
		return pageList;
	}

	@Override
	public int updateProduct(Product product, String[] images) {	
		int code = productMapper.updateByPrimaryKeySelective(product);
		Image image = new Image();
		image.setPid(product.getPid());
		for (String string : images) {
			image.setImgpath(string);
			code = imageService.saveImage(image);
		}
		return code;
	}

	@Override
	public int removeProduct(int pid) {		
		return productMapper.removeProduct(pid);
	}

	@Override
	public int uploadProduct(int pid) {		
		return productMapper.uploadProduct(pid);
	}
	
	@Override
	public void updateProduct(Product product) {
		productMapper.updateByPrimaryKeySelective(product);
		
	}
}
