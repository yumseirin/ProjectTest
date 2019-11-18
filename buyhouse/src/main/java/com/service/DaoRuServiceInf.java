package com.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.vo.Department;
import com.vo.Employee;
import com.vo.Position;
import com.vo.Role;
 

public interface DaoRuServiceInf {

	public int daoru(MultipartFile file, HttpSession session,Employee  employ,Role role) throws Exception;
	/**
	 * 根据部门查询出职称
	 * @param Position职称信息
	 */
	public  List<Position>    selectDepatByposition(Department  deptid);
	
	/**
     * 导出所有学生的信息
     */
	public List<Employee> daochu();
	

}
