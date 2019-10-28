package com.iterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


/**
 * @Description: session拦截器
 * @Date: 2017.11.24
 * @author lv
 * @version 1.0
 */
public class SessionInterceptor extends HandlerInterceptorAdapter {

	
	/**
	 * session拦截器
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		Object user = request.getSession().getAttribute("user");
		if (user == null) {
			System.out.println("进入拦截器......拦截的请求路径为"+request.getServletPath());
			request.setAttribute("msg", "您未登录或登录超时,请重新登录");
			//request.getRequestDispatcher("/error/noSession.action").forward(request, response);
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			return false;
		} else {
			return true;
		}
	}
}
