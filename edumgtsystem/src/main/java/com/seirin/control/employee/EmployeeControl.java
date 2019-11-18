package com.seirin.control.employee;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.seirin.service.area.AreaServiceInf;
import com.seirin.service.area.DepartmentServiceInf;
import com.seirin.service.area.PositionServiceInf;
import com.seirin.service.employee.EmployeeServiceInf;
import com.seirin.service.employee.TechServiceInf;
import com.seirin.service.sysmgt.RoleServiceInf;
import com.seirin.util.Fenye;
import com.seirin.vo.area.Area;
import com.seirin.vo.area.Department;
import com.seirin.vo.area.Position;
import com.seirin.vo.employee.Employee;
import com.seirin.vo.employee.Tech;
import com.seirin.vo.sysmgt.Role;

/**
 * @Description: 用户管理
 */
@Controller
@RequestMapping("employeeControl")
public class EmployeeControl {

	@Autowired
	private EmployeeServiceInf employeeServiceInf; // 员工

	@Autowired
	private AreaServiceInf areaServiceInf; // 区域

	@Autowired
	private PositionServiceInf positionServiceInf; // 职称

	@Autowired
	private DepartmentServiceInf departmentServiceInf; // 部门

	@Autowired
	private TechServiceInf TechServiceInf;// 技术方向

	@Autowired
	private RoleServiceInf roleServiceInf;// 角色

	/**
	 * 跳转到用户管理列表页
	 * 
	 * @return 用户管理列表页
	 */
	@RequestMapping("gotoEmployeeList")
	public String gotoEmployeeList() {
		// 先去查，在往页面上带值
		return "forward:/employeeControl/selectEmployeePaging.action";
	}

	/**
	 * 查询所有用户
	 * 
	 * @return 用户列表页
	 */
	@RequestMapping("selectEmployee")
	public String selectEmployee(Employee employee, Model model) {
		String str = "/employee/employeeList";
		try {
			// 所有员工
			List<Employee> employeelist = employeeServiceInf.selectEmployee(employee);
			model.addAttribute("employeelist", employeelist);

		} catch (Exception e) {
			e.printStackTrace();
			str = "/error/error";
		}
		return str;
	}

	/**
	 * 查询所有用户
	 * 
	 * @return 用户列表页
	 */
	@RequestMapping("selectEmployeePaging")
	public String selectEmployeePaging(String employee_name,Integer page, Model model) {
		String str = "/employee/employeeList";
		try {
			// =============================================
			// 1.当前页： 前台JSP上传过来的页数
			// 2.如果 当前页<1 ，那么当前页=第1页
			if (page ==null ||"".equals(page)|| page < 1) {
				page = Fenye.currentpage;// 获取不到页数就为1
			}
			// 3.总记录数 : select count(*) from 表名
			int totalCount = employeeServiceInf.selectRowCount(employee_name);
			// 4.每页显示多少条 ： 给定一个值就可能
			int count = Fenye.Onepagecount;
			// 5.返回总页数=（总记录数-1）/一页显示多少行+1
			int totalPage = (totalCount - 1) / count + 1;
			// 6.如果当前页数>总页数，那么当前页=总页数
			if (page > totalPage) {
				page = totalPage;
			}
			// 7.起始条数=（当前页数-1）*每页要显示的记录数+1
			int startrow = (page - 1) * count + 1;
			// 8.结束条数=起始条数+每页要显示的记录数
			int endrow = startrow + count - 1;
			// 分页后的数据带到页面显示
			// =============================================
			// 所有员工
			List<Employee> employeelist = employeeServiceInf.selectEmployeePaging(employee_name, startrow, endrow);

			model.addAttribute("employeelist", employeelist);
			model.addAttribute("totalCount", totalCount);// 总条数
			model.addAttribute("totalPage", totalPage);// 总页数
			model.addAttribute("page", page);// 第几页
			model.addAttribute("employee_name", employee_name);
		} catch (Exception e) {
			e.printStackTrace();
			str = "/error/error";
		}
		return str;
	}

	/**
	 * 根据员工id,查找员工信息
	 * 
	 * @return 员工管理列表页
	 */
	@RequestMapping("getEmploeeById")
	public String getEmploeeById(int employee_id, Model model) {
		String str = "/employee/updateemployee";
		try {
			// 根据员工id,查找员工信息
			Employee employee = employeeServiceInf.selectEmployeeByid(employee_id);
			model.addAttribute("employee", employee);
			// 所有区域带到页面上
			List<Area> arealist = areaServiceInf.selectArea();
			model.addAttribute("arealist", arealist);
			// 把区域所对应的部门带到页面上
			List<Department> departmentlist = departmentServiceInf
					.selectDepartmentByAreaid(employee.getEmployee_area());
			model.addAttribute("departmentlist", departmentlist);
			// 把部门所有的职称带到页面上
			List<Position> positionlist = positionServiceInf.selectPositionByDeptid(employee.getEmployee_dept());
			model.addAttribute("positionlist", positionlist);
			// 把所有技术方向带到页面上
			List<Tech> techlist = TechServiceInf.selectTech();
			model.addAttribute("techlist", techlist);

		} catch (Exception e) {
			e.printStackTrace();
			str = "/error/error";
		}
		return str;
	}

	/**
	 * 跳转到添加员工页面
	 * 
	 * @return 员工页面
	 */
	@RequestMapping("gotoAddEmployee")
	public String gotoAddEmployee(Model model) {
		String str = "/employee/addemployee";
		try {
			// 先去查，在往页面上带值
			// 所有区域
			List<Area> area = areaServiceInf.selectArea();
			model.addAttribute("area", area);
			// 所有部门
			List<Department> department = departmentServiceInf.selectDepartment();
			model.addAttribute("department", department);
			// 所有职称
			List<Position> position = positionServiceInf.selectPosition();
			model.addAttribute("position", position);
			// 所有技术方向
			List<Tech> tech = TechServiceInf.selectTech();
			model.addAttribute("tech", tech);
		} catch (Exception e) {
			e.printStackTrace();
			str = "/error/error";
		}
		return str;

	}

	/**
	 * 添加员工
	 * 
	 * @return 员工列表页面
	 */
	@RequestMapping("addEmployee")
	public String addEmployee(Model model, Employee employee) {
		String str = "forward:/employeeControl/gotoEmployeeList.action";
		try {
			List<Employee> employeelist = employeeServiceInf.addEmployee(employee);
			model.addAttribute("employeelist", employeelist);
		} catch (Exception e) {
			e.printStackTrace();
			str = "/error/error";
		}
		return str;
	}

	/**
	 * 修改员工信息
	 * 
	 * @return 员工管理列表页
	 */
	@RequestMapping("updateEmployee")
	public String updateEmployee(Employee employee, HttpSession session) {
		String str = "forward:/employeeControl/gotoEmployeeList.action";
		try {
//			Employee users = (Employee)session.getAttribute("user");
			employeeServiceInf.updateEmployee(employee);
		} catch (Exception e) {
			e.printStackTrace();
			str = "/error/error";
		}
		return str;
	}

	/**
	 * 跳转到批量导入员工页面
	 * 
	 * @return 员工页面
	 */
	@RequestMapping("gotoDaoruEmployee")
	public String gotoDaoruEmployee(Model model) {
		String str = "/employee/daoruemployee";
		try {
			// 先去查，在往页面上带值
			// 所有区域
			List<Area> area = areaServiceInf.selectArea();
			model.addAttribute("area", area);
			// 所有部门
			List<Department> department = departmentServiceInf.selectDepartment();
			model.addAttribute("department", department);
			// 所有职称
			List<Position> position = positionServiceInf.selectPosition();
			model.addAttribute("position", position);
			// 所有技术方向
			List<Tech> tech = TechServiceInf.selectTech();
			model.addAttribute("tech", tech);

			// 所属角色
			List<Role> role = roleServiceInf.selectRole();
			model.addAttribute("role", role);
		} catch (Exception e) {
			e.printStackTrace();
			str = "/error/error";
		}
		return str;
	}
}
