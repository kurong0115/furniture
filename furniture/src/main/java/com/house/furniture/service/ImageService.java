package com.house.furniture.service;

import com.house.furniture.bean.Image;

public interface ImageService {
	
	/**
	  * 保存图片
	 * @param image
	 * @return
	 */
	int saveImage(Image image);
	
	
	/**
	 * 移除一个图片信息
	 * @param imgid
	 * @return
	 */
	int removeImage(int imgid);
}
