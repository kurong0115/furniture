package com.house.furniture.web;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.house.furniture.bean.Cart;
import com.house.furniture.bean.Operation;
import com.house.furniture.bean.Orders;
import com.house.furniture.bean.User;
import com.house.furniture.service.CartService;
import com.house.furniture.service.OperationService;
import com.house.furniture.service.OrdersService;

@Controller
@SessionAttributes(names= {"cartProductList","allSum"})
public class CheckoutAction {

	@Resource
	OrdersService ordersservice;
	
	@Resource
	CartService cartservice;
	
	@Resource
	OperationService operationservice;
	
	/**
	 * 生成订单
	 * @param cartProductList
	 * @param user
	 * @param model
	 * @param orders
	 * @return
	 */
	@RequestMapping("produceOrder")
	@Transactional
	public String produceOrder(@SessionAttribute("cartProductList") List<Cart> cartProductList,@SessionAttribute("user")User user,Model model,Orders orders) {
		orders.setUid(user.getId());
		String orderNo = UUID.randomUUID().toString().replace("-", "").toUpperCase();
		orders.setOrderno(orderNo);		
		orders.setCreatetime(new Timestamp(new Date().getTime()));
		ordersservice.produceOrder(orders);		
		cartservice.clearCart(user.getId());
		
		
		Operation operation = new Operation();
		for (Cart cart : cartProductList) {
			operation.setOrderid(orders.getId());
			operation.setUid(cart.getUid());
			operation.setCount(cart.getCount());
			operation.setPid(cart.getPid());
			operation.setPrice(cart.getProduct().getPrice());		
			operation.setSum((int)(cart.getCount()*cart.getProduct().getPrice()));
			operationservice.produceOperation(operation);
		}
		
		
		model.addAttribute("cartProductList", "");
		model.addAttribute("allSum", 0);
		model.addAttribute("orderNo", orderNo);
		return "produceOrder";
	}
}
