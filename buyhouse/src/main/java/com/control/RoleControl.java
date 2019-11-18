package com.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.RoleServiceInf;
import com.vo.Role;
import com.vo.Role_Authority;
import com.vo.Tree;
import com.vo.Users;

@Controller
@RequestMapping("roleControl")
public class RoleControl {

	@Autowired
	private RoleServiceInf roleServiceInf;

	/**
	 * 跳转到角色管理列表页
	 * 
	 * @return 角色管理列表页
	 */
	@RequestMapping("gotoRoleList")
	public String gotoRoleList() {
		// 先去查，在往页面上带值
		return "forward:/roleControl/selectRole.action";
	}

	/**
	 * 查询所有角色
	 * 
	 * @return 角色管理列表页
	 */
	@RequestMapping("selectRole")
	public String selectRole(Model model) {

		String str = "/paike/roleList";
		try {
			// 所有角色带到页面上
			List<Role> roleList = roleServiceInf.selectRole();
			model.addAttribute("roleList", roleList);
		} catch (Exception e) {
			str = "forward:/WEB-INF/error/error.jsp";
		}
		return str;

	}

	/**
	 * 跳转到角色管理添加页面
	 * 
	 * @return 角色管理添加页面
	 */
	@RequestMapping("gotoAddRole")
	public String gotoAddRole(Model Role) {
		return "/paike/addrole";
	}

	/**
	 * 根据角色id,查找角色信息
	 * 
	 * @return 角色管理列表页
	 */
	@RequestMapping("getAuthIdByRoleid")
	public String getAuthIdByRoleid(int role_id, Model model) {
		String str = "/paike/updaterole";
		try {
			// 根据角色id,查找角色信息
			Role role = roleServiceInf.selectRoleByid(role_id);
			model.addAttribute("role", role);
			// 根据角色id查询出权限(从role_authority 张表里查)
			List<Role_Authority> list = roleServiceInf.getAuthIdByRoleid(role_id);
			int[] authidarr = new int[list.size()];
			if (list.size() > 0) {
				for (int i = 0; i < list.size(); i++) {
					Role_Authority ra = list.get(i);
					authidarr[i] = ra.getAUTHORITY_ID();
				}
			}
			// 把权限以数组形式 带到updaterole.jsp页面上去
			model.addAttribute("authidarr", authidarr);
		} catch (Exception e) {
			e.printStackTrace();
			str = "forward:/WEB-INF/error/error.jsp";
		}
		return str;

	}

	// ==========================权限树相关方法=====================================================
	/**
	 * 权限树
	 * 
	 * @return 注册跳转页面 JSON的格式 [
	 *         {"id":"01","text":"一班","children":[{"id":"001","text":"张一",
	 *         "children":null}, {"id":"002","text":"张二","children":null} ]},
	 *         {"id":"02","text":"二班","children":[{"id":"003","text":"张三",
	 *         "children":null}]}, {"id":"03","text":"三班","children":null} ]
	 * 
	 */
	@RequestMapping("getTreeData")
	@ResponseBody
	public List<Tree> getTreeData(HttpServletRequest request, HttpServletResponse response, Tree tree) {
		return roleServiceInf.getTreeData(request, response, tree);

	}

	/**
	 * 添加角色对应的权限
	 * 
	 * @param authid
	 *            权限ID
	 * @param roleid
	 *            角色ID
	 */
	@RequestMapping("addRoleAuthority")
	public String addRoleAuthority(Role role, String auid, HttpSession session) {
		System.out.println("fdff");
		String str = "forward:/roleControl/gotoRoleList.action";
		try {
//			Users users = (Users) session.getAttribute("user");
			Users users = new Users();
			users.setUserid(1);
			users.setUsername("1");
			users.setPwd("1");
			roleServiceInf.addRoleAuthority(role, auid, users);
		} catch (Exception e) {
			e.printStackTrace();
			str = "forward:/WEB-INF/error/error.jsp";
		}
		return str;
	}

	/**
	 * 修改角色对应的权限
	 * 
	 * @return 角色对应的权限管理列表页
	 */
	@RequestMapping("updateRoleAuthority")
	public String updateRoleAuthority(Role role, String auid, HttpSession session) {
		String str = "forward:/roleControl/selectRole.action";
		try {
			Users users = (Users) session.getAttribute("user");
			roleServiceInf.updateAuthority(role, auid, users);
		} catch (Exception e) {
			e.printStackTrace();
			str = "forward:/WEB-INF/error/error.jsp";
		}
		return str;
	}
	
	/**
	 * 去打印页面
	 * @return
	 */
	@RequestMapping("gotoPrint")
	public String gotoPrint(){
		return "/paike/print";
	}

}
