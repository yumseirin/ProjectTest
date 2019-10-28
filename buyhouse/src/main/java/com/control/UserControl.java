package com.control;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.service.UserServiceInf;
import com.vo.User;

@Controller
@RequestMapping("/userControl")
public class UserControl {

	@Autowired
	private UserServiceInf userServiceInf;

	/**
	 * 登录
	 * 
	 * @param user
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("/login")
	public String login(User user, HttpSession session, Model model) {

		user = userServiceInf.login(user);

		if (user != null) {
			if (user.getStatus() == 1) {
				session.setAttribute("uname", user.getUname());
				return "main/addhouse";
			} else {
				session.setAttribute("uname", user.getUname());
				return "forward:/houseControl/paging.action";
			}

		} else {
			model.addAttribute("msg", "用户名密码错误！");
			return "forward:/WEB-INF/main/login.jsp";
		}

	}

	/**
	 * 登出
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping("/loginOff")
	public String loginOff(HttpSession session) {
		session.invalidate();
		return "forward:/WEB-INF/main/login.jsp";
	}

	@RequestMapping("/zhuce")
	public String zhuce() {
		return "forward:/WEB-INF/main/register.jsp";
	}

	@RequestMapping("/zhuce2")
	public String zhuce(User user) {
		userServiceInf.zhuce(user);
		return "forward:/WEB-INF/main/login.jsp";
	}

	@RequestMapping("/goLogin")
	public String goLogin() {
		return "forward:/WEB-INF/main/login.jsp";
	}

}
