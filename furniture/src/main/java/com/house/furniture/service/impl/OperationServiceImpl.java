package com.house.furniture.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.house.furniture.bean.Operation;
import com.house.furniture.dao.OperationMapper;
import com.house.furniture.service.OperationService;

@Service
public class OperationServiceImpl implements OperationService {
	
	@Resource
	OperationMapper om;

	@Override
	public List<Operation> selectHotProducts(int index, int size) {
		return om.selectHotProducts(index, size);
	}

	@Override
	public List<Operation> newAndHotProducts(int num) {
		return om.newAndHotProducts(num);
	}
}
