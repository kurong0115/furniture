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
	        if("XMLHttpRequest".equalsIgnoreCase(request.getHeader("X-Requested-With"))){
	            response.setHeader("REDIRECT", "REDIRECT");
	            response.setHeader("CONTENTPATH", request.getContextPath() + "/login-register");
	            response.setStatus(HttpServletResponse.SC_FORBIDDEN);
	        }else{
	        	//获取
				String callbackPath = request.getServletPath();
				if(!"/error".equals(callbackPath.trim())) {
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
