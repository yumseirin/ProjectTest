package com.seirin.control.employee;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.seirin.service.employee.EmployeeServiceInf;
import com.seirin.service.sysmgt.EmployeeRoleServiceInf;
import com.seirin.vo.employee.Employee;
import com.seirin.vo.sysmgt.Authority;

@Controller
@RequestMapping("loginControl")
public class LoginControl {

	@Autowired
	private EmployeeServiceInf employeeServiceInf;
	@Autowired
	private EmployeeRoleServiceInf employeeRoleServiceInf;

	/**
	 * 跳转到index.jsp页面
	 * 
	 * @return
	 */
	@RequestMapping("gotoIndex")
	public String gotoIndex() {

		return "/index";

	}

	/**
	 * 登录验证
	 * 
	 * @param employee 员工实体类，这个类要实现Serializable接口
	 * @return 返回一个JSON串 因为后台用了JackJson技术 ,并且这里用到了@ResponseBody标签
	 */
	@RequestMapping("isLoginNamePwd")
	@ResponseBody
	public Employee isLoginNamePwd(Employee employee, HttpSession session) {

		Employee em = employeeServiceInf.isLoginNamePwd(employee);
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
	
	/**
	 * 登出
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping("loginOff")
	public String loginOff(HttpSession session) {
		session.invalidate();
		return "redirect:/login.jsp";
	}
}
