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
		// 获取父URL--用户直接输入URL，这个父URL是不存在的conString = req.getHeader("REFERER");
		String parentURL = request.getHeader("REFERER");
		boolean illegalURLFlag = false; // 非法URL标志
		if (null == parentURL || "".equals(parentURL)) {// 无父URL,非法访问
			illegalURLFlag = true;
		}
		if (user == null) {
			System.out.println("进入拦截器......拦截的请求路径为" + request.getServletPath());
			request.setAttribute("msg", MessageUtil.NO_SESSION);
			response.sendRedirect(request.getContextPath()+"/login.jsp");
			return false;
		} else if (illegalURLFlag) {
			System.out.println("进入拦截器......拦截的请求路径为" + request.getServletPath());
			//response.sendRedirect(request.getContextPath()+"/login.jsp");
			return false;
		} else {
			return true;
		}
	}
}
