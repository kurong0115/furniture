package com.house.furniture.service;

import java.util.List;

import com.house.furniture.bean.Remark;

public interface RemarkService {
	
	/**
	 * 列出该商品下的所有评论
	 * @param pid
	 * @return
	 */
	List<Remark> listRemarksByProduct(Integer pid);

}
