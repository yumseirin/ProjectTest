package com.seirin.service.course;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seirin.dao.course.BusinessDaoInf;
import com.seirin.util.MessageUtil;
import com.seirin.vo.course.ClassCourse;
import com.seirin.vo.course.StartClass;

@Service
public class BusinessServiceImpl implements BusinessServiceInf {

	@Autowired
	private BusinessDaoInf businessDaoInf;

	/**
	 * 查询所有班级
	 * 
	 * @return 班级集合
	 */
	public List<StartClass> selectClasses() {
		Date date = new Date();
		List<StartClass> list = businessDaoInf.selectClasses();
		for (StartClass i : list) {
			// 查询技术方向名
			i.setTech_tname(businessDaoInf.selectTechtname(i.getTech_id()));
			// 查询讲师、助教、班主任姓名
			i.setClasstutor_name(businessDaoInf.selectEmployeeNameById(i.getStartclass_classtutor()));
			i.setTeahingassient_name(businessDaoInf.selectEmployeeNameById(i.getStartclass_teahingassient()));
			i.setTeacher_name(businessDaoInf.selectEmployeeNameById(i.getStartclass_teacher()));
			// 判断当前时间是否处于开班时间内
			if (i.getStartclass_sstarttime().getTime() <= date.getTime()
					&& i.getStartclass_sendtime().getTime() >= date.getTime()) {
				// 当前时间在开班时间，班级状态应为上课中
				if (!i.getStartclass_sstatus().equals(String.valueOf(MessageUtil.STARTCLASS_STATUS_SHANGKE))) {
					// 如果状态为不是上课中，设置为 上课中0
					i.setStartclass_sstatus(String.valueOf(MessageUtil.STARTCLASS_STATUS_SHANGKE));
					businessDaoInf.updateClassesStatusById(i);
				}
			} // 当前时间在开班时间之前
			else if (i.getStartclass_sstarttime().getTime() >= date.getTime()) {
				if (!i.getStartclass_sstatus().equals(String.valueOf(MessageUtil.STARTCLASS_STATUS_WEIKAIKE))) {
					// 如果状态为不是未开课，设置为 未开课1
					i.setStartclass_sstatus(String.valueOf(MessageUtil.STARTCLASS_STATUS_WEIKAIKE));
					businessDaoInf.updateClassesStatusById(i);
				}
			} // 当前时间在结束时间之后
			else {
				if (!i.getStartclass_sstatus().equals(String.valueOf(MessageUtil.STARTCLASS_STATUS_JIEKE))) {
					// 如果状态为不是已结课，设置为 已结课2
					i.setStartclass_sstatus(String.valueOf(MessageUtil.STARTCLASS_STATUS_JIEKE));
					businessDaoInf.updateClassesStatusById(i);
				}
			}
		}
		return list;
	}

	/**
	 * 根据开班id查询课程表
	 * 
	 * @param startclass_sid
	 * @return 课程表
	 */
	public List<ClassCourse> selectClassCourseBySid(int startclass_sid) {
		return businessDaoInf.selectClassCourseBySid(startclass_sid);
	}

	/**
	 * 根据开班id添加课程表
	 * 
	 * @param startclass_sid
	 */
	public void addClassCourseBySid(int startclass_sid) {
		// 查询开班信息
		StartClass startclass = businessDaoInf.selectStartClassById(startclass_sid);
		// 获取技术方向开班最低周数
		// int weekmin = businessDaoInf.selecTechTimeBySid(startclass_sid);
		// 获得班级起止时间
		Date sstarttime = startclass.getStartclass_sstarttime();
		Date sendtime = startclass.getStartclass_sendtime();
		// 根据开班startclass_sid查询课程表的排序字段coursesys_systempath
		String systempath = businessDaoInf.selectSystempathBySid(startclass_sid);
		// 按,分割排序字段
		String[] splitsp = systempath.split(",");
		ClassCourse classcourse = new ClassCourse();
		// 给课表设置开班id
		classcourse.setStartclass_sid(startclass_sid);
		int oneday = 24 * 3600 * 1000;
		int oneweek = 6 * oneday;
		// 该班级共有多少周，少于一周按一周算
		int week = (int) ((sendtime.getTime() - sstarttime.getTime() - oneday) / (oneday * 7)) + 1;
		Long starttime;
		Long endtime = sstarttime.getTime() - oneday; // sendtime.getTime();
		// 总周数
		int count = 0;
		for (int i = 1; i < splitsp.length; i = i + 2) {
			count += Integer.parseInt(splitsp[i]);
			for (int j = 0; j < Integer.parseInt(splitsp[i]); j++) {
				classcourse.setClasscourse_name(splitsp[i - 1]);
				starttime = endtime + oneday;
				classcourse.setClasscourse_starttime(new Date(starttime));
				endtime = starttime + oneweek;
				classcourse.setClasscourse_endtime(new Date(endtime));
				businessDaoInf.addClassCourseBySid(classcourse);
			}
		}
		if (week - count > 0) {// 实际开班时间比课程体系时间长
			classcourse.setClasscourse_name("知识点复习");
			for (int i = 0; i < week - count - 1; i++) {
				starttime = endtime + oneday;
				classcourse.setClasscourse_starttime(new Date(starttime));
				endtime = starttime + oneweek;
				classcourse.setClasscourse_endtime(new Date(endtime));
				businessDaoInf.addClassCourseBySid(classcourse);
			}
			starttime = endtime + oneday;
			classcourse.setClasscourse_starttime(new Date(starttime));
			endtime = sendtime.getTime();
			classcourse.setClasscourse_endtime(new Date(endtime));
			businessDaoInf.addClassCourseBySid(classcourse);
		}

	}
}
