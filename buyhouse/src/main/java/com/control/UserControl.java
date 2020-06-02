package com.control;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.UserServiceInf;
import com.vo.User;

@Controller
@RequestMapping("/userControl")
public class UserControl {

	@Autowired
	private UserServiceInf userServiceInf;
	@Autowired
	private EmployeeRoleServiceInf employeeRoleServiceInf;

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

	/**
	 * 登录验证
	 * 
	 * @param users
	 *            用户信息实体类，这个类要实现Serializable接口
	 * @return 返回一个JSON串 因为后台用了JackJson技术 ,并且这里用到了@ResponseBody标签
	 */
	@RequestMapping("/isLoginNamePwd")
	@ResponseBody
	public Users isLoginNamePwd(String username, String pwd) {
		System.out.println(username + "," + pwd);
		Users users = new Users();
		users.setUserid(1);
		users.setUsername("1");
		users.setPwd("1");
		if (username.equals(users.getUsername()) && pwd.equals(users.getPwd()))
			return users;
		return null;
	}

	/**
	 * 登录验证
	 * 
	 * @param users
	 *            用户信息实体类，这个类要实现Serializable接口
	 * @return 返回一个JSON串 因为后台用了JackJson技术 ,并且这里用到了@ResponseBody标签
	 */
	@RequestMapping("isLoginNamePwd2")
	@ResponseBody
	public Employee isLoginNamePwd2(Employee employee, HttpSession session) {
		Employee e = new Employee();
		e.setEmployee_id(1);
		e.setEmployee_loginname("1");
		e.setEmployee_password("1");
		Employee em = null;
		if (employee.getEmployee_loginname().equals(e.getEmployee_loginname())
				&& employee.getEmployee_password().equals(e.getEmployee_password()))
			em = e;
		if (em != null) {
			session.setAttribute("user", em);

			// ==========用户的角色和权限（左边菜单右边按钮）==================

			// 根据员工id查询出一级分类,二级分类,三级分类
			List<Authority> oneList = employeeRoleServiceInf.selectOne(em.getEmployee_id());
			List<Authority> twoList = employeeRoleServiceInf.selectTwo(em.getEmployee_id());
			List<Authority> threeList = employeeRoleServiceInf.selectThree(em.getEmployee_id());

			ServletContext sc = session.getServletContext();
			sc.setAttribute("oneFenlei", oneList);
			sc.setAttribute("twoFenlei", twoList);
			sc.setAttribute("threeFenlei", threeList);

		}
		return em;
	}

}
