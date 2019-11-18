package com.control;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.service.DaoRuServiceInf;
import com.vo.Department;
import com.vo.Employee;
import com.vo.JsonStr;
import com.vo.Position;
import com.vo.Role;

import jxl.Workbook;
import jxl.format.Alignment;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

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
			json.setMsg("导入成功" + count + "条");

		} catch (Exception e) {
			e.printStackTrace();
			json.setSuccess(false);
			json.setMsg("导入失败" + e.getMessage());
			// logger.error(e.getMessage());
		}
		System.out.println(json);
		return json;
	}
	
	@RequestMapping("/daochu")
	public void daochu(HttpServletResponse response) {
         // 文件名
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String fileName = sdf.format(new Date()) + ".xls";
       
		response.setContentType("application/x-excel");
		response.setCharacterEncoding("UTF-8");
		response.addHeader("Content-Disposition", "attachment;filename=" + fileName);// excel文件名
         //得到要导出的数据
		List<Employee> employeeList = this.daoRuServiceInf.daochu();
		try {
			// 1.创建excel文件
			WritableWorkbook book = Workbook.createWorkbook(response.getOutputStream());
			// 居中
			WritableCellFormat wf = new WritableCellFormat();
			wf.setAlignment(Alignment.CENTRE);
			// 2.创建sheet
			 WritableSheet sheet = book.createSheet("学生信息表", 0);
			// 3.添加第一行标题数据
			// (0,0) ---( 列[从0开始],行[从0开始] ）
			sheet.addCell(new Label(0, 0, "姓名", wf));
			sheet.addCell(new Label(1, 0, "ID", wf));
			sheet.addCell(new Label(2, 0, "登录名", wf));
			// 4.设置单元格的宽度
			sheet.setColumnView(0, 30);
			sheet.setColumnView(1, 30);
			sheet.setColumnView(2, 30);
			for (int i = 0; i < employeeList.size(); i++) {
				Employee employee = employeeList.get(i);
				// 5.添加学生具体数据
				sheet.addCell(new Label(0, i + 1, employee.getEmployee_name(), wf));
				sheet.addCell(new Label(1, i + 1, employee.getEmployee_id() + "", wf));
				sheet.addCell(new Label(2, i + 1, employee.getEmployee_loginname(), wf));
			}
			// 6.从内存中写入文件中
			book.write();
			// 7.关闭资源，释放内存
			book.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
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
