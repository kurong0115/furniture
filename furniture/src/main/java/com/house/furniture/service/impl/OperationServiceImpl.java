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
	OperationMapper operationmapper;
	
	@Override
	public void produceOperation(Operation operation) {
		operationmapper.insertSelective(operation);
		
	}

	@Override
	public List<Operation> selectByOrderid(Integer orderid) {
		OperationExample operationExample = new OperationExample();
		operationExample.createCriteria().andOrderidEqualTo(orderid);
		List <Operation> operation = operationmapper.selectByExample(operationExample);
		return operation.size()==0 ? null : operation;
	}

}
