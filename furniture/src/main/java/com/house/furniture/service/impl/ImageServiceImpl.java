package com.house.furniture.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.house.furniture.bean.Image;
import com.house.furniture.dao.ImageMapper;
import com.house.furniture.service.ImageService;

@Service
public class ImageServiceImpl implements ImageService {
	
	@Autowired
	ImageMapper imageMapper;
	
	@Override
	public int saveImage(Image image) {		
		return imageMapper.insertSelective(image);
	}

	@Override
	public int removeImage(int imgid) {
		return imageMapper.deleteByPrimaryKey(imgid);
	}

}
