package com.seirin.service.employee;

import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import com.seirin.dao.employee.DaoruDaoInf;
import com.seirin.util.MessageUtil;
import com.seirin.vo.employee.Employee;
import com.seirin.vo.area.Department;
import com.seirin.vo.area.Position;
import com.seirin.vo.sysmgt.Role;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;

@Service
public class DaoRuServiceImpl implements DaoRuServiceInf {

	@Autowired
	private DaoruDaoInf daoruDaoInf;

	/**
	 * 读取文件中的信息
	 */
	public int daoru(MultipartFile file, HttpSession session, Employee employ, Role role) throws Exception {
		int count = 0;
		Workbook readwb = null;
		@SuppressWarnings("unused")
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if (!file.isEmpty()) {
			InputStream instream = file.getInputStream();
			readwb = Workbook.getWorkbook(instream);
			Sheet readsheet = readwb.getSheet(0);
			// 多少列
			int rsColumns = readsheet.getColumns();
			// 多少行
			int rsRows = readsheet.getRows();
			// 循环每一行
			for (int i = 1; i < rsRows; i++) {

				Employee employee = new Employee();
				// 取每一行的各个列的值放在一个实体类对象中。
				for (int j = 0; j < rsColumns; j++) {
					// getCell(j, i) ---> j是列数，i是行数
					Cell cell = readsheet.getCell(j, i);
					switch (j) {
					case 0:
						employee.setEmployee_name(cell.getContents());
						continue;
					case 1:
						employee.setEmployee_loginname(cell.getContents());
						continue;
					case 2:
						employee.setEmployee_password(cell.getContents());
						continue;
					case 3:
						////////////////////////
						//employee.setEmployee_sex(cell.getContents());
						if(cell.getContents().equals("男"))
							employee.setEmployee_sex(Integer.toString(MessageUtil.EMPLOYEE_SEX_MAN));
						else
							employee.setEmployee_sex(Integer.toString(MessageUtil.EMPLOYEE_SEX_WOMAN));
						continue;
					case 4:
						//employee.setEmployee_attribute(cell.getContents());
						if(cell.getContents().equals("全职"))
							employee.setEmployee_attribute(Integer.toString(MessageUtil.EMPLOYEE_ATTRIBUTE_QUANZHI));
						else
							employee.setEmployee_attribute(Integer.toString(MessageUtil.EMPLOYEE_ATTRIBUTE_JIANZHI));
						continue;
					case 5:
						//employee.setEmployee_level(cell.getContents());
						if(cell.getContents().equals("初级"))
							employee.setEmployee_level(Integer.toString(MessageUtil.EMPLOYEE_LEVEL_CHUJI));
						else if(cell.getContents().equals("中级"))
							employee.setEmployee_level(Integer.toString(MessageUtil.EMPLOYEE_LEVEL_ZHONGJI));
						else
							employee.setEmployee_level(Integer.toString(MessageUtil.EMPLOYEE_LEVEL_GAOJI));
						continue;
					case 6:
						//employee.setEmployee_business(cell.getContents());
						if(cell.getContents().equals("是"))
							employee.setEmployee_business(Integer.toString(MessageUtil.EMPLOYEE_BUSINESS_JIESHOU));
						else
							employee.setEmployee_business(Integer.toString(MessageUtil.EMPLOYEE_BUSINESS_BUJIESHOU));
						continue;
					case 7:
						employee.setEmployee_tel(cell.getContents());
						continue;
					case 8:
						employee.setEmployee_wechat(cell.getContents());
						continue;
					default:
						break;
					}
				}
				// 根据学生的id来判断，数据库中有没有这个学生，有则更新，没有更添加
				Employee emp = daoruDaoInf.selectEmployeeByemployee_loginname(employee.getEmployee_loginname() + "");
				employee.setEmployee_area(employ.getEmployee_area());// 所属区域
				employee.setEmployee_dept(employ.getEmployee_dept());// 所属部门
				employee.setPosition_id(employ.getPosition_id());// 所属职称
				employee.setEmployee_tech(employ.getEmployee_tech());// 所属技术方向
				employee.setEmployee_num(0);

				if (emp != null) { // 更新
					// 1)更新员工表数据
					employee.setEmployee_update_time(new Date());
					daoruDaoInf.updateEmployee(employee);

					// 2)更新EMPLOYEE_ROLE表中数据，有就更没，没有就添加
					// role对象中有所属角色
					daoruDaoInf.updateEmployee_Role(emp.getEmployee_id(), role.getRole_id());

					count++;
				} else {//
					// 1)添加员工表数据
					employee.setEmployee_create_time(new Date());
					daoruDaoInf.insertEmployee(employee);

					// 2)向EMPLOYEE_ROLE表中添加数据
					// role对象中有所属角色
					daoruDaoInf.insertEmployee_Role(employee.getEmployee_id(), role.getRole_id());
					count++;
				}
				System.out.println(i + "行完了");
			} // 行循环完了
		}
		return count;
	}

	/**
	 * 根据部门查询出职称
	 * 
	 * @param Position 职称信息
	 */
	public List<Position> selectDepatByposition(Department deptid) {

		return daoruDaoInf.selectDepatByposition(deptid);
	}

}
