package com.seirin.iterceptor.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.seirin.util.MessageUtil;

/**
 * @Description: session拦截器
 */
public class SessionInterceptor extends HandlerInterceptorAdapter {

	/**
	 * session拦截器
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Object user = request.getSession().getAttribute("user");
		if (user == null) {
			System.out.println("进入拦截器......拦截的请求路径为" + request.getServletPath());
			request.setAttribute("msg", MessageUtil.NO_SESSION);
			// request.getRequestDispatcher("/error/noSession.action").forward(request,
			// response);
			// request.getRequestDispatcher("/login.jsp").forward(request, response);
			response.sendRedirect("/login.jsp");
			return false;
		} else {
			return true;
		}
	}
}
