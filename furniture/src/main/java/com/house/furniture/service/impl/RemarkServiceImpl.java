package com.house.furniture.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.house.furniture.bean.Remark;
import com.house.furniture.bean.RemarkExample;
import com.house.furniture.dao.RemarkMapper;
import com.house.furniture.service.RemarkService;

@Service
public class RemarkServiceImpl implements RemarkService {
	
	@Autowired
	RemarkMapper remarkMapper;
	
	@Override
	public List<Remark> listRemarksByProduct(Integer pid) {
		RemarkExample example = new RemarkExample();
		example.createCriteria().andPidEqualTo(pid);
		example.setOrderByClause("createTime asc");
		List<Remark> remarks = remarkMapper.selectByExampleWithBLOBs(example);		
		return remarks.isEmpty()? null: remarks;
	}

}
