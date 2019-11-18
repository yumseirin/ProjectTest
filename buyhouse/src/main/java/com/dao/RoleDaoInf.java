package com.dao;

import java.util.List;

import com.vo.Authority;
import com.vo.Role;
import com.vo.Role_Authority;

public interface RoleDaoInf {
	/**
	 * 添加角色 ok
	 * 
	 * @param position角色对象
	 */
	public void addRole(Role role);

	/**
	 * 查询所有角色 ok
	 * 
	 * @return 角色列表页
	 */
	public List<Role> selectRole();

	/**
	 * 按条件查询角色
	 * 
	 * @return 角色列表页
	 */
	public List<Role> selectRoleByInfo(Role role);

	/**
	 * 根据角色id,查询角色信息 ok
	 * 
	 * @return 角色列表页
	 */

	public Role selectRoleByid(int role_id);

	// ==========================权限树相关方法==============================

	/**
	 * 查询出主菜单
	 * 
	 * @return
	 */
	public List<Authority> getZhuAuthority();

	/**
	 * 查询出子菜单
	 * 
	 * @return
	 */
	public List<Authority> getZiAuthority(int parentid);

	/**
	 * 查询出按钮菜单
	 * 
	 * @return
	 */
	public List<Authority> getAnNiuAuthority(int parentid);

	/**
	 * 添加角色对应的权限
	 * 
	 * @param authid
	 *            权限ID
	 * @param roleid
	 *            角色ID
	 */
	public void addRole_Authority(String authid, int roleid);

	/**
	 * 根据角色id查询出权限
	 * 
	 * @param role_id
	 *            角色id
	 * @param request
	 * @return
	 */
	public List<Role_Authority> getAuthIdByRoleid(int role_id);

	/**
	 * 删除某个角色对应的权限
	 * 
	 * @param roleid
	 *            角色ID
	 */
	public void deleteAuthority(int roleid);

	/**
	 * 修改角色
	 * 
	 * @param role
	 *            角色对象
	 */
	public void updateRole(Role role);
}
