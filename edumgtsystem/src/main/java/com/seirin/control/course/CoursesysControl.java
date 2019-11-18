package com.seirin.control.course;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.seirin.service.course.CoursesysServiceInf;
import com.seirin.service.employee.TechServiceInf;
import com.seirin.util.MessageUtil;
import com.seirin.vo.course.Coursesys;
import com.seirin.vo.employee.JsonStr;
import com.seirin.vo.employee.Tech;

import jxl.Workbook;
import jxl.format.Alignment;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

@Controller
@RequestMapping("coursesysControl")
public class CoursesysControl {

	@Autowired
	private CoursesysServiceInf coursesysServiceInf;

	@Autowired
	private TechServiceInf techServiceInf;

	/**
	 * 去课程体系页面
	 * 
	 * @return 课程体系页面
	 */
	@RequestMapping("gotocoursesysList")
	public String gotocoursesysList() {
		return "forward:/coursesysControl/selectCoursesys.action";
	}

	/**
	 * 查询课程体系
	 * 
	 * @param model
	 * @return 课程体系页面
	 */
	@RequestMapping("selectCoursesys")
	public String selectCoursesys(Model model) {
		String str = "/course/coursesysList";
		try {
			List<Coursesys> coursesyslist = coursesysServiceInf.selectCoursesys();
			model.addAttribute("coursesyslist", coursesyslist);
		} catch (Exception e) {
			e.printStackTrace();
			str = "/error/error";
		}
		return str;
	}

	/**
	 * 跳转添加课程体系页面
	 * 
	 * @param model
	 * @return 添加课程体系页面
	 */
	@RequestMapping("gotoAddCousesys")
	public String gotoAddCousesys(Model model) {
		List<Tech> techlist = techServiceInf.selectTech();
		model.addAttribute("techlist", techlist);
		return "/course/addcoursesys";
	}

	/**
	 * 去修改课程体系页面
	 * 
	 * @param coursesys_csid
	 * @param model
	 * @return 修改课程体系页面
	 */
	@RequestMapping("gotoUpdateCoursesys")
	public String gotoUpdateCoursesys(Model model, int coursesys_csid) {
		List<Tech> techlist = techServiceInf.selectTech();
		model.addAttribute("techlist", techlist);
		Coursesys coursesys = coursesysServiceInf.selectCoursesysById(coursesys_csid);
		model.addAttribute("coursesys", coursesys);
		return "/course/updatecoursesys";
	}

	/**
	 * 根据id删除课程体系
	 * 
	 * @param coursesys_csid
	 * @return
	 */
	@RequestMapping("deleteCoursesys")
	public String deleteCoursesys(int coursesys_csid) {
		String str = "forward:/coursesysControl/selectCoursesys.action";
		try {
			coursesysServiceInf.deleteCoursesys(coursesys_csid);
		} catch (Exception e) {
			e.printStackTrace();
			str = "/error/error";
		}
		return str;
	}

	/**
	 * 导入课程体系
	 * 
	 * @param files
	 * @param coursesys
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/daorucoursesys")
	public JsonStr daorucoursesys(@RequestParam("upload") MultipartFile files, Coursesys coursesys) {
		JsonStr json = new JsonStr();
		try {
			int count = coursesysServiceInf.daorucoursesys(files, coursesys);
			json.setSuccess(true);
			json.setMsg(MessageUtil.DAORU_SUCCESS + count + "条");

		} catch (Exception e) {
			e.printStackTrace();
			json.setSuccess(false);
			json.setMsg(MessageUtil.DAORU_FAIL + e.getMessage());
		}
		System.out.println(json);
		return json;
	}

	/**
	 * 导出课程体系
	 * 
	 * @param response
	 */
	@RequestMapping("/daochuCousesys")
	public void daochuCousesys(HttpServletResponse response, int coursesys_csid) {
		// 得到要导出的数据
		Coursesys coursesys = coursesysServiceInf.selectCoursesysById(coursesys_csid);
		// 得到排序字段
		String systempath = coursesys.getCoursesys_systempath();
		// 按,分割排序字段
		String[] splitsp = systempath.split(",");
		try {
			// 文件名
			String filename = coursesys.getCoursesys_csname() + "(" + coursesys.getTech_tname() + ")";
			String fileName = new String(filename.getBytes(), "iso-8859-1") + ".xls";
			response.setContentType("application/x-excel");
			response.setCharacterEncoding("UTF-8");
			response.addHeader("Content-Disposition", "attachment;filename=" + fileName);// excel文件名
			// 1.创建excel文件
			WritableWorkbook book = Workbook.createWorkbook(response.getOutputStream());
			// 居中
			WritableCellFormat wf = new WritableCellFormat();
			wf.setAlignment(Alignment.CENTRE);
			// 2.创建sheet
			WritableSheet sheet = book.createSheet("标准课程体系", 0);
			// 3.添加第一行标题数据
			// (0,0) ---( 列[从0开始],行[从0开始] ）
			sheet.addCell(new Label(0, 0, "课程名称（不超10字）", wf));
			sheet.addCell(new Label(1, 0, "课程周数（正整数，例如：4）", wf));
			// 4.设置单元格的宽度
			sheet.setColumnView(0, 30);
			sheet.setColumnView(1, 30);
			for (int x = 0, i = 0; x < splitsp.length; x = x + 2, i++) {
				// 5.添加具体数据
				// if (x % 2 == 0)
				sheet.addCell(new Label(0, i + 1, splitsp[x], wf));
				// if (x % 2 != 0)
				sheet.addCell(new Label(1, i + 1, splitsp[x + 1], wf));
			}
			// 6.从内存中写入文件中
			book.write();
			// 7.关闭资源，释放内存
			book.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
