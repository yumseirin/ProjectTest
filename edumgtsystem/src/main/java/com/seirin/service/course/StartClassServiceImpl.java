package com.seirin.service.course;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seirin.dao.course.StartClassDaoInf;
import com.seirin.dao.employee.EmployeeDaoInf;
import com.seirin.vo.course.ClassRoom;
import com.seirin.vo.course.StartClass;
import com.seirin.vo.employee.Employee;

@Service
public class StartClassServiceImpl implements StartClassServiceInf {
	@Autowired
	private StartClassDaoInf startClassDaoInf;

	@Autowired
	private EmployeeDaoInf employeeDaoInf;

//	private ClassRoomDaoInf classRoomDaoInf;

	/**
	 * 查询所有符合条件的讲师
	 * 
	 * @param startclass
	 * @return 讲师的员工集合
	 */
	public List<Employee> selectClasstutor(StartClass startclass) {
		return startClassDaoInf.selectClasstutor(startclass);
	}

	/**
	 * 查询所有符合条件的助教
	 * 
	 * @param startclass
	 * @return 助教的员工集合
	 */
	public List<Employee> selectTeahingassient(StartClass startclass) {
		return startClassDaoInf.selectTeahingassient(startclass);
	}

	/**
	 * 查询所有符合条件的班主任
	 * 
	 * @param startclass
	 * @return 班主任的员工集合
	 */
	public List<Employee> selectTeacher(StartClass startclass) {
		return startClassDaoInf.selectTeacher(startclass);
	}

	/**
	 * 查询所有符合条件的教室
	 * 
	 * @param startclass
	 * @return 教室集合
	 */
	public List<ClassRoom> selectClassRoomByStartClass(StartClass startclass) {
		return startClassDaoInf.selectClassRoomByStartClass(startclass);
	}

	/**
	 * 添加开班信息
	 * 
	 * @param startclass
	 */
	public void addStartClass(StartClass startclass) {
		Format format = new SimpleDateFormat("yyyyMMdd");
		String str = format.format(startclass.getStartclass_sstarttime());
		str = str + "00" + startclass.getClassroom_cid().toString();
		startclass.setStartclass_sno(str);// 班级编号
		startClassDaoInf.addStartClass(startclass);
		// 给讲师添加所带班数
		int classtutor_id = startclass.getStartclass_classtutor();
		Employee classtutor = employeeDaoInf.selectEmployeeByid(classtutor_id);
		classtutor.setEmployee_num(classtutor.getEmployee_num() + 1);
		employeeDaoInf.updateEmployeeNumById(classtutor);
		// 给助教添加所带班数
		int teahingassient_id = startclass.getStartclass_teahingassient();
		Employee teahingassient = employeeDaoInf.selectEmployeeByid(teahingassient_id);
		teahingassient.setEmployee_num(teahingassient.getEmployee_num() + 1);
		employeeDaoInf.updateEmployeeNumById(teahingassient);
		// 给班主任添加所带班数
		int teacher_id = startclass.getStartclass_teacher();
		Employee teacher = employeeDaoInf.selectEmployeeByid(teacher_id);
		teacher.setEmployee_num(teacher.getEmployee_num() + 1);
		employeeDaoInf.updateEmployeeNumById(teacher);
		// 设置所用教室状态为不可用
//		classRoomDaoInf.updateClassRoomStatus(startclass.getClassroom_cid(),Integer.toString(MessageUtil.CLASSROM_CSTATUS_BUKEYONG));

	}

	/**
	 * 查找该方向开班最低周数
	 * 
	 * @param startclass
	 * @return
	 */
	public int selectTechTime(StartClass startclass) {
		return startClassDaoInf.selectTechTime(startclass);
	}
}
