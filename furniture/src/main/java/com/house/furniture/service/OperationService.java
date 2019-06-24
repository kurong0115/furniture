package com.house.furniture.service;

import java.util.List;

import com.house.furniture.bean.Operation;

public interface OperationService {

	//生成订单后加入到流水表
	void produceOperation(Operation operation);
	//根据订单号查询订单明细
	List<Operation> selectByOrderid(Integer orderid);

}
