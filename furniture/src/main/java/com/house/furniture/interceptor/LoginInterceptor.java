package com.house.furniture.interceptor;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.house.furniture.bean.User;

@Component
public class LoginInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		if (user == null) {
			//获取当前请求的路径
//	        String basePath = request.getScheme() + "://" + request.getServerName() + ":"  + request.getServerPort()+request.getContextPath();
	        //如果request.getHeader("X-Requested-With") 返回的是"XMLHttpRequest"说明就是ajax请求，需要特殊处理 否则直接重定向就可以了
	        if("XMLHttpRequest".equalsIgnoreCase(request.getHeader("X-Requested-With"))){
	            //告诉ajax我是重定向
	            response.setHeader("REDIRECT", "REDIRECT");
	            //告诉ajax我重定向的路径
	            response.setHeader("CONTENTPATH", request.getContextPath() + "/login-register");
	            response.setStatus(HttpServletResponse.SC_FORBIDDEN);
	        }else{
	        	//获取
				String callbackPath = request.getServletPath();
				if(!callbackPath.equals("/error")) {
					Map<String, String[]> map = request.getParameterMap();				
					//创建新的map保存参数
					Map<String, String[]> newmap= new HashMap<String, String[]>();
					newmap.putAll(map);

					session.setAttribute("callbackPath", callbackPath);
					session.setAttribute("callbackMap", newmap);
				}
	            response.sendRedirect(request.getContextPath() + "/login-register");
	        }					
			return false;
		} 
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}
	

}
