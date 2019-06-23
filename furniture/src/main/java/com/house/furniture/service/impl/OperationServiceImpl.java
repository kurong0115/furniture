package com.house.furniture.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.house.furniture.bean.Operation;
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

}
