package com.house.furniture.web;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.house.alipay.config.AlipayConfig;
import com.house.furniture.bean.Address;
import com.house.furniture.bean.Cart;
import com.house.furniture.bean.Operation;
import com.house.furniture.bean.Orders;
import com.house.furniture.bean.Product;
import com.house.furniture.bean.User;
import com.house.furniture.service.AddressService;
import com.house.furniture.service.CartService;
import com.house.furniture.service.OperationService;
import com.house.furniture.service.OrdersService;
import com.house.furniture.service.ProductService;

@Controller
@SessionAttributes(names= {"cartProductList","allSum"})
public class CheckoutAction {

	@Resource
	private OrdersService ordersservice;
	
	@Resource
	private CartService cartservice;
	
	@Resource
	private OperationService operationservice;
	
	@Resource
	private ProductService productservice;
	
	@Resource
	private AddressService addressservice;
	/**
	 * 生成订单
	 * @param cartProductList
	 * @param user
	 * @param model
	 * @param orders
	 * @return
	 * @throws AlipayApiException 
	 * @throws IOException 
	 */
	@RequestMapping("produceOrder")
	@Transactional
	public String produceOrder(@SessionAttribute("cartProductList") List<Cart> cartProductList,@SessionAttribute("user")User user,Model model,Orders orders,
			HttpServletResponse rep,Product product) throws AlipayApiException, IOException {
		for (Cart cart : cartProductList) {
 			if(cart.getCount()>cart.getProduct().getStock()) {
 				model.addAttribute("msg",cart.getProduct().getProductname()+"库存不足");
 				List<Address> addrList=addressservice.getAddrByUser(user);
 				model.addAttribute("addrList", addrList);
 				return "checkout";
 			}
 			
 		}
		
		orders.setUid(user.getId());
		String orderNo = UUID.randomUUID().toString().replace("-", "").toUpperCase();
		orders.setOrderno(orderNo);		
		orders.setCreatetime(new Timestamp(new Date().getTime()));
		orders.setIsdeal(0);
		orders.setIspay(0);
		orders.setIsfinish(0);

		ordersservice.produceOrder(orders);		
		cartservice.clearCart(user.getId());

		if(orders.getPaymethod().equals("货到付现")) {
			
			orders.setIspay(1);//修改订单状态为已支付
            ordersservice.updateOrders(orders);
            Operation operation = new Operation();
     		for (Cart cart : cartProductList) {
     			operation.setOrderid(orders.getId());
     			operation.setUid(cart.getUid());
     			operation.setCount(cart.getCount());
     			operation.setPid(cart.getPid());
     			operation.setPrice(cart.getProduct().getPrice());		
     			operation.setSum((int)(cart.getCount()*cart.getProduct().getPrice()));
     			operationservice.produceOperation(operation);
     			product = cart.getProduct();
     			product.setStock(product.getStock()-cart.getCount());
     			productservice.updateProduct(product);
     			
     		}
     		
     		model.addAttribute("cartProductList", "");
     		model.addAttribute("allSum", 0);
			model.addAttribute("orderNo", orders.getOrderno());
			return "produceOrder";
			
		}else {
			//获得初始化的AlipayClient
	        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
	 
	        //设置请求参数
	        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
	        alipayRequest.setReturnUrl(AlipayConfig.return_url);
	        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
	 
	        //商户订单号，商户网站订单系统中唯一订单号，必填
	        String out_trade_no = orders.getOrderno();
	        //付款金额，必填
	        String total_amount = orders.getSum().toString();
	        //订单名称，必填
	        String subject = user.getName()+"的OurHouse订单";
	        //商品描述，可空
	        String body = null;
	 
	        alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"," 
	                + "\"total_amount\":\""+ total_amount +"\"," 
	                + "\"subject\":\""+ subject +"\"," 
	                + "\"body\":\""+ body +"\"," 
	                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
	 
	        //请求
	        String result = alipayClient.pageExecute(alipayRequest).getBody();
	 
	        rep.setContentType("text/html;charset=" + AlipayConfig.charset);
	        rep.getWriter().write(result);//直接将完整的表单html输出到页面
	        rep.getWriter().flush();
	        rep.getWriter().close();
	        return null;
		}
	}
	
	/**
	 * 回调路径return_url
     * @param request
     * @param response
     * @throws AlipayApiException 
     * @throws UnsupportedEncodingException 
     */
    @RequestMapping("return_url")
    @Transactional
    public String returnUrl(@SessionAttribute("cartProductList") List<Cart> cartProductList,Model model,
    		HttpServletResponse response,HttpServletRequest request,Product product) throws AlipayApiException, UnsupportedEncodingException{
        //获取支付宝POST过来反馈信息
        Map<String,String> params = new HashMap<String,String>();
        @SuppressWarnings("rawtypes")
		Map requestParams = request.getParameterMap();
        for (@SuppressWarnings("rawtypes")
		Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                            : valueStr + values[i] + ",";
            }
            //乱码解决，这段代码在出现乱码时使用。
            //valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, valueStr);
            System.out.println(valueStr);
        }
        //切记alipaypublickey是支付宝的公钥，请去open.alipay.com对应应用下查看。
        //boolean AlipaySignature.rsaCheckV1(Map<String, String> params, String publicKey, String charset, String sign_type)
        boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset,AlipayConfig.sign_type);

        
        if(signVerified) {
            //商户订单号
            String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
 
            //支付宝交易号
            String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
 
            //付款金额
            String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"),"UTF-8");
 
            request.setAttribute("out_trade_no", out_trade_no);
            request.setAttribute("trade_no", trade_no);
            request.setAttribute("total_amount", total_amount);
 
 
            System.out.println("订单处理：系统订单号" + out_trade_no + "支付宝交易号：" + trade_no);
            //系统处理根据支付宝回调更改订单状态或者其他关联表的数据
            Orders order=ordersservice.findOrderByOrderNo(out_trade_no);
            
            System.out.println(order);
            
            if(order == null){
            	System.out.println("11");
                signVerified = false;
                request.setAttribute("signVerified", signVerified); 
                request.setAttribute("reason", "商户订单号不存在");
                System.out.println("系统订单："+ out_trade_no + "不存在。");
                return "produceOrder";
            }else{
                if(order.getSum()!=Double.valueOf(total_amount).intValue() ){
                    signVerified = false;
                    request.setAttribute("signVerified", signVerified); 
                    request.setAttribute("reason", "付款金额不对");
                    return "produceOrder";
                }
 
                if(order.getIsdeal() == 1){//判断当前订单是否已处理，避免重复处理
                	System.out.println("44");
                	System.out.println("系统订单："+ out_trade_no + "无需重复处理。");
                }else{
                    order.setIspay(1);//修改订单状态为已支付
                    ordersservice.updateOrders(order);
                    System.out.println("系统订单："+ out_trade_no + "成功支付。");
                    request.setAttribute("orderNo", out_trade_no);
                    Operation operation = new Operation();
            		for (Cart cart : cartProductList) {
            			operation.setOrderid(order.getId());
            			operation.setUid(cart.getUid());
            			operation.setCount(cart.getCount());
            			operation.setPid(cart.getPid());
            			operation.setPrice(cart.getProduct().getPrice());		
            			operation.setSum((int)(cart.getCount()*cart.getProduct().getPrice()));
            			operationservice.produceOperation(operation);
            			product = cart.getProduct();
             			product.setStock(product.getStock()-cart.getCount());
             			productservice.updateProduct(product);
            		}
            		model.addAttribute("cartProductList", "");
            		model.addAttribute("allSum", 0);
                }
 
            }
        }else{
            request.setAttribute("reason", "验签失败");
            return "produceOrder";
        }
        request.setAttribute("signVerified", signVerified);
        return "produceOrder";
    }

    @RequestMapping("notify_url")
    @Transactional
    public String notifyUrl(@SessionAttribute("cartProductList") List<Cart> cartProductList,Model model,
    		HttpServletResponse response,HttpServletRequest request,Product product) throws AlipayApiException, UnsupportedEncodingException{
        //获取支付宝POST过来反馈信息
        Map<String,String> params = new HashMap<String,String>();
        @SuppressWarnings("rawtypes")
		Map requestParams = request.getParameterMap();
        for (@SuppressWarnings("rawtypes")
		Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                            : valueStr + values[i] + ",";
            }
            //乱码解决，这段代码在出现乱码时使用。
            //valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, valueStr);
        }
        //切记alipaypublickey是支付宝的公钥，请去open.alipay.com对应应用下查看。
        //boolean AlipaySignature.rsaCheckV1(Map<String, String> params, String publicKey, String charset, String sign_type)
        boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset,AlipayConfig.sign_type);
        if(signVerified) {
            //商户订单号
            String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
 
            //支付宝交易号
            String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
 
            //付款金额
            String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"),"UTF-8");
 
            request.setAttribute("out_trade_no", out_trade_no);
            request.setAttribute("trade_no", trade_no);
            request.setAttribute("total_amount", total_amount);
 
 
            System.out.println("订单处理：系统订单号" + out_trade_no + "支付宝交易号：" + trade_no);
            //系统处理根据支付宝回调更改订单状态或者其他关联表的数据
            Orders order=ordersservice.findOrderByOrderNo(out_trade_no);
            
            
            if(order == null){
                signVerified = false;
                request.setAttribute("signVerified", signVerified); 
                request.setAttribute("reason", "商户订单号不存在");
                System.out.println("系统订单："+ out_trade_no + "不存在。");
            }else{
                if(!order.getSum().toString().equals(total_amount)){
                    signVerified = false;
                    request.setAttribute("signVerified", signVerified); 
                    request.setAttribute("reason", "付款金额不对");
                    return "notify_url";
                }
 
 
                if(order.getIsdeal() == 1){//判断当前订单是否已处理，避免重复处理
                	System.out.println("系统订单："+ out_trade_no + "无需重复处理。");
                }else{
                    order.setIspay(1);//修改订单状态为已支付
                    ordersservice.updateOrders(order);
                    System.out.println("系统订单："+ out_trade_no + "成功支付。");
                    Operation operation = new Operation();
            		for (Cart cart : cartProductList) {
            			operation.setOrderid(order.getId());
            			operation.setUid(cart.getUid());
            			operation.setCount(cart.getCount());
            			operation.setPid(cart.getPid());
            			operation.setPrice(cart.getProduct().getPrice());		
            			operation.setSum((int)(cart.getCount()*cart.getProduct().getPrice()));
            			operationservice.produceOperation(operation);
            			product = cart.getProduct();
             			product.setStock(product.getStock()-cart.getCount());
             			productservice.updateProduct(product);
            		}
            		model.addAttribute("cartProductList", "");
            		model.addAttribute("allSum", 0);
                }
 
            }
        }else{
            request.setAttribute("reason", "验签失败");
        }
        request.setAttribute("signVerified", signVerified);
        return "return_url";
    }
}
