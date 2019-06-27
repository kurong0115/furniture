package com.house.furniture.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.house.furniture.bean.Operation;
import com.house.furniture.bean.OperationExample;
import com.house.furniture.dao.OperationMapper;
import com.house.furniture.service.OperationService;

@Service
public class OperationServiceImpl implements OperationService {
	
	@Resource
	OperationMapper om;

	@Override
	public List<Operation> selectHotProducts(int num) {
		return om.selectHotProducts(num);
	}

	@Override
	public List<Operation> newAndHotProducts(int num) {
		return om.newAndHotProducts(num);
	}
	
	@Override
	public void produceOperation(Operation operation) {
		om.insertSelective(operation);
	}


	@Override
	public List<Operation> selectByOrderid(Integer orderid) {
		OperationExample operationExample = new OperationExample();
		operationExample.createCriteria().andOrderidEqualTo(orderid);
		List <Operation> operation = om.selectByExample(operationExample);
		return operation.size()==0 ? null : operation;
	}


}
