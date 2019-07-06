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
	
	/**
	 * 保存评论
	 * @param remark
	 * @return
	 * @throws ServiceException 
	 */
	int saveRemark(Remark remark) throws ServiceException;

}
