package com.seirin.service.course;

import java.io.InputStream;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.seirin.dao.course.CoursesysDaoInf;
import com.seirin.vo.course.Coursesys;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;

@Service
public class CoursesysServiceImpl implements CoursesysServiceInf {

	@Autowired
	private CoursesysDaoInf courseServiceDaoInf;

	/**
	 * 查询所有课程体系
	 * 
	 * @return 课程体系集合
	 */
	public List<Coursesys> selectCoursesys() {
		List<Coursesys> list = courseServiceDaoInf.selectCoursesys();
		System.out.println(list);
		return list;
	}

	/**
	 * 根据ID查询课程体系
	 * 
	 * @param coursesys_csid
	 * @return 课程体系
	 */
	public Coursesys selectCoursesysById(int coursesys_csid) {
		return courseServiceDaoInf.selectCoursesysById(coursesys_csid);
	}
	
	/**
	 * 根据id删除课程体系
	 * 
	 * @param coursesys_csid
	 */
	public void deleteCoursesys(int coursesys_csid) {
		courseServiceDaoInf.deleteCoursesysById(coursesys_csid);
	}

	/**
	 * 导入添加课程体系,读取文件中的信息
	 * 
	 * @param files
	 * @param coursesys
	 * @return
	 */
	public int daorucoursesys(MultipartFile file, Coursesys coursesys) throws Exception {
		int count = 0;
		Workbook readwb = null;
		String cs = "";// 排序字段coursesys_systempath
//		@SuppressWarnings("unused")
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if (!file.isEmpty()) {
			InputStream instream = file.getInputStream();
			readwb = Workbook.getWorkbook(instream);
			Sheet readsheet = readwb.getSheet(0);
			// 多少列
			int rsColumns = readsheet.getColumns();
			// 多少行
			int rsRows = readsheet.getRows();
			// 循环每一行,第2行开始i=1
			for (int i = 1; i < rsRows; i++) {

				// 取每一行的各个列的值放在一个实体类对象中。
				for (int j = 0; j < rsColumns; j++) {
					// getCell(j, i) ---> j是列数，i是行数
					Cell cell = readsheet.getCell(j, i);
					switch (j) {
					case 0:
						cs = cs + cell.getContents() + ",";
						continue;
					case 1:
						cs = cs + cell.getContents() + ",";
						continue;
					default:
						break;
					}
				}

			}

			coursesys.setCoursesys_systempath(cs);
			Coursesys coursesysold = courseServiceDaoInf.selectCoursesysByTechAndCsid(coursesys);
			// 根据coursesys_csid程体系编号和技术方向tech_id来判断
			if (coursesys.getCoursesys_csid() != null) {// 修改页面进入
				if (coursesysold != null) {// 已有其他课程体系使用了该技术方向
					// 删除已有其他课程体系，修改该课程体系
					courseServiceDaoInf.deleteCoursesysById(coursesysold.getCoursesys_csid());
					courseServiceDaoInf.updateCoursesysById(coursesys);
					count++;
				} else {// 无其他课程体系使用了该技术方向
					// 修改该课程体系
					courseServiceDaoInf.updateCoursesysById(coursesys);
					count++;
				}
			} else {// 添加页面进入
				if (coursesysold != null) {// 该技术方向已有课程体系
					// 获得已有课程体系的id，修改该课程体系
					coursesys.setCoursesys_csid(coursesysold.getCoursesys_csid());
					courseServiceDaoInf.updateCoursesysById(coursesys);
					count++;
				} else {// 该技术方向无课程体系
					// 添加新的课程体系
					courseServiceDaoInf.addCoursesys(coursesys);
					count++;
				}
			}
		}
		return count;
	}
}
