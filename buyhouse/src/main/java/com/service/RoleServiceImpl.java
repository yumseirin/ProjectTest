package com.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vo.Authority;
import com.dao.RoleDaoInf;
import com.service.RoleServiceInf;
import com.vo.Role;
import com.vo.Role_Authority;
import com.vo.Tree;
import com.vo.Users;

@Service
public class RoleServiceImpl implements RoleServiceInf {

	@Autowired
	private RoleDaoInf roleDaoInf;

	/**
	 * 查询所有职称
	 * 
	 * @return 角色列表页
	 */
	public List<Role> selectRole() {
		return roleDaoInf.selectRole();
	}

	/**
	 * 根据角色称id,查询角色信息
	 * 
	 * @return 角色列表页
	 */

	public Role selectRoleByid(int role_id) {
		return roleDaoInf.selectRoleByid(role_id);
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
	public List<Tree> getTreeData(HttpServletRequest request, HttpServletResponse response, Tree tree) {

		List<Tree> list = new ArrayList<Tree>();
		// 主菜单
		// =================查询出所有主菜单=======================================
		List<Authority> athorityList = roleDaoInf.getZhuAuthority();
		if (athorityList.size() > 0) {
			for (int i = 0; i < athorityList.size(); i++) {
				// 主菜单的信息放在Tree实体类对象中
				Tree model = new Tree();
				Authority authority = (Authority) athorityList.get(i);
				int authority_id = authority.getAUTHORITY_ID();
				String authority_name = authority.getAUTHORITY_NAME();
				model.setId(authority_id + "");
				model.setText(authority_name);

				// 子菜单
				// =================根据主菜单的id查询出相对应的子菜单========================================
				List<Authority> athorityList2 = roleDaoInf.getZiAuthority(authority_id);
				if (athorityList2.size() > 0) {
					List<Tree> childrenList = new ArrayList<Tree>();
					for (int j = 0; j < athorityList2.size(); j++) {
						// 子菜单的信息放在model2实体类中
						Tree model2 = new Tree();
						Authority auth = (Authority) athorityList2.get(j);
						int authid = auth.getAUTHORITY_ID();
						String authname = auth.getAUTHORITY_NAME();
						model2.setId(authid + "");
						model2.setText(authname);
						// 子菜单有多个，把多个子菜单放在Tree实体类对象中，把多个Tree实体类对象放在childrenList集合中
						childrenList.add(model2);
						// ==============根据子菜单查询出按钮菜单=========================================
						List<Authority> athorityList3 = roleDaoInf.getAnNiuAuthority(authid);
						if (athorityList3.size() > 0) {
							List<Tree> anniuList = new ArrayList<Tree>();
							for (int k = 0; k < athorityList3.size(); k++) {
								Tree model3 = new Tree();
								Authority auth2 = (Authority) athorityList3.get(k);
								int authid1 = auth2.getAUTHORITY_ID();
								String authname1 = auth2.getAUTHORITY_NAME();
								model3.setId(authid1 + "");
								model3.setText(authname1);
								// 按钮菜单有多个，把多个按钮菜单放Tree实体类对象中，多个Tree实体类对象放在anniuList集合中
								anniuList.add(model3);
							}
							// 把按钮菜单的集合，放在子菜单的Tree实体类对象中，相当于给按子菜单的实体类赋值
							model2.setChildren(anniuList);
						}
						// 把子菜单的集合，放在主菜单的model实体类中，相当于给主菜单的实体类赋值
						model.setChildren(childrenList);
					}
					// 把主菜单Tree实体类对象，放在最外层的一个集合中，用于显示树的json串用
					list.add(model);
				}
			}
		}
		return list;
	}

	/**
	 * 添加角色对应的权限
	 * 
	 * @param authid
	 *            权限ID
	 * @param roleid
	 *            角色ID
	 */
	public void addRoleAuthority(Role role, String auid, Users users) {

		// 1)向role 表中添加角色
		role.setRole_create_admin(users.getUserid());// 创建角色人的ID
		role.setRole_create_date(new Date());// 角色创建时间
		roleDaoInf.addRole(role);
		System.out.println(role.getRole_id());

		// 2)向role_authority表中添加角色拥有的权限
		System.out.println(auid);
		String[] arr = auid.split(",");
		for (int i = 0; i < arr.length; i++) {
			roleDaoInf.addRole_Authority(arr[i], role.getRole_id());
		}
	}

	/**
	 * 根据角色id查询出权限
	 * 
	 * @param role_id
	 *            角色id
	 * @param request
	 * @return
	 */
	public List<Role_Authority> getAuthIdByRoleid(int role_id) {
		return roleDaoInf.getAuthIdByRoleid(role_id);
	}

	/**
	 * 根据角色修改角色权限
	 * 
	 * @return
	 */
	public void updateAuthority(Role role, String authid, Users users) {

		// 1）根据roleid 去删除Role_Authority这个表中的信息

		roleDaoInf.deleteAuthority(role.getRole_id());

		// 2）再往Role_Authority表中添加信息
		String[] ids = authid.split(",");
		for (String id : ids) {
			roleDaoInf.addRole_Authority(id, role.getRole_id());
		}
		// 3)根据角色id,修改角色信息
		role.setRole_update_date(new Date());
//		role.setRole_update_admin(users.getUserid());
		role.setRole_update_admin(1);
		roleDaoInf.updateRole(role);

	}

}
