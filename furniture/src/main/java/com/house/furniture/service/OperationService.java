package com.house.furniture.service;

import com.house.furniture.bean.Operation;

public interface OperationService {

	//生成订单后加入到流水表
	void produceOperation(Operation operation);

}
