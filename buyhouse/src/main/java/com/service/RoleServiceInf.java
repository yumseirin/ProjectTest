package com.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vo.Role;
import com.vo.Role_Authority;
import com.vo.Tree;
import com.vo.Users;

public interface RoleServiceInf {
	/**
	 * 查询所有职称
	 * 
	 * @return 角色列表页
	 */
	public List<Role> selectRole();

	/**
	 * 根据角色称id,查询角色信息
	 * 
	 * @return 角色列表页
	 */

	public Role selectRoleByid(int role_id);

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
	public List<Tree> getTreeData(HttpServletRequest request, HttpServletResponse response, Tree tree);

	/**
	 * 添加角色对应的权限
	 * 
	 * @param authid
	 *            权限ID
	 * @param roleid
	 *            角色ID
	 */

	public void addRoleAuthority(Role role, String auid, Users users);

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
	 * 根据角色修改角色权限
	 * 
	 * @return
	 */
	public void updateAuthority(Role role, String authid, Users users);
}
