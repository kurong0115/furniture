package com.house.furniture.service.impl;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.house.furniture.bean.Operation;
import com.house.furniture.bean.OperationExample;
import com.house.furniture.bean.Remark;
import com.house.furniture.bean.RemarkExample;
import com.house.furniture.dao.OperationMapper;
import com.house.furniture.dao.ProductMapper;
import com.house.furniture.dao.RemarkMapper;
import com.house.furniture.service.RemarkService;
import com.house.furniture.service.ServiceException;

@Service
public class RemarkServiceImpl implements RemarkService {
	
	@Autowired
	RemarkMapper remarkMapper;
	
	@Autowired
	OperationMapper operationMapper;
	
	@Autowired
	ProductMapper productMapper;
	
	@Override
	public List<Remark> listRemarksByProduct(Integer pid) {
		RemarkExample example = new RemarkExample();
		example.createCriteria().andPidEqualTo(pid);
		example.setOrderByClause("createTime asc");
		List<Remark> remarks = remarkMapper.selectByExampleWithBLOBs(example);		
		return remarks.isEmpty()? null: remarks;
	}

	@Override
	public int saveRemark(Remark remark) throws ServiceException {	
		OperationExample example = new OperationExample();
		example.createCriteria().andPidEqualTo(remark.getPid()).andUidEqualTo(remark.getUid());
		List<Operation> list = operationMapper.selectByExample(example);
		if (list.isEmpty()) {
			throw new ServiceException("对不起,您没有购买过这件商品,无法评论");
		}
		if (remark.getContent().trim().length() < 10) {
			throw new ServiceException("内容过短");
		}
		remark.setCreatetime(new Timestamp(System.currentTimeMillis()));
		int i = remarkMapper.insertSelective(remark);
		if (i > 0) {
			i = productMapper.updateScore(remark.getPid());
		}
		return i;
	}
}
