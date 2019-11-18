package com.seirin.control.employee;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.seirin.service.employee.DaoRuServiceInf;
import com.seirin.util.MessageUtil;
import com.seirin.vo.area.Department;
import com.seirin.vo.area.Position;
import com.seirin.vo.employee.Employee;
import com.seirin.vo.employee.JsonStr;
import com.seirin.vo.sysmgt.Role;

@Controller
@RequestMapping("/daoRuControl")
public class DaoRuControl {

	@Autowired
	private DaoRuServiceInf daoRuServiceInf;

	@ResponseBody
	@RequestMapping("/daoru")
	public JsonStr daoru(@RequestParam("upload") MultipartFile files, HttpSession session, Employee employ, Role role) {
		JsonStr json = new JsonStr();
		try {
			int count = daoRuServiceInf.daoru(files, session, employ, role);
			json.setSuccess(true);
			json.setMsg(MessageUtil.DAORU_SUCCESS + count + "条");

		} catch (Exception e) {
			e.printStackTrace();
			json.setSuccess(false);
			json.setMsg(MessageUtil.DAORU_FAIL + e.getMessage());
			// logger.error(e.getMessage());
		}
		System.out.println(json);
		return json;
	}

	/**
	 * 根据部门查询出职称
	 * 
	 * @param Position职称信息
	 */
	@RequestMapping("selectDepatByposition")
	@ResponseBody
	public List<Position> selectDepatByposition(Department deptid) {
		List<Position> list = daoRuServiceInf.selectDepatByposition(deptid);
		return list;
	}

}
